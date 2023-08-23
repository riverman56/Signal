local Types = require(script.Parent.Types)

local function create(): Types.Signal
	local Signal = {
		_isFiring = false,
		_connections = {},
	}

	function Signal:subscribe(callback)
		local connection = {
			isDisconnected = false,
			callback = callback,
		}

		Signal._connections[callback] = connection

		return function()
			assert(not connection.isDisconnected, "Subscriptions can only be disconnected once")

			connection.isDisconnected = true
			Signal._connections[callback] = nil
		end
	end

	function Signal:fire(...)
		Signal._isFiring = true

		-- the list of connections is cloned, so that adding new connections
		-- mid-fire has no effect
		for callback, connection in table.clone(Signal._connections) do
			if not connection.isDisconnected then
				task.spawn(callback, ...)
			end
		end

		Signal._isFiring = false
	end

	return Signal
end

return create
