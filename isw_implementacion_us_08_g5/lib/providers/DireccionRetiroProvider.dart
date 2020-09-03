import 'package:flutter/material.dart';
import 'package:isw_implementacion_us_08_g5/models/Direccion.dart';

class DireccionRetiroProvider extends ChangeNotifier {
  Direccion _direccion;
  bool _isReady;

  DireccionRetiroProvider() {
    this._direccion = Direccion();
    this._isReady = false;
  }

  // Getters
  Direccion get getDireccion => _direccion;
  bool get isReady => _isReady;

  setDireccion(Direccion direccion) {
    this._direccion = direccion;
    notifyListeners();
  }

  set calle(String calle) {
    this._direccion.calle = calle;
    this._isReady = true;
    notifyListeners();
  }

  set setTelefono(int telefono) {
    this._direccion.telefono = telefono;
    notifyListeners();
  }
}
