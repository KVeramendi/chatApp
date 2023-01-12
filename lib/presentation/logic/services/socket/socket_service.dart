import 'package:flutter/cupertino.dart';
import 'package:flutter_chat_app/data/datasources/local/auth_local.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

enum ServerStatus { online, offline, conecting }

class SocketService with ChangeNotifier {
  ServerStatus _serverStatus = ServerStatus.conecting;
  IO.Socket? _socket;

  ServerStatus get serverStatus => _serverStatus;

  IO.Socket get socket => _socket!;
  Function get emit => _socket!.emit;

  void connect() async {
    final token = await Auth.instance.accessToken;
    _socket = IO.io(
        'http://192.168.0.6:3000/',
        IO.OptionBuilder()
            .setTransports(['websocket'])
            .enableForceNew()
            .enableAutoConnect()
            .setExtraHeaders({'Auth': token})
            .build());

    _socket!.onConnect((_) {
      _serverStatus = ServerStatus.online;
      notifyListeners();
    });

    _socket!.onDisconnect((_) {
      _serverStatus = ServerStatus.offline;
      notifyListeners();
    });
  }

  void disconnect() {
    _socket!.disconnect();
  }
}
