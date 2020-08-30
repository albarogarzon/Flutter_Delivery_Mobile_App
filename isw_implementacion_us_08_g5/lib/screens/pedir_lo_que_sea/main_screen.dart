import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:isw_implementacion_us_08_g5/models/Direccion.dart';
import 'package:isw_implementacion_us_08_g5/providers/DireccionRetiroProvider.dart';
import 'package:provider/provider.dart';

class PedirLoQueSeaMainScreen extends StatefulWidget {
  PedirLoQueSeaMainScreen();

  @override
  _PedirLoQueSeaMainScreenState createState() =>
      _PedirLoQueSeaMainScreenState();
}

class _PedirLoQueSeaMainScreenState extends State<PedirLoQueSeaMainScreen> {
  final List<String> listItemTitles = [
    "Crea tu pedido",
    "¿Qué buscamos?",
    "¿Dónde lo buscamos?",
    "¿Dónde lo entregamos?",
    "¿Cuando queres recibirlo?",
    "Forma de pago"
  ];

  @override
  Widget build(BuildContext context) {
    Direccion direccionRetiro =
        Provider.of<DireccionRetiroProvider>(context).getDireccion;

    return Scaffold(
      appBar: AppBar(
          title: Text("Pedí lo que sea"), backgroundColor: Colors.redAccent),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: ListView(
              children: [
                ListItem(
                  title: Text(
                    "Crea tu pedido",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
                _divider,
                ListItem(
                  title: Text("¿Dónde lo buscamos?"),
                  subtitle: direccionRetiro.calle.isEmpty
                      ? null
                      : Text(direccionRetiro.calle),
                  icon: Icon(Icons.edit, color: Colors.redAccent),
                ),
                _divider,
                ListItem(
                  title: Text("¿Dónde lo entregamos?"),
                  icon: Icon(Icons.edit, color: Colors.redAccent),
                ),
                _divider,
                ListItem(
                  title: Text("¿Cuándo queres recibirlo?"),
                  icon: Icon(Icons.edit, color: Colors.redAccent),
                ),
                _divider,
                ListItem(
                  title: Text("Forma de pago"),
                  icon: Icon(Icons.edit, color: Colors.redAccent),
                ),
                _divider,
              ],
            ),
          ),
          RaisedButton(onPressed: null)
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

class ListItem extends StatelessWidget {
  final Widget title;
  final Icon icon;
  final Widget subtitle;
  final Function onTap;
  ListItem({this.onTap, this.subtitle, this.icon, this.title});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => SecondScreenTest()));
      },
      subtitle: this.subtitle != null ? this.subtitle : null,
      title: this.title != null ? this.title : null,
      trailing: this.icon != null ? this.icon : null,
    );
  }
}

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
