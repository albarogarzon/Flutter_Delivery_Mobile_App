import 'package:flutter/material.dart';
import 'package:isw_implementacion_us_08_g5/models/Direccion.dart';
import 'package:isw_implementacion_us_08_g5/providers/DireccionRetiroProvider.dart';
import 'package:provider/provider.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_place_picker/google_maps_place_picker.dart';

class MapsScreen extends StatefulWidget {
  MapsScreen();

  static final kInitialPosition = LatLng(-31.4567844, -64.183108);

  @override
  _MapsScreenState createState() => _MapsScreenState();
}

//CameraPosition _initialPosition = CameraPosition(target: LatLng(-31.8206, -64.8025));
//Completer<GoogleMapController> _controller = Completer();

//void _onMapCreated(GoogleMapController controller) {
//    _controller.complete(controller);
//}

class _MapsScreenState extends State<MapsScreen> {
  PickResult selectedPlace;

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
            title: Text("Seleccioná un punto en el mapa"),
            backgroundColor: Colors.redAccent),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                child: Text("Cargar Google Maps"),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return PlacePicker(
                          apiKey: "AIzaSyCv8gS5tnyK0W2jQB1C3bbBC5Fa6NTKIik",
                          initialPosition: MapsScreen.kInitialPosition,
                          useCurrentLocation: false,
                          selectInitialPosition: false,

                          //usePlaceDetailSearch: true,
                          onPlacePicked: (result) {
                            selectedPlace = result;
                            Navigator.of(context).pop();
                            setState(() {});
                          },
                          //forceSearchOnZoomChanged: true,
                          //automaticallyImplyAppBarLeading: false,
                          //autocompleteLanguage: "ko",
                          //region: 'au',
                          //selectInitialPosition: true,
/*                           selectedPlaceWidgetBuilder:
                              (_, selectedPlace, state, isSearchBarFocused) {
                            print(
                                "state: $state, isSearchBarFocused: $isSearchBarFocused");
                            return isSearchBarFocused
                                ? Container()
                                : FloatingCard(
                                    bottomPosition:
                                        0.0, // MediaQuery.of(context) will cause rebuild. See MediaQuery document for the information.
                                    leftPosition: 0.0,
                                    rightPosition: 0.0,
                                    width: 500,
                                    borderRadius: BorderRadius.circular(12.0),
                                    child: state == SearchingState.Searching
                                        ? Center(
                                            child: CircularProgressIndicator())
                                        : RaisedButton(
                                            child: const Text("Buscar Aquí"),
                                            onPressed: () {
                                              
                                              String text_humano = selectedPlace
                                                  .formattedAddress;
                                              // IMPORTANT: You MUST manage selectedPlace data yourself as using this build will not invoke onPlacePicker as
                                              //            this will override default 'Select here' Button.
                                              print(
                                                  "do something with [$text_humano] data");
                                              Navigator.of(context).pop();
                                            },
                                          ),
                                  );
                          }, */
                          // pinBuilder: (context, state) {
                          //   if (state == PinState.Idle) {
                          //     return Icon(Icons.favorite_border);
                          //   } else {
                          //     return Icon(Icons.favorite);
                          //   }
                          // },
                        );
                      },
                    ),
                  );
                },
              ),
              selectedPlace == null
                  ? Container()
                  : Text(selectedPlace.formattedAddress ?? ""),//----------- ACA ----------
              TextField(
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: selectedPlace.formattedAddress),
                    //"selectedPlace.formattedAddress" TIENE TEXTO CON DIRECCION human-readable
              )
            ],
          ),
        ));
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
