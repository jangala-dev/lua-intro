local sched = require 'lumen.sched'
local execdemo = require 'execdemo'

local exec = execdemo.nonblockexec

-- task prints from a long-running function
sched.run(function()
    exec('sh sleep.sh')
end)

-- task receives signals
sched.run(function()
    local waitd = {'an_event'}
    while true do
        local _, data = sched.wait(waitd)
        print(data)
    end
end)

-- task emits signals
sched.run(function()
    for i = 1, 5 do
        sched.signal('an_event', i)
        sched.sleep(1)
    end
end)

sched.loop()