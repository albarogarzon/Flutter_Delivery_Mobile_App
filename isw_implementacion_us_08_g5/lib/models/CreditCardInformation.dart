class CreditCardInformation {
  String _number;
  String _firstName;
  String _lastName;
  DateTime _expirationDate;
  String _cvc;

  CreditCardInformation(this._number, this._firstName, this._lastName,
      this._expirationDate, this._cvc);

  // Getters
  String get getCardNumber => this._number;
  String get getFirstName => this._firstName;
  String get getLastName => this._lastName;
  String get getCvc => this._cvc;
  DateTime get getExpirationDate => this._expirationDate;

  // Setters
  set setCardNumber(String number) {
    this._number = number;
  }

  set setFirstName(String firstName) {
    this._firstName = firstName;
  }

  set setLastName(String lastName) {
    this._lastName = lastName;
  }

  set setCvc(String cvc) {
    this._cvc = cvc;
  }

  set setExpirationDate(DateTime expirationDate) {
    this._expirationDate = expirationDate;
  }
}
