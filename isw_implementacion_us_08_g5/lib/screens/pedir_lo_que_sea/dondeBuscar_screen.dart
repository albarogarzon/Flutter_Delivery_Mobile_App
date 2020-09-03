import 'package:flutter/material.dart';
import 'package:google_maps_place_picker/google_maps_place_picker.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:isw_implementacion_us_08_g5/models/Direccion.dart';
import 'package:isw_implementacion_us_08_g5/providers/DireccionRetiroProvider.dart';
import 'package:isw_implementacion_us_08_g5/validators/field_validator.dart';
import 'package:provider/provider.dart';

class DondeBuscarScreen extends StatefulWidget {
  @override
  _DondeBuscarScreenState createState() => _DondeBuscarScreenState();
}

class _DondeBuscarScreenState extends State<DondeBuscarScreen> {
  PickResult selectedPlace;
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
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
          title: Text("¿Dónde lo buscamos?"),
          backgroundColor: Colors.redAccent),
      body: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        margin: EdgeInsets.only(top: 10, right: 10, left: 10),
        child: Column(
          verticalDirection: VerticalDirection.down,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [_buildForm(), Spacer(), _buildSubmitButton()],
        ),
      ),
    );
  }

  _buildSubmitButton() {
    return Container(
      width: double.maxFinite,
      child: RaisedButton(
        color: Colors.redAccent,
        onPressed: _onPressedSubmit,
        child: const Text('Listo',
            style: TextStyle(fontSize: 20, color: Colors.white)),
      ),
    );
  }

  _buildForm() {
    return Column(
      verticalDirection: VerticalDirection.down,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        TextField(
          controller: _calleFieldController,
          decoration: InputDecoration(
            suffixIcon: IconButton(
                icon: Icon(Icons.my_location),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return PlacePicker(
                      apiKey: 'AIzaSyCv8gS5tnyK0W2jQB1C3bbBC5Fa6NTKIik',
                      initialPosition: LatLng(-31.4567844, -64.183108),
                      useCurrentLocation: false,
                      selectInitialPosition: false,
                      onPlacePicked: (result) {
                        selectedPlace = result;
                        Navigator.of(context).pop();
                        setState(() {});
                      },
                    );
                  }));
                }),
            labelText: 'Calle y número',
            errorText: _validator.error ? "Debe ingresar calle y numero" : null,
          ),
        ),
        TextField(
          decoration: InputDecoration(labelText: 'Departamento'),
        ),
        TextField(
          decoration: InputDecoration(labelText: 'Teléfono'),
        ),
        TextField(
          decoration: InputDecoration(
              labelText: 'Referencias',
              helperText: "Ej: Calles cercanas, ¿Por quién preguntamos?"),
        ),
      ],
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
);
