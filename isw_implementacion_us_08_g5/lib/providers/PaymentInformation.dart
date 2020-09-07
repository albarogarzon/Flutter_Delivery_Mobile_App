import 'package:flutter/material.dart';
import 'package:isw_implementacion_us_08_g5/models/CreditCardInformation.dart';
import 'package:isw_implementacion_us_08_g5/models/PaymentMethod.dart';

class PaymentInformation extends ChangeNotifier {
  PaymentMethod _paymentMethod;
  String _amount;
  CreditCardInformation _creditCardInformation;
  bool _isReady;

  PaymentInformation() {
    this._paymentMethod = null;
    this._amount = '';
    this._creditCardInformation = null;
    _isReady = false;
  }

  // Getters
  bool get isReady => this._isReady;
  PaymentMethod get getPaymentMethod => this._paymentMethod;
  String get getAmount => this._amount;
  CreditCardInformation get getCreditCardInformation =>
      this._creditCardInformation;

  // Setters
  set setPaymentMethod(PaymentMethod paymentMethod) {
    this._paymentMethod = paymentMethod;
    notifyListeners();
  }

  set setAmount(String amount) {
    this._amount = amount;
  }

  set setCreditCardInformation(CreditCardInformation creditCardInformation) {
    this._creditCardInformation = creditCardInformation;
  }
}
