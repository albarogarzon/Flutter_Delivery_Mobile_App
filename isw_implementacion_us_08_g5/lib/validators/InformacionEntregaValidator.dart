import 'package:flutter/cupertino.dart';

class InformacionEntregaValidator extends ChangeNotifier {
  bool _validatorError;

  InformacionEntregaValidator() {
    this._validatorError = false;
  }

  void validateFields(String calle) {
    if (calle.isEmpty) {
      this._validatorError = true;
      notifyListeners();
    } else {
      this._validatorError = false;
      notifyListeners();
    }
  }

  set error(bool value) {
    this._validatorError = value;

    notifyListeners();
  }

  bool get error => this._validatorError;
}
