import 'package:flutter/material.dart';
import 'package:isw_implementacion_us_08_g5/models/Direccion.dart';

class InformacionEntrega extends ChangeNotifier {
  Direccion _direccion;
  String _telefono;
  bool _isReady;

  InformacionEntrega() {
    this._direccion = Direccion();
    this._telefono = '';
    this._isReady = false;
  }

  // Getters
  Direccion get getDireccion => _direccion;
  String get getTelefono => this._telefono;
  bool get isReady => _isReady;
  String get getCalle => _direccion.getCalle;

  // Setters

  setDireccion(Direccion direccion) {
    this._direccion = direccion;
    notifyListeners();
  }

  set setCalle(String calle) {
    this._direccion.setCalle = calle;
    this._isReady = true;
    notifyListeners();
  }

  set setTelefono(String telefono) {
    this._telefono = telefono;
    notifyListeners();
  }
}
