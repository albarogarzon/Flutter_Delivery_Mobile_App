import 'package:flutter/cupertino.dart';
import 'package:isw_implementacion_us_08_g5/enums/screens_enum.dart';
import 'package:isw_implementacion_us_08_g5/providers/DeliveryAddressInformation.dart';
import 'package:isw_implementacion_us_08_g5/providers/PickupAddressInformation.dart';

class MainController extends ChangeNotifier {
  final DeliveryAddressInformation _deliveryAddressInformation;
  final PickupAddressInformation _pickupAddressInformation;
  bool _isAllOk;

  MainController(
      this._deliveryAddressInformation, this._pickupAddressInformation) {
    _isAllOk = false;
  }

  void validate() {
    if (_deliveryAddressInformation.isReady &&
        _pickupAddressInformation.isReady) {}
  }

  bool isValid() {
    if (_deliveryAddressInformation.isReady &&
        _pickupAddressInformation.isReady) {
      return true;
    } else {
      return false;
    }
  }

  Screens whoIsNotReady() {
    if (!_pickupAddressInformation.isReady) {
      return Screens.DondeLoBuscamosScreen;
    } else {
      if (!_deliveryAddressInformation.isReady) {
        return Screens.DondeLoEntregamosScreen;
      }
    }
  }

  // Getters
  bool get isAllOk => this._isAllOk;

  // Setters
  set isAllOk(bool value) {
    _isAllOk = value;
  }
}
