# Raptor

Raptor is a tiny Swift library for connecting and sending messages to an RCON server.
Raptor currently supports any socket-based connection that accepts stringified commands.

## Installation

Add the following to your Package.swift file:

```swift
.package(url: "https://github.com/craft-of-the-mines/Raptor.git", "1.0.0" ..< "2.0.0")
```

## Usage

Using Raptor is fairly straight-forward: create an instance and send commands, catching errors as they occur.

```swift
do {
    let rcon = try Raptor(host: "localhost", port: 5308, password: "password")
    try rcon.sendCommand("some command")
} catch {
    print(error)
}
```

The socket is automatically closed when the instance is deinitialized.
