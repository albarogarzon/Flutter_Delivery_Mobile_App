class Direccion {
  String calle;
  int telefono;

  Direccion() {
    this.calle = '';
    this.telefono = null;
  }

  String get getCalle => this.calle;
  int get getTelefono => this.telefono;
}
