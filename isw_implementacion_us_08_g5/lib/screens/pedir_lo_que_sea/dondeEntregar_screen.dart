import 'package:flutter/material.dart';
import 'package:google_maps_place_picker/google_maps_place_picker.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:isw_implementacion_us_08_g5/models/Direccion.dart';
import 'package:isw_implementacion_us_08_g5/providers/InformacionEntrega.dart';
import 'package:isw_implementacion_us_08_g5/providers/InformacionRetiro.dart';
import 'package:isw_implementacion_us_08_g5/validators/InformacionEntregaValidator.dart';
import 'package:isw_implementacion_us_08_g5/validators/InformacionRetiroValidator.dart';
import 'package:provider/provider.dart';

class DondeEntregarScreen extends StatefulWidget {
  DondeEntregarScreen();

  @override
  _DondeEntregarScreenState createState() => _DondeEntregarScreenState();
}

class _DondeEntregarScreenState extends State<DondeEntregarScreen> {
  InformacionEntrega _informacionEntrega;
  InformacionEntregaValidator _validator;
  TextEditingController _addressTextFiedlController;

  @override
  void initState() {
    _informacionEntrega =
        Provider.of<InformacionEntrega>(context, listen: false);
    _addressTextFiedlController =
        TextEditingController(text: _informacionEntrega.getDireccion.getCalle);
    super.initState();
  }

  @override
  void dispose() {
    _validator.error = false;
    _addressTextFiedlController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _validator = Provider.of<InformacionEntregaValidator>(context);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
          centerTitle: true,
          title: Text("¿Dónde entregamos?"),
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
          controller: _addressTextFiedlController,
          decoration: InputDecoration(
            suffixIcon: IconButton(
              icon: Icon(Icons.my_location),
              onPressed: _onPressedSelectAddress,
            ),
            labelText: 'Calle y número',
            errorText: _validator.error ? "Debe ingresar calle y numero" : null,
          ),
        ),
        TextField(
          decoration: InputDecoration(labelText: 'Piso'),
        ),
        TextField(
          decoration: InputDecoration(labelText: 'Departamento'),
        ),
        TextField(
          decoration: InputDecoration(
              labelText: 'Teléfono',
              helperText:
                  "Para poder llamarte ante cualquier problema con tu pedido",
              errorText:
                  _validator.error ? "Debe ingresar calle y numero" : null),
        ),
        TextField(
          decoration: InputDecoration(
              labelText: 'Referencias',
              helperText: "Ej: Calles cercanas, ¿Por quién preguntamos?"),
        ),
      ],
    );
  }

  void _onPressedSelectAddress() {
    _validator.error = _validator.error ? false : false;
    print(_validator.error);
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return PlacePicker(
        apiKey: 'AIzaSyCv8gS5tnyK0W2jQB1C3bbBC5Fa6NTKIik',
        initialPosition: LatLng(-31.4567844, -64.183108),
        useCurrentLocation: false,
        selectInitialPosition: false,
        onPlacePicked: (result) {
          _addressTextFiedlController.text = result.formattedAddress;

          Navigator.of(context).pop();
        },
      );
    }));
  }

  void _onPressedSubmit() {
    if (this.mounted) {
      String calle = this._addressTextFiedlController.text;
      _validator.validateFields(calle);
      if (_validator.error) {
        return;
      } else {
        this._informacionEntrega.setCalle = calle;
        Navigator.of(context).pop();
      }
    }
  }
}

final Divider _divider = Divider(
  color: Colors.grey,
  indent: 10,
  height: 0,
);
