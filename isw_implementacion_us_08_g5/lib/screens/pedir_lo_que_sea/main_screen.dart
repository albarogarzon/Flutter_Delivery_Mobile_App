import 'package:flutter/material.dart';
import 'package:isw_implementacion_us_08_g5/models/Direccion.dart';
import 'package:isw_implementacion_us_08_g5/providers/DireccionRetiroProvider.dart';
import 'package:isw_implementacion_us_08_g5/screens/pedir_lo_que_sea/dondeBuscar_screen.dart';
import 'package:isw_implementacion_us_08_g5/screens/pedir_lo_que_sea/queBuscar_screen.dart';
import 'package:provider/provider.dart';

class PedirLoQueSeaMainScreen extends StatelessWidget {
  DireccionRetiroProvider _direccionRetiroProvider;
  @override
  Widget build(BuildContext context) {
    _direccionRetiroProvider = Provider.of<DireccionRetiroProvider>(context);
    Direccion direccionRetiro = _direccionRetiroProvider.getDireccion;

    return Scaffold(
      appBar: AppBar(
          title: Text("Pedí lo que sea"), backgroundColor: Colors.redAccent),
      body: Column(
        verticalDirection: VerticalDirection.down,
        textDirection: TextDirection.ltr,
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 8,
            child: ListView(
              children: [
                ListTile(
                  title: Text(
                    "Crea tu pedido",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
                _divider,
                ListTile(
                  title: Text("¿Dónde lo buscamos?"),
                  subtitle: direccionRetiro.getCalle.isEmpty
                      ? null
                      : Text(direccionRetiro.getCalle),
                  trailing: Icon(Icons.edit, color: Colors.redAccent),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DondeBuscarScreen()));
                  },
                ),
                _divider,
                ListTile(
                  title: Text("¿Dónde lo entregamos?"),
                  trailing: Icon(Icons.edit, color: Colors.redAccent),
                ),
                _divider,
                ListTile(
                  title: Text("¿Qué buscamos?"),
                  trailing: Icon(Icons.edit, color: Colors.redAccent),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => QueBuscarScreen()));
                  },
                ),
                _divider,
                ListTile(
                  title: Text("¿Cuándo queres recibirlo?"),
                  trailing: Icon(Icons.edit, color: Colors.redAccent),
                ),
                _divider,
                ListTile(
                  title: Text("Forma de pago"),
                  trailing: Icon(Icons.edit, color: Colors.redAccent),
                ),
                _divider,
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: SizedBox(
              width: double.infinity,
              child: RaisedButton(
                  elevation: 0,
                  child: Text(
                    "Enviar pedido",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.white),
                  ),
                  color: Colors.redAccent,
                  onPressed: _onPressedEnviar),
            ),
          )
        ],
      ),
    );
  }

  _onPressedEnviar() {
    if (_direccionRetiroProvider.isReady) {
      print("Enviando pedido");
    } else {
      print("chupala puto");
    }
  }
}

final Divider _divider = Divider(
  color: Colors.grey,
  indent: 10,
  height: 0,
);
