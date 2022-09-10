import 'dart:async';
import 'dart:io';

class SocketHandler {
  final String ip;
  final int port;
  Timer? _lastTimer;
  Socket? _socketInstance;

  SocketHandler(this.ip, this.port);

  Future<Socket> _getInstance() async {
    if (_socketInstance == null) {
      _socketInstance = await Socket.connect(ip, port);
    }

    return _socketInstance!;
  }

  Future<void> _destroyInstance() async {
    await _socketInstance?.close();
    _socketInstance = null;
  }

  void _destroyAfterTime() {
    _lastTimer?.cancel();
    _lastTimer = Timer(const Duration(seconds: 2), _destroyInstance);
  }

  void detroy() {
    _lastTimer?.cancel();
    _destroyInstance();
  }

  Future<void> sendMessage(String message) async {
    final socket = await _getInstance();
    socket.writeln(message);
    await socket.flush();

    _destroyAfterTime();
    _lastTimer = Timer(const Duration(seconds: 2), _destroyInstance);
  }
}
