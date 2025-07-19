# WebSocket Chat Application

## Overview

This is a simple terminal-based chat application that demonstrates WebSocket communication in Dart. The application consists of a server and multiple clients that can connect to it. Users can join the chat with a username and exchange messages with other connected clients.

## Features

- Real-time messaging between multiple clients
- Username-based identification
- Connection notifications when users join
- Terminal-based interface

## Getting Started

### Prerequisites

- Dart SDK installed on your machine

### Running the Application

1. Navigate to the project directory:

```bash
cd web_socket
```

2. Start the server:

```bash
dart ./bin/server.dart
```

The server will start and display a message for each new client connection, including IP address and port.

3. Start a client in a new terminal window:

```bash
dart ./bin/client.dart
```

4. When prompted, enter a username for the chat session.

## How It Works

- When a client connects, they are asked to provide a username
- The server confirms the login with: `Server: You are logged in as {username}`
- All other connected clients receive a notification: `Server: {username} joined the party!`
- Clients and server can then exchange messages in real-time


## Project Structure

- `bin/server.dart` - WebSocket server implementation
- `bin/client.dart` - Client application for connecting to the server
- `bin/terminal_service.dart` - Handles the color of the terminal output print statements

## License

This project is licensed under the MIT License - see the LICENSE file for details.
