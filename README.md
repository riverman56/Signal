# Signal
A bare-bones signal implementation with publish/subscribe functionality.
This library was inspired by the [signal implementation found in Roact.](https://github.com/Roblox/roact/blob/beb0bc2706b307b04204abdcf129385fd3cb3e6f/src/createSignal.lua)

```lua
local Signal = require(path.to.Signal)

local signal = Signal.new()
signal:subscribe(function()
    print("Hello World!")
end)

signal:fire()
-- output: Hello World!
```