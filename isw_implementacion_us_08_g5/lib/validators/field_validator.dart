import 'package:flutter/cupertino.dart';

class FieldValidator extends ChangeNotifier {
  bool _validatorError;

  FieldValidator() {
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
  }

  bool get error => this._validatorError;
}
