import 'package:asuka/snackbars/asuka_snack_bar.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:splash_ifmt/data/models/controle/controle_model.dart';

import '../socket/socket_handler.dart';

part 'controle_controller.g.dart';

class ControleController = _ControleControllerBase with _$ControleController;

abstract class _ControleControllerBase with Store {
  @observable
  List<ControleModel> controleInfos = [];

  @observable
  int temperatura = 24;

  @action
  Future<void> initialize() async {
    getData();
    PermissionStatus status = await Permission.location.request();

    await Permission.nearbyWifiDevices.request();
    if (status != PermissionStatus.granted) {
      AsukaSnackbar.message("Permissão para salvar o arquivo não concedida")
          .show();

      // return;
    }
  }

  final socketController = Modular.get<SocketHandler>();

  @action
  Future<void> setTemperatura(int value) async {
    controleInfos[0].temperatura = controleInfos[0].temperatura + value;
    temperatura = value + controleInfos[0].temperatura;
    print(controleInfos[0].temperatura.toString());
    await socketController.sendMessage(temperatura.toString());
  }

  @action
  void getData() {
    if (controleInfos.isEmpty) {
      controleInfos.clear();
      controleInfos.add(ControleModel(
          bloco: "Bloco B",
          humidade: 40,
          sala: 'Sala 03',
          status: 'Ativa',
          temperatura: 24));
    }
    temperatura = controleInfos[0].temperatura;
  }
}
