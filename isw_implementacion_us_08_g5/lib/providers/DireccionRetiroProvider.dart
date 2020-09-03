import 'package:flutter/material.dart';
import 'package:isw_implementacion_us_08_g5/models/Direccion.dart';

class DireccionRetiroProvider extends ChangeNotifier {
  Direccion _direccion;

  DireccionRetiroProvider() {
    this._direccion = Direccion();
  }

  // Getters
  Direccion get getDireccion => _direccion;

  setDireccion(Direccion direccion) {
    this._direccion = direccion;
    notifyListeners();
  }

  set calle(String calle) {
    this._direccion.calle = calle;
    notifyListeners();
  }

  set setTelefono(int telefono) {
    this._direccion.telefono = telefono;
    notifyListeners();
  }
}
