import 'package:flutter/material.dart';
import 'package:isw_implementacion_us_08_g5/models/Direccion.dart';
import 'package:isw_implementacion_us_08_g5/providers/PickupAddressInformation.dart';
import 'package:provider/provider.dart';
import 'package:credit_card_validate/credit_card_validate.dart';

class FormasDePagoScreen extends StatefulWidget {
  FormasDePagoScreen();

  @override
  _FormasDePagoScreenState createState() => _FormasDePagoScreenState();
}

class _FormasDePagoScreenState extends State<FormasDePagoScreen> {
  final List<String> listItemTitles = [
    "Crea tu pedido",
    "¿Qué buscamos?",
    "¿Dónde lo buscamos?",
    "¿Dónde lo entregamos?",
    "¿Cuando queres recibirlo?",
    "Forma de pago"
  ];

  String creditCardNumber = '';
  String cvvNumber = '';
  String expirationDate = '';
  IconData brandIcon;

  @override
  Widget build(BuildContext context) {
    Direccion direccionRetiro =
        Provider.of<PickupAddressInformation>(context).getDireccion;

    return Scaffold(
      appBar: AppBar(
          title: Text("Formas De Pago"), backgroundColor: Colors.redAccent),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              TextField(
                //CardNumber
                onChanged: (String str) {
                  setState(() {
                    creditCardNumber = str;
                  });
                  String brand = CreditCardValidator.identifyCardBrand(str);
                  IconData ccBrandIcon;
                  if (brand != null) {
                    if (brand == 'visa') {
                      ccBrandIcon = Icons.credit_card;
                    } else if (brand == 'master_card') {
                      ccBrandIcon = Icons.credit_card;
                      //ccBrandIcon = FontAwesomeIcons.ccMastercard;
                    } else if (brand == 'american_express') {
                      ccBrandIcon = Icons.credit_card;
                      //ccBrandIcon = FontAwesomeIcons.ccAmex;
                    } else if (brand == 'discover') {
                      ccBrandIcon = Icons.credit_card;
                      //ccBrandIcon = FontAwesomeIcons.ccDiscover;
                    }
                  }
                  setState(() {
                    brandIcon = ccBrandIcon;
                  });
                },
                decoration: InputDecoration(
                    labelText: 'Número de Tarjeta',
                    //suffixIcon: brandIcon != null ? FaIcon(brandIcon, size: 32,) : null),
                    suffixIcon: brandIcon != null
                        ? Icon(
                            brandIcon,
                            size: 32,
                          )
                        : null),
              ),
              SizedBox(
                height: 20,
              ),
              creditCardNumber.length < 16
                  ? Text('Por favor ingrese por lo menos 16 números')
                  : CreditCardValidator.isCreditCardValid(
                          cardNumber: creditCardNumber) && CreditCardValidator.identifyCardBrand(creditCardNumber) == 'visa'
                      ? Text(
                          'La tarjeta de crédito es válida',
                          style: TextStyle(color: Colors.green),
                        )
                      : Text(
                          'La tarjeta de crédito es inválida o no es VISA',
                          style: TextStyle(color: Colors.red),
                        ),
              TextField(
                //  CVV
                onChanged: (String str) {
                  setState(() {
                    cvvNumber = str;
                  });
                },
                decoration: InputDecoration(
                  labelText: 'CVV',
                  //suffixIcon: brandIcon != null ? FaIcon(brandIcon, size: 32,) : null),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              cvvNumber.length < 3
                  ? Text('Por favor ingrese por lo menos 3 números')
                  : Text(
                      'El número de CVV es válido',
                      style: TextStyle(color: Colors.green),
                    ),
              TextField(
                //CARD EXPIRATION
                onChanged: (String str) {
                  setState(() {
                    expirationDate = str;
                  });
                },
                decoration: InputDecoration(
                  labelText: 'MM/YY',
                ),
              ),
              SizedBox(
                height: 20,
              ),
              expirationDate.length != 5
                  ? Text('Por favor ingrese una fecha válida (MM/YY)')
                  : Text(
                      'La fecha de vencimiento es válida',
                      style: TextStyle(color: Colors.green),
                    ),
            ],
          ),
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.

      /*Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
              child: ListView(
            children: [
              ListItem(
                title: Text(
                  "Online",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
              _divider,
              MyCustomForm()
            ],
          )),
        ],
      ),*/
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

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
        key: _formKey,
        child: Column(children: <Widget>[
          // Add TextFormFields and RaisedButton here.
          TextFormField(
            // The validator receives the text that the user has entered.
            validator: (value) {
              if (value.isEmpty) {
                return 'Debes ingresar la calle y número de puerta';
              }
              return null;
            },
            decoration: InputDecoration(hintText: "Tarjeta,,,,"),
          ),
          TextFormField(
            decoration: InputDecoration(hintText: "tarjeta....."),
          ),
          TextFormField(
            decoration: InputDecoration(hintText: "tarjeta...."),
          ),
          TextFormField(
            validator: (value) {
              if (value.isEmpty) {
                return 'Debes ingresar las notas al repartidor';
              }
              return null;
            },
            decoration: InputDecoration(hintText: "Notas al repartidor"),
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
          ),
          _buildSubmitButton(),
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
    final PickupAddressInformation direccionRetiro =
        Provider.of<PickupAddressInformation>(context);
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

_buildSubmitButton() {
  return Container(
    width: double.maxFinite,
    child: RaisedButton(
      color: Colors.redAccent,
      onPressed: () {},
      child: const Text('Listo',
          style: TextStyle(fontSize: 20, color: Colors.white)),
    ),
  );
}
