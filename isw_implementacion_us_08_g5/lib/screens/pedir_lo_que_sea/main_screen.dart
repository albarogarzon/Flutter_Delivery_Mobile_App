import 'package:flutter/material.dart';
import 'package:isw_implementacion_us_08_g5/models/Direccion.dart';
import 'package:isw_implementacion_us_08_g5/providers/InformacionEntrega.dart';
import 'package:isw_implementacion_us_08_g5/providers/InformacionRetiro.dart';
import 'package:isw_implementacion_us_08_g5/resources/Strings.dart';
import 'package:isw_implementacion_us_08_g5/screens/pedir_lo_que_sea/QueBuscamosScreen.dart';
import 'package:isw_implementacion_us_08_g5/screens/pedir_lo_que_sea/dondeBuscar_screen.dart';
import 'package:isw_implementacion_us_08_g5/screens/pedir_lo_que_sea/dondeEntregar_screen.dart';
import 'package:isw_implementacion_us_08_g5/screens/pedir_lo_que_sea/queBuscar_screen.dart';
import 'package:provider/provider.dart';

class PedirLoQueSeaMainScreen extends StatelessWidget {
  InformacionRetiro _direccionRetiroProvider;
  InformacionEntrega _informacionEntrega;
  @override
  Widget build(BuildContext context) {
    _direccionRetiroProvider = Provider.of<InformacionRetiro>(context);
    _informacionEntrega = Provider.of<InformacionEntrega>(context);
    Direccion direccionRetiro = _direccionRetiroProvider.getDireccion;

    return Scaffold(
      appBar: AppBar(
          title: Text(Strings.PEDI_LO_QUE_SEA),
          backgroundColor: Colors.redAccent),
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
                    Strings.CREA_TU_PEDIDO,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
                _divider,
                ListTile(
                  title: Text(Strings.DONDE_LO_BUSCAMOS),
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
                  title: Text(Strings.DONDE_LO_ENTREGAMOS),
                  trailing: Icon(Icons.edit, color: Colors.redAccent),
                  subtitle: _informacionEntrega.getCalle.isEmpty
                      ? null
                      : Text(_informacionEntrega.getCalle),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DondeEntregarScreen()));
                  },
                ),
                _divider,
                ListTile(
                  title: Text(Strings.QUE_BUSCAMOS),
                  trailing: Icon(Icons.edit, color: Colors.redAccent),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => QueBuscamosScreen()));
                  },
                ),
                _divider,
                ListTile(
                  title: Text(Strings.CUANDO_QUERES_RECIBIRLO),
                  trailing: Icon(Icons.edit, color: Colors.redAccent),
                ),
                _divider,
                ListTile(
                  title: Text(Strings.FORMA_DE_PAGO),
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
