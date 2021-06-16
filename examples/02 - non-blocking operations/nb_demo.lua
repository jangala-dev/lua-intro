local sched = require 'lumen.sched'
local exec = require 'libs.execdemo'

local command = 'sh libs/sleep.sh'

-- task prints from a long-running function
sched.run(function()
    sched.sleep(2)
    print("first let's use the blocking execution")
    exec.blockexec(command)
    sched.sleep(2)
    print("now let's switch to the nonblocking execution")
    exec.nonblockexec(command)
end)

-- the following shows that tasks can be nested, this simple routine can be thought of as the regular
-- 'business' of the system that can be blocked or not blocked 
sched.run(function()
    sched.run(function()
        local waitd = {'an_event'}
        while true do
            local _, data = sched.wait(waitd)
            print(data)
        end
    end)
    
    -- task emits signals
    sched.run(function()
        for i = 1, 15 do
            sched.signal('an_event', i)
            sched.sleep(1)
        end
        os.exit()
    end)    
end)




sched.loop()