local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Signal = require(ReplicatedStorage.Packages.Signal)

local TEST_PAYLOAD = { 1, false, "abc", {} }

return function()
	describe("create", function()
		it("should invoke subscriber callbacks and disconnect them", function()
			local signal = Signal.create()
			local callCount = 0

			local payload = {}

			local disconnect = signal:subscribe(function(...)
				payload = { ... }
				callCount += 1
			end)

			signal:fire(table.unpack(TEST_PAYLOAD))

			expect(#payload).to.equal(#TEST_PAYLOAD)

			for index, value in payload do
				expect(value).to.equal(TEST_PAYLOAD[index])
			end

			disconnect()

			signal:fire()

			expect(callCount).to.equal(1)
		end)

		it("should handle multiple subscribers", function()
			local signal = Signal.create()

			local callCountA = 0
			local callCountB = 0

			local disconnectA = signal:subscribe(function()
				callCountA += 1
			end)

			local disconnectB = signal:subscribe(function()
				callCountB += 1
			end)

			signal:fire()

			expect(callCountA).to.equal(1)
			expect(callCountB).to.equal(1)

			disconnectA()

			signal:fire()

			expect(callCountA).to.equal(1)
			expect(callCountB).to.equal(2)

			disconnectB()

			signal:fire()

			expect(callCountA).to.equal(1)
			expect(callCountB).to.equal(2)
		end)

		it("should not fire a subscription callback that has been disconnected mid-fire", function()
			local signal = Signal.create()

			local callCount = 0

			local disconnectA
			local disconnectB

			disconnectA = signal:subscribe(function()
				callCount += 1
				disconnectB()
			end)

			disconnectB = signal:subscribe(function()
				callCount += 1
				disconnectA()
			end)

			signal:fire()

			expect(callCount).to.equal(1)
		end)

		it("should allow new subscriptions mid-fire, but not invoke their callbacks", function()
			local signal = Signal.create()

			local callCountA = 0
			local callCountB = 0

			local disconnectA
			local disconnectB

			disconnectA = signal:subscribe(function()
				callCountA += 1
				if not disconnectB then
					disconnectB = signal:subscribe(function()
						callCountB += 1
					end)
				end
			end)

			signal:fire()

			expect(callCountA).to.equal(1)
			expect(callCountB).to.equal(0)

			signal:fire()

			expect(callCountA).to.equal(2)
			expect(callCountB).to.equal(1)

			disconnectB()

			signal:fire()

			expect(callCountA).to.equal(3)
			expect(callCountB).to.equal(1)

			disconnectA()

			expect(callCountA).to.equal(3)
			expect(callCountB).to.equal(1)
		end)

		it("should maintain 1 subscription if the same callback is subscribed multiple times", function()
			local signal = Signal.create()

			local callCount = 0

			local function callback()
				callCount += 1
			end

			local disconnectA = signal:subscribe(callback)

			signal:fire()

			expect(callCount).to.equal(1)

			local disconnectB = signal:subscribe(callback)

			signal:fire()

			expect(callCount).to.equal(2)

			disconnectB()

			expect(callCount).to.equal(2)

			disconnectA()
			signal:fire()

			expect(callCount).to.equal(2)
		end)

		it("should disconnect a subscriber after firing once if using the :once() shorthand", function()
			local signal = Signal.create()

			local callCount = 0

			signal:once(function()
				callCount += 1
			end)

			signal:fire()

			expect(callCount).to.equal(1)

			signal:fire()

			expect(callCount).to.equal(1)
		end)
	end)
end
