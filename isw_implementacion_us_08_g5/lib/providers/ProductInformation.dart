import 'package:flutter/cupertino.dart';

class ProductInformation extends ChangeNotifier {
  String _descripcion;
  String _value;
  bool _isReady;

  ProductInformation() {
    _descripcion = '';
    _value = '';
    _isReady = false;
  }
  // Getters
  String get getDescripcion => this._descripcion;
  String get getValue => this._value;
  bool get isReady => _isReady;

  // Setters
  set setDescripcion(String descripcion) {
    this._descripcion = descripcion;
    notifyListeners();
  }

  set setValue(String value) {
    this._value = value;
  }
}
