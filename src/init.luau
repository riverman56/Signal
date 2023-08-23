local Types = require(script.Types)
local create = require(script.create)

local SignalInterface: Types.SignalInterface = {
	create = create,
}

return table.freeze(SignalInterface)
