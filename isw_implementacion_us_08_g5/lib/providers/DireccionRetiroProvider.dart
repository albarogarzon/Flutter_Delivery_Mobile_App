import 'package:flutter/material.dart';
import 'package:isw_implementacion_us_08_g5/models/Direccion.dart';

class DireccionRetiroProvider extends ChangeNotifier {
  Direccion _direccion;

  DireccionRetiroProvider() {
    this._direccion = Direccion();
  }

  Direccion get getDireccion => _direccion;

  void setDireccion(Direccion direccion) {
    this._direccion = direccion;
    notifyListeners();
  }

  void setCalle(String calle) {
    this._direccion.calle = calle;
    notifyListeners();
  }

  void setTelefono(int telefono) {
    this._direccion.telefono = telefono;
  }
}
