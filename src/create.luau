local Types = require(script.Parent.Types)

--[=[
	@class Signal
	A simple publish/subscribe architecture implementation
]=]

--- @prop _isFiring boolean
--- @within Signal
--- @private
--- A flag indicating whether or not the signal is currently firing

local function create(): Types.Signal
	local Signal = {
		_isFiring = false,
		_connections = {},
	}

	--[=[
		Registers a callback to be invoked when the signal is fired.

		@param callback (...any) -> () -- The callback to be invoked

		@return () -> () -- A function that disconnects the callback
	]=]
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

	--[=[
		Invokes all currently subscribed callbacks. Note that, if a callback is
		subscribed mid-fire, it will not be invoked during that firing.
		Callbacks are invoked using
		[`task.spawn`](https://create.roblox.com/docs/reference/engine/libraries/task#spawn),
		so it's okay to yield inside a callback.
	]=]
	function Signal:fire(...: any)
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
