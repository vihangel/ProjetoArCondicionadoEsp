import 'package:asuka/asuka.dart';
import 'package:mobx/mobx.dart';

import 'dart:async';
import 'dart:io';
import 'package:dart_ipify/dart_ipify.dart';
part 'socket_handler.g.dart';

class SocketHandler = _SocketHandlerBase with _$SocketHandler;

abstract class _SocketHandlerBase with Store {
  @observable
  String ip = "192.168.4.2";

  @observable
  int port = 80;

  @observable
  Timer? _lastTimer;

  @observable
  Socket? _socketInstance;

  @action
  Future<Socket> _getInstance() async {
    // if (_socketInstance == null) {
    // final ipv4 = await Ipify.ipv4();
    // print("ipv4: $ipv4");
    _socketInstance = await Socket.connect(ip, port, sourcePort: 80);
    print("Socket: ${_socketInstance?.address}");
    print("Socket: ${_socketInstance?.port}");
    // }

    return _socketInstance!;
  }

  @action
  Future<void> _destroyInstance() async {
    await _socketInstance?.close();
    _socketInstance = null;
  }

  @action
  void _destroyAfterTime() {
    _lastTimer?.cancel();
    _lastTimer = Timer(const Duration(seconds: 2), _destroyInstance);
  }

//Aqui tem q ser chamado no ciclo de vida do widget eu acho
  @action
  void detroy() {
    _lastTimer?.cancel();
    _destroyInstance();
  }

  @action
  Future<void> sendMessage(String message) async {
    try {
      final socket = await _getInstance();

      socket.writeln(message);
      AsukaSnackbar.message(message).show();
      await socket.flush();

      _destroyAfterTime();
    } catch (e) {
      print("Erro ao enviar mensagem: $e");

      AsukaSnackbar.message("Erro ao enviar mensagem: $message, error: $e")
          .show();
      throw ("error");
    }
  }
}
