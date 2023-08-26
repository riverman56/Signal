[license-shield]: https://img.shields.io/github/license/riverman56/signal
[license-url]: https://github.com/riverman56/signal/blob/master/LICENSE.txt

[release-shield]: https://img.shields.io/github/v/release/riverman56/signal?sort=semver
[release-url]: https://github.com/riverman56/signal/releases/latest

[ci-status-shield]: https://img.shields.io/github/actions/workflow/status/riverman56/signal/ci.yml?label=CI
[ci-status-url]: https://github.com/riverman56/signal/actions/workflows/ci.yml

[cd-status-shield]: https://img.shields.io/github/actions/workflow/status/riverman56/signal/release.yml?label=CD
[cd-status-url]: https://github.com/riverman56/signal/actions/workflows/release.yml

# Signal
[![License][license-shield]][license-url]
[![Release][release-shield]][release-url]
[![CI][ci-status-shield]][ci-status-url]
[![CI][cd-status-shield]][cd-status-url]

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