import 'package:flutter/material.dart';
import 'package:isw_implementacion_us_08_g5/models/Direccion.dart';
import 'package:isw_implementacion_us_08_g5/providers/InformacionRetiro.dart';
import 'package:provider/provider.dart';

class CuandoScreen extends StatefulWidget {
  CuandoScreen();

  @override
  _CuandoScreenState createState() => _CuandoScreenState();
}

enum Eleccion { antesPosible, personalizado }

class _CuandoScreenState extends State<CuandoScreen> {
  Eleccion _eleccion = Eleccion.antesPosible;

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
        Provider.of<InformacionRetiro>(context).getDireccion;

    return Scaffold(
      appBar: AppBar(
          title: Text("¿Cuándo lo buscamos?"),
          backgroundColor: Colors.redAccent),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
              child: ListView(
            children: [
              ListTile(
                title: const Text('Lo antes posible'),
                leading: Radio(
                  value: Eleccion.antesPosible,
                  groupValue: _eleccion,
                  onChanged: (Eleccion value) {
                    setState(() {
                      _eleccion = value;
                    });
                  },
                ),
              ),
              ListTile(
                title: const Text('Personalizado'),
                leading: Radio(
                  value: Eleccion.personalizado,
                  groupValue: _eleccion,
                  onChanged: (Eleccion value) {
                    setState(() {
                      _eleccion = value;
                    });
                  },
                ),
              ),
              MyCustomForm()
            ],
          ))
        ],
      ),
    );
  }
}

// Define a custom Form widget.
class MyCustomForm extends StatefulWidget {
  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

// Define a corresponding State class.
// This class holds data related to the form.
class MyCustomFormState extends State<MyCustomForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a `GlobalKey<FormState>`,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();
  bool _disable = true; // set this to false initially

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
        key: _formKey,
        child: Column(children: <Widget>[
          // Add TextFormFields and RaisedButton here.
          TextFormField(
            // The validator receives the text that the user has entered.
            enabled: !_disable, // set to false to disable it.
            validator: (value) {
              if (value.isEmpty) {
                return 'Debes ingresar un rango horario';
              }
              return null;
            },
            decoration: InputDecoration(hintText: "Rango Horario"),
          ),
          RaisedButton(
            onPressed: () {
              // Validate returns true if the form is valid, otherwise false.
              if (_formKey.currentState.validate()) {
                // If the form is valid, display a snackbar. In the real world,
                // you'd often call a server or save the information in a database.

                Scaffold.of(context)
                    .showSnackBar(SnackBar(content: Text('Processing Data')));
              }
            },
            child: Text('Listo'),
          )
        ]));
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
    final InformacionRetiro direccionRetiro =
        Provider.of<InformacionRetiro>(context);
    controller.text = direccionRetiro.getDireccion.getCalle;
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {
        // direccionRetiro.setCalle(controller.text);
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
