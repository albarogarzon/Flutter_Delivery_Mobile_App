import 'package:flutter/material.dart';
import 'package:isw_implementacion_us_08_g5/models/Direccion.dart';
import 'package:isw_implementacion_us_08_g5/providers/DireccionRetiroProvider.dart';
import 'package:provider/provider.dart';

class PedirLoQueSeaMainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Direccion direccionRetiro =
        Provider.of<DireccionRetiroProvider>(context).getDireccion;

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
                  subtitle: direccionRetiro.calle.isEmpty
                      ? null
                      : Text(direccionRetiro.calle),
                  trailing: Icon(Icons.edit, color: Colors.redAccent),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SecondScreenTest()));
                  },
                ),
                _divider,
                ListTile(
                  title: Text("¿Dónde lo entregamos?"),
                  trailing: Icon(Icons.edit, color: Colors.redAccent),
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
                  onPressed: () {
                    print("Peidido Enviado");
                  }),
            ),
          )
        ],
      ),
    );
  }
}

final Divider _divider = Divider(
  color: Colors.grey,
  indent: 10,
  height: 0,
);

class SecondScreenTest extends StatefulWidget {
  SecondScreenTest();

  @override
  _SecondScreenTestState createState() => _SecondScreenTestState();
}

class _SecondScreenTestState extends State<SecondScreenTest> {
  final controller = TextEditingController();
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final DireccionRetiroProvider direccionRetiro =
        Provider.of<DireccionRetiroProvider>(context);
    controller.text = direccionRetiro.getDireccion.calle;
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {
        direccionRetiro.setCalle(controller.text);
      }),
      body: Center(
          child: Container(
        child: TextField(
          controller: controller,
        ),
        width: 100,
        height: 50,
      )),
    );
  }
}
