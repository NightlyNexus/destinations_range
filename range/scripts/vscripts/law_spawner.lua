--[[
	Handles entity scripts on LAWs spawned by the point_template.
	
	Copyright (c) 2016 Rectus
	
	Permission is hereby granted, free of charge, to any person obtaining a copy
	of this software and associated documentation files (the "Software"), to deal
	in the Software without restriction, including without limitation the rights
	to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
	copies of the Software, and to permit persons to whom the Software is
	furnished to do so, subject to the following conditions:
	
	The above copyright notice and this permission notice shall be included in
	all copies or substantial portions of the Software.
	
	THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
	IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
	FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
	AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
	LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
	OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
	THE SOFTWARE.
]]--

function PostSpawn(this, entities)
	-- The spawn callback returns all entities it has ever spawned.
	for i, entity in pairs(entities)
	do
	  	if not entity:IsNull() and not entity:GetOrCreatePrivateScriptScope().OnPickedUp
	  	then
	  		DoEntFireByInstanceHandle(entity, "RunScriptFile", "tool_law", 0, nil, nil)
	  		DoEntFireByInstanceHandle(entity, "CallScriptFunction", "DelaySpawn", 0, nil, nil)
	  	end
	end
end

thisEntity:SetSpawnCallback(PostSpawn, thisEntity)