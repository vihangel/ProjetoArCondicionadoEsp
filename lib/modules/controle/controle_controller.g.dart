// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'controle_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ControleController on _ControleControllerBase, Store {
  final _$controleInfosAtom =
      Atom(name: '_ControleControllerBase.controleInfos');

  @override
  List<ControleModel> get controleInfos {
    _$controleInfosAtom.reportRead();
    return super.controleInfos;
  }

  @override
  set controleInfos(List<ControleModel> value) {
    _$controleInfosAtom.reportWrite(value, super.controleInfos, () {
      super.controleInfos = value;
    });
  }

  final _$temperaturaAtom = Atom(name: '_ControleControllerBase.temperatura');

  @override
  int get temperatura {
    _$temperaturaAtom.reportRead();
    return super.temperatura;
  }

  @override
  set temperatura(int value) {
    _$temperaturaAtom.reportWrite(value, super.temperatura, () {
      super.temperatura = value;
    });
  }

  final _$initializeAsyncAction =
      AsyncAction('_ControleControllerBase.initialize');

  @override
  Future<void> initialize() {
    return _$initializeAsyncAction.run(() => super.initialize());
  }

  final _$setTemperaturaAsyncAction =
      AsyncAction('_ControleControllerBase.setTemperatura');

  @override
  Future<void> setTemperatura(int value) {
    return _$setTemperaturaAsyncAction.run(() => super.setTemperatura(value));
  }

  final _$_ControleControllerBaseActionController =
      ActionController(name: '_ControleControllerBase');

  @override
  void getData() {
    final _$actionInfo = _$_ControleControllerBaseActionController.startAction(
        name: '_ControleControllerBase.getData');
    try {
      return super.getData();
    } finally {
      _$_ControleControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
controleInfos: ${controleInfos},
temperatura: ${temperatura}
    ''';
  }
}
