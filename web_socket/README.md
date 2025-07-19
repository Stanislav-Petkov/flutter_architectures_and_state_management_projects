cd web_socket

start the server:

dart ./bin/server.dart

for every new connection there is print statement with ip and port

start a client
dart ./bin/client.dart
The client asks for a userName in the terminal and sends it to the server.
The server responds by writing to the client :
'Server: You are logged in as $username'

When a new client makes a connection and enters his username,
the other clients receive a message:
'Server: $username joined the party!'
