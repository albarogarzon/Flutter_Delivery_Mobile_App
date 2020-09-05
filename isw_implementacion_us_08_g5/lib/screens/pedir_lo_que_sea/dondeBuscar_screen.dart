import 'package:flutter/material.dart';
import 'package:google_maps_place_picker/google_maps_place_picker.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:isw_implementacion_us_08_g5/components/ListoButton.dart';
import 'package:isw_implementacion_us_08_g5/models/Direccion.dart';
import 'package:isw_implementacion_us_08_g5/providers/InformacionRetiro.dart';
import 'package:isw_implementacion_us_08_g5/resources/Strings.dart';
import 'package:isw_implementacion_us_08_g5/validators/InformacionRetiroValidator.dart';
import 'package:provider/provider.dart';

class DondeBuscarScreen extends StatefulWidget {
  @override
  _DondeBuscarScreenState createState() => _DondeBuscarScreenState();
}

class _DondeBuscarScreenState extends State<DondeBuscarScreen> {
  PickResult selectedPlace;
  TextEditingController _telefonoFieldController;
  TextEditingController _calleFieldController;

  InformacionRetiroValidator _validator;
  InformacionRetiro _informacionRetiro;

  @override
  void initState() {
    _validator =
        Provider.of<InformacionRetiroValidator>(context, listen: false);
    _validator.setErrorWithoutNotifyListeners = false;
    _informacionRetiro = Provider.of<InformacionRetiro>(context, listen: false);
    _calleFieldController =
        TextEditingController(text: _informacionRetiro.getDireccion.getCalle);
    _telefonoFieldController =
        TextEditingController(text: _informacionRetiro.getTelefono.toString());
    super.initState();
  }

  @override
  void dispose() {
    _calleFieldController.dispose();
    _telefonoFieldController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
          centerTitle: true,
          title: Text(Strings.DONDE_LO_BUSCAMOS),
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

  _buildForm() {
    return Column(
      verticalDirection: VerticalDirection.down,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        Selector<InformacionRetiroValidator, bool>(
          selector: (
            _,
            validator,
          ) =>
              validator.getCalleFieldError,
          builder: (_, error, __) => TextField(
            controller: _calleFieldController,
            decoration: InputDecoration(
              suffixIcon: IconButton(
                icon: Icon(Icons.my_location),
                onPressed: _onPressedSelectAddress,
              ),
              labelText: Strings.CALLE_Y_NUMERO,
              errorText: error ? Strings.CALLE_Y_NUMERO_ERROR : null,
            ),
          ),
        ),
        TextField(
          decoration: InputDecoration(labelText: Strings.PISO),
        ),
        TextField(
          decoration: InputDecoration(labelText: Strings.DEPARTAMENTO),
        ),
        Selector<InformacionRetiroValidator, bool>(
            selector: (
              _,
              validator,
            ) =>
                validator.getTelefonoFieldError,
            builder: (_, error, __) => TextField(
                  controller: _telefonoFieldController,
                  decoration: InputDecoration(
                      errorText: error ? Strings.TELEFONO_ERROR : null,
                      labelText: Strings.TELEFONO,
                      helperText: Strings.TELEFONO_HELPER_TEXT),
                )),
        TextField(
          decoration: InputDecoration(
              labelText: Strings.REFERENCIAS,
              helperText: Strings.REFERENCIAS_HELPER_TEXT),
        ),
      ],
    );
  }

  _buildSubmitButton() {
    return ListoButton(
      onPressed: _onPressedSubmit,
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
          _calleFieldController.text = result.formattedAddress;

          Navigator.of(context).pop();
        },
      );
    }));
  }

  void _onPressedSubmit() {
    InformacionRetiroValidator validator =
        Provider.of<InformacionRetiroValidator>(context, listen: false);
    if (this.mounted) {
      String calle = this._calleFieldController.text;
      String telefono = this._telefonoFieldController.text;
      validator.validateFields(calle, telefono);
      if (validator.error) {
        return;
      } else {
        this._informacionRetiro.setCalle = calle;
        Navigator.of(context).pop();
      }
    }
  }
}

final Divider _divider = Divider(
  color: Colors.grey,
);
