import 'package:flutter/material.dart';
import 'package:isw_implementacion_us_08_g5/models/Direccion.dart';
import 'package:isw_implementacion_us_08_g5/providers/DireccionRetiroProvider.dart';
import 'package:isw_implementacion_us_08_g5/validators/field_validator.dart';
import 'package:provider/provider.dart';

class DondeBuscarScreen extends StatefulWidget {
  @override
  _DondeBuscarScreenState createState() => _DondeBuscarScreenState();
}

class _DondeBuscarScreenState extends State<DondeBuscarScreen> {
  TextEditingController _ciudadTextFieldController;
  TextEditingController _telefonoFieldController;
  TextEditingController _calleFieldController;

  FieldValidator _validator;
  DireccionRetiroProvider _direccionRetiroProvider;

  @override
  void initState() {
    _direccionRetiroProvider =
        Provider.of<DireccionRetiroProvider>(context, listen: false);
    _calleFieldController = TextEditingController(
        text: _direccionRetiroProvider.getDireccion.getCalle);

    super.initState();
  }

  @override
  void dispose() {
    _validator.error = false;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _validator = Provider.of<FieldValidator>(context);

    return Scaffold(
      appBar: AppBar(
          title: Text("¿Dónde lo buscamos?"),
          backgroundColor: Colors.redAccent),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
              child: ListView(
            children: [
              TextField(
                controller: _calleFieldController,
                decoration: InputDecoration(
                  labelText: 'Calle y número de puerta',
                  errorText:
                      _validator.error ? "Debe ingresar calle y numero" : null,
                ),
              ),
              _divider,
              TextFormField(
                decoration: InputDecoration(labelText: 'Departamento'),
              ),
              _divider,
              TextFormField(
                decoration: InputDecoration(labelText: 'Teléfono'),
              ),
              _divider,
              TextFormField(
                decoration: InputDecoration(labelText: 'Referencias'),
              ),
              _divider
            ],
          )),
          RaisedButton(
            onPressed: _onPressedSubmit,
            child: const Text('Listo', style: TextStyle(fontSize: 20)),
          ),
        ],
      ),
    );
  }

  void _onPressedSubmit() {
    if (this.mounted) {
      String calle = this._calleFieldController.text;
      _validator.validateFields(calle);
      if (_validator.error) {
        return;
      } else {
        this._direccionRetiroProvider.calle = calle;
      }
    }
  }
}

final Divider _divider = Divider(
  color: Colors.grey,
  indent: 10,
  height: 0,
);
