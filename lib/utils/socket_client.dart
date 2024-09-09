// ignore_for_file: library_prefixes

import 'package:socket_io_client/socket_io_client.dart' as IO;

class SocketClient {
  IO.Socket? socket;
  static SocketClient? _instance;

  SocketClient._internal() {
    socket = IO.io('http://192.168.222.217:3000', IO.OptionBuilder().setTransports(['websocket']).disableAutoConnect().build());
    socket!.connect();

    // Add event listeners
    // socket!.onConnect((_) {
    //   print('Connected to server');
    // });
    // socket!.onDisconnect((_) {
    //   print('Disconnected from server');
    // });
    // socket!.onConnectError((error) {
    //   print('Connection error: $error');
    // });
  }

  static SocketClient get instance {
    // if(_instance == null){
    //   _instance = SocketClient._internal();
    // }
    _instance ??= SocketClient._internal(); // ! short for above message
    return _instance!;
  }
}
