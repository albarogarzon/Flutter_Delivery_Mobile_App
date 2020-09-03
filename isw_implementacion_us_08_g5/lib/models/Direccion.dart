class Direccion {
  String _calle;
  String _ciudad;
  String _referencias;
  int _telefono;

  Direccion() {
    this._calle = '';
    this._telefono = null;
    this._ciudad = "";
    this._referencias = '';
  }

  Direccion.withParameters(
      this._calle, this._ciudad, this._telefono, this._referencias);

// Getters
  String get getCalle => this._calle;
  int get getTelefono => this._telefono;
  String get getCiudad => this._ciudad;
  String get getReferencias => this._referencias;

// Setters
  set calle(String calle) {
    this._calle = calle;
  }

  set telefono(int telefono) {
    this._telefono = telefono;
  }

  set ciudad(String ciudad) {
    this._ciudad = ciudad;
  }

  set referencias(String referencias) {
    this._referencias = referencias;
  }
}
