import 'package:flutter/material.dart';
import 'package:isw_implementacion_us_08_g5/models/CreditCardInformation.dart';
import 'package:isw_implementacion_us_08_g5/models/PaymentMethod.dart';
import 'package:isw_implementacion_us_08_g5/providers/PaymentInformation.dart';

class PaymentInformationValidator extends ChangeNotifier {
  bool _error;
  bool _amountError;
  bool _cardNumberError;
  bool _cardNameError;
  bool _cardExpirationDateError;
  bool _cardCodeError;

  static const EFECTIVO = 0;
  static const TARJETA = 1;
  static final List<PaymentMethod> _paymentMethods = [
    PaymentMethod("Efectivo"),
    PaymentMethod("Tarjeta de credito")
  ];

  PaymentInformationValidator() {
    _error = false;
    _amountError = false;
    _cardNumberError = false;
    _cardExpirationDateError = false;
    _cardNameError = false;
    _cardCodeError = false;
  }

  bool validateInformation(PaymentMethod paymentMethod, String amount,
      CreditCardInformation creditCardInformation) {
    if (paymentMethod == _paymentMethods[EFECTIVO]) {
      _validateAmount(amount);
    } else {
      if (paymentMethod == _paymentMethods[TARJETA]) {
        _validateCardNumber(creditCardInformation.getCardNumber);
        _validateCardName(creditCardInformation.getCardNumber);
        _validateCardExpirationDate(creditCardInformation.getExpirationDate);
        _validateCardCode(creditCardInformation.getCvc);
      }
    }
    return _error;
  }

  void _validateAmount(String amount) {
    if (amount.isEmpty) {
      this.setAmountError = true;
      this.setError = true;
    } else {
      this.setAmountError = false;
      this.setError = false;
    }
  }

  void _validateCardNumber(String cardNumber) {
    RegExp cardNumberRegex = RegExp(r'^4[0-9]{6,}$');
    if (cardNumber.isEmpty) {
      this.setCardNumberError = true;
      this.setError = true;
    }
    if (!cardNumberRegex.hasMatch(cardNumber)) {
      this.setCardNumberError = true;
      this.setError = true;
    } else {
      this.setCardNumberError = false;
      this.setError = false;
    }
  }

  void _validateCardName(String cardName) {
    if (cardName.isEmpty) {
      this.setCardNameError = true;
      this.setError = true;
    } else {
      this.setCardNameError = false;
      this.setError = false;
    }
  }

  void _validateCardExpirationDate(String expirationDate) {
    if (expirationDate.isEmpty) {
      this.setCardExpirationDateError = true;
      this.setError = true;
    } else {
      this.setCardExpirationDateError = false;
      this.setError = false;
    }
  }

  void _validateCardCode(String cardCode) {
    if (cardCode.isEmpty) {
      this.setCardCodeError = true;
      this.setError = true;
    } else {
      this.setCardCodeError = false;
      this.setError = false;
    }
  }

  // Getters
  bool get getAmountError => this._amountError;
  bool get getCardNumberError => this._cardNumberError;
  bool get getCardCodeError => this._cardCodeError;
  bool get getCardExpirationDateError => this._cardExpirationDateError;
  bool get getCardNameError => this._cardNameError;

  // Setters
  set setError(bool value) {
    this._error = value;
    notifyListeners();
  }

  set setAmountError(bool value) {
    this._amountError = value;
    notifyListeners();
  }

  set setCardNumberError(bool value) {
    this._cardNumberError = value;
    notifyListeners();
  }

  set setCardCodeError(bool value) {
    this._cardCodeError = value;
    notifyListeners();
  }

  set setCardNameError(bool value) {
    this._cardNameError = value;
    notifyListeners();
  }

  set setCardExpirationDateError(bool value) {
    this._cardExpirationDateError = value;
    notifyListeners();
  }

  set setErrorWithoutNotifyListeners(bool value) {
    this._error = value;
    this._amountError = value;
    this._cardCodeError = value;
    this._cardNameError = value;
    this._cardExpirationDateError = value;
    this._cardNumberError = value;
  }
}
