import 'package:asuka/asuka.dart';
import 'package:mobx/mobx.dart';

import 'dart:async';
import 'dart:io';
import 'package:dart_ipify/dart_ipify.dart';
part 'socket_handler.g.dart';

class SocketHandler = _SocketHandlerBase with _$SocketHandler;

abstract class _SocketHandlerBase with Store {
  @observable
  String ip = "192.168.4.1";

  @observable
  int port = 5000;

  @observable
  Timer? _lastTimer;

  @observable
  Socket? _socketInstance;

  @action
  Future<Socket> _getInstance() async {
    _socketInstance = await Socket.connect(ip, port, sourcePort: 5000);
    print("Socket: ${_socketInstance?.address}");
    print("Socket: ${_socketInstance?.port}");

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
    _lastTimer = Timer(const Duration(milliseconds: 500), _destroyInstance);
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
      // final socket = await _getInstance();

      // socket.writeln(message);
      // AsukaSnackbar.message(message).show();
      // await socket.flush();

      // _destroyAfterTime();
      final completer = Completer<String>();
      final socket = await Socket.connect(ip, port, sourcePort: 5000);

      socket.listen((event) {
        final response = String.fromCharCodes(event);
        completer.complete(response);
      }, onDone: () {
        socket.destroy();
      }, onError: (err) {
        completer.completeError(err);
        socket.destroy();
      });

      socket.write(message);

      // return completer.future;
    } catch (e) {
      print("Erro ao enviar mensagem: $e");

      AsukaSnackbar.message("Erro ao enviar mensagem: $message, error: $e")
          .show();
      throw ("error");
    }
  }
}
