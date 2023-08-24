type Callback = (...any) -> ()
type Disconnector = () -> ()

type Connections = { [Callback]: {
	isDisconnected: boolean,
	callback: Callback,
} }

export type Signal = {
	_isFiring: boolean,
	_connections: Connections,

	fire: (...any) -> (),
	subscribe: (Callback) -> Disconnector,
}

export type SignalInterface = {
	create: () -> Signal,
}

return {}
