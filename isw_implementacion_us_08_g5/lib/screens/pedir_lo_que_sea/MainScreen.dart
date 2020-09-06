import 'package:flutter/material.dart';
import 'package:isw_implementacion_us_08_g5/controllers/MainController.dart';
import 'package:isw_implementacion_us_08_g5/enums/screens_enum.dart';
import 'package:isw_implementacion_us_08_g5/models/Direccion.dart';
import 'package:isw_implementacion_us_08_g5/providers/DeliveryAddressInformation.dart';
import 'package:isw_implementacion_us_08_g5/providers/DeliveryTimeInformation.dart';
import 'package:isw_implementacion_us_08_g5/providers/PickupAddressInformation.dart';
import 'package:isw_implementacion_us_08_g5/resources/Strings.dart';
import 'package:isw_implementacion_us_08_g5/screens/pedir_lo_que_sea/FormaDePagoScreen.dart';
import 'package:isw_implementacion_us_08_g5/screens/pedir_lo_que_sea/QueBuscamosScreen.dart';
import 'package:isw_implementacion_us_08_g5/screens/pedir_lo_que_sea/CuandoQueresRecibirloScreen.dart';
import 'package:isw_implementacion_us_08_g5/screens/pedir_lo_que_sea/DondeLoBuscamosScreen.dart';
import 'package:isw_implementacion_us_08_g5/screens/pedir_lo_que_sea/DondeLoEntregamosScreen.dart';

import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  PickupAddressInformation _direccionRetiroProvider;

  DeliveryAddressInformation _informacionEntrega;

  DeliveryTimeInformation _deliveryTimeInformation;

  MainController _mainController;

  @override
  Widget build(BuildContext context) {
    _direccionRetiroProvider = Provider.of<PickupAddressInformation>(context);
    _informacionEntrega = Provider.of<DeliveryAddressInformation>(context);
    _mainController = Provider.of<MainController>(context);
    _deliveryTimeInformation = Provider.of<DeliveryTimeInformation>(context);
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
                            builder: (context) => DondeLoBuscamosScreen()));
                  },
                ),
                _divider,
                ListTile(
                  title: Text(Strings.DONDE_LO_ENTREGAMOS),
                  trailing: Icon(Icons.edit, color: Colors.redAccent),
                  subtitle: _informacionEntrega.getDireccion.getCalle.isEmpty
                      ? null
                      : Text(_informacionEntrega.getDireccion.getCalle),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DondeLoEntregamosScreen()));
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
                  subtitle: Text(
                      _deliveryTimeInformation.getSelectedTime.getTimeValue),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                CuandoQueresRecibirloScreen()));
                  },
                ),
                _divider,
                ListTile(
                  title: Text(Strings.FORMA_DE_PAGO),
                  trailing: Icon(Icons.edit, color: Colors.redAccent),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => FormaDePagoScreen()));
                  },
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
    if (_mainController.isValid()) {
      print("Enviando pedido");
    } else {
      switch (_mainController.whoIsNotReady()) {
        case Screens.DondeLoBuscamosScreen:
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => DondeLoBuscamosScreen()));
          break;
        case Screens.DondeLoEntregamosScreen:
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => DondeLoEntregamosScreen()));
          break;
        case Screens.QueBuscamosScreen:
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => QueBuscamosScreen()));
          break;
        case Screens.FormaDePagoScreen:
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => FormaDePagoScreen()));
          break;
        default:
      }
    }
  }
}

final Divider _divider = Divider(
  color: Colors.grey,
  indent: 10,
  height: 0,
);