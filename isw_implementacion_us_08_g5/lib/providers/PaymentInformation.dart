import 'package:flutter/material.dart';
import 'package:isw_implementacion_us_08_g5/models/CreditCardInformation.dart';
import 'package:isw_implementacion_us_08_g5/models/PaymentMethod.dart';
import 'package:isw_implementacion_us_08_g5/providers/ProductInformation.dart';
import 'package:isw_implementacion_us_08_g5/validators/PaymentInformationValidator.dart';

class PaymentInformation extends ChangeNotifier {
  PaymentMethod _paymentMethod;
  String _amount;
  CreditCardInformation _creditCardInformation;
  bool _isReady;
  ProductInformation _productInformation;
  PaymentInformationValidator _paymentInformationValidator;

  PaymentInformation(
      this._productInformation, this._paymentInformationValidator) {
    this._paymentMethod = null;
    this._amount = '';
    this._creditCardInformation = CreditCardInformation("", "", "", "");
    _isReady = false;
  }

  bool validateInformation(
    PaymentMethod paymentMethod,
    String amount,
    CreditCardInformation creditCardInformation,
  ) {
    return _paymentInformationValidator.validateInformation(
        paymentMethod, amount, creditCardInformation);
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
