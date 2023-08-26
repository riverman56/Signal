# Signal
A bare-bones signal implementation with publish/subscribe functionality.
This library was inspired by the [signal implementation found in Roact.](https://github.com/Roblox/roact/blob/beb0bc2706b307b04204abdcf129385fd3cb3e6f/src/createSignal.lua)

## Example
```lua
local Signal = require(path.to.Signal)

local signal = Signal.new()
signal:subscribe(function(message: string)
    print(message)
end)

signal:fire("Hello World!")
-- output: Hello World!
```
See the [Signal API](https://riverman56.github.io/signal/api/Signal) for more info

## Installation
Install the Signal package through Wally.
```toml
Signal = "riverman56/signal@<version>"
```