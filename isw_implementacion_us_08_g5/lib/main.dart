import 'package:flutter/material.dart';
import 'package:isw_implementacion_us_08_g5/controllers/MainController.dart';
import 'package:isw_implementacion_us_08_g5/providers/DeliveryAddressInformation.dart';
import 'package:isw_implementacion_us_08_g5/screens/pedir_lo_que_sea/QueBuscamosScreen.dart';
import 'package:isw_implementacion_us_08_g5/screens/pedir_lo_que_sea/dondeEntregar_screen.dart';
import 'package:isw_implementacion_us_08_g5/screens/pedir_lo_que_sea/formasDePago_screen.dart';

import 'package:isw_implementacion_us_08_g5/screens/pedir_lo_que_sea/main_screen.dart';
import 'package:isw_implementacion_us_08_g5/screens/pedir_lo_que_sea/queBuscar_screen.dart';

import 'package:isw_implementacion_us_08_g5/validators/DeliveryAddressInformationValidator.dart';
import 'package:isw_implementacion_us_08_g5/validators/PickupAddressInformationValidator.dart';
import 'package:provider/provider.dart';

import 'providers/PickupAddressInformation.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
            value: PickupAddressInformationValidator()),
        ChangeNotifierProvider.value(
            value: DeliveryAddressInformationValidator()),
        ChangeNotifierProvider.value(value: PickupAddressInformation()),
        ChangeNotifierProvider.value(value: DeliveryAddressInformation()),
        ChangeNotifierProxyProvider2<PickupAddressInformation,
                DeliveryAddressInformation, MainController>(
            create: (BuildContext context) => MainController(null, null),
            update: (context, pickupAddressInformation,
                    deliveryAddressInformation, mainController) =>
                MainController(
                    deliveryAddressInformation, pickupAddressInformation))
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: DondeEntregarScreen(),
      ),
    );
  }
}

