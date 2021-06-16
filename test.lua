local sched = require 'lumen.sched'
local stream = require 'lumen.stream'
local selector = require "lumen.tasks.selector"

-- initialises the module with the 'nixio' backend
selector.init({service='nixio'})


function rPrint(s, l, i) -- recursive Print (structure, limit, indent)
	l = (l) or 100; i = i or "";	-- default item limit, indent string
	if (l<1) then print "ERROR: Item limit reached."; return l-1 end;
	local ts = type(s);
	if (ts ~= "table") then print (i,ts,s); return l-1 end
	print (i,ts);           -- print "table"
	for k,v in pairs(s) do  -- print "[KEY] VALUE"
		l = rPrint(v, l, i.."\t["..tostring(k).."]");
		if (l < 0) then break end
	end
	return l
end	


-- -- a stream is a specialised pipe for strings
-- local s = stream.new(1)

-- -- task pipes long running output
-- sched.run(function()
--     local a = selector.grab_stdout('sh sleep.sh', '*l', s)
-- end)

-- -- task prints from the pipe
-- sched.run(function()
--     while true do
--         local a, b, c = s:read()
--         if a ~= nil then
--             print ("R1", a)
--         else
--             -- stream ended
--             return
--         end
--     end
-- end)

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

-- let's see what's active
sched.run(function()
    for i = 1, 10 do
        print("scheduler table") 
        rPrint(sched.tasks)
        sched.sleep(1)
    end
end)


sched.loop()