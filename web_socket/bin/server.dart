import 'dart:io';
import 'dart:typed_data';
import 'terminal_service.dart';

Future<void> main() async {
  final ip = InternetAddress.anyIPv4;
  final server = await ServerSocket.bind(ip, 3000);
  print('Server is running on : ${ip.address}:${server.port}');

  server.listen((Socket event) {
    handleConnection(event);
  });
}

List<Socket> clients = [];
void handleConnection(Socket client) {
  printGreen(
    "Server: Connection from ${client.remoteAddress.address}: ${client.remotePort}",
  );

  client.listen(
    (Uint8List data) {
      final message = String.fromCharCodes(data);
      for (final client in clients) {
        client.write("Server: $message joined the party!");
      }

      clients.add(client);
      client.write('Server: You are logged in as $message');
    },
    onError: (error) {
      printRed(error);
      client.close();
    },
    onDone: () {
      printWarning('Server: Client left');
      client.close();
    },
  );
}
