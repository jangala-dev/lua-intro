local stream = require 'lumen.stream'
local selector = require 'lumen.tasks.selector'.init({service='nixio'})
local sched = require 'lumen.sched'



local M = {}    -- creating module namespace

function M.blockexec (command)
    f = assert (io.popen (command))
    
    for line in f:lines() do
        print(line)
    end -- for loop
    
    f:close()
end

function M.nonblockexec (command)
    -- a stream is a specialised pipe for strings
    local s = stream.new(1)

    -- task pipes long running output
    sched.run(function()
        local a = selector.grab_stdout(command, '*l', s)
    end)

    -- task prints from the pipe
    sched.run(function()
        while true do
            local a, b, c = s:read()
            if a ~= nil then
                print (a)
            else
                -- stream ended
                return
            end
        end
    end)
end

return M