import 'package:isw_implementacion_us_08_g5/models/Ciudad.dart';

class Direccion {
  Ciudad _ciudad;
  String _calle;
  int _piso;
  int _numeroDepartamento;
  String _referencias;

  Direccion() {
    this._ciudad = Ciudad();
    this._calle = '';
    this._piso = null;
    this._numeroDepartamento = null;
    this._referencias = '';
  }

  Direccion.withParameters(this._ciudad, this._calle,
      {String referencias, int piso, int numeroDepto}) {
    this._referencias = referencias == null ? "" : referencias;
  }

// Getters
  String get getCalle => this._calle;
  Ciudad get getCiudad => this._ciudad;
  String get getReferencias => this._referencias;
  int get getPiso => this._piso;
  int get getNumDepartamento => this._numeroDepartamento;

// Setters
  set setCalle(String calle) {
    this._calle = calle;
  }

  set setCiudad(Ciudad ciudad) {
    this._ciudad = ciudad;
  }

  set setPiso(int piso) {
    this._piso = piso;
  }

  set setNumDepartamento(int numeroDepto) {
    this._numeroDepartamento = numeroDepto;
  }

  set setReferencias(String referencias) {
    this._referencias = referencias;
  }
}
