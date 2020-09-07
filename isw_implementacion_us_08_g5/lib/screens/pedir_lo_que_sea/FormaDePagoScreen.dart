import 'package:flutter/material.dart';
import 'package:isw_implementacion_us_08_g5/models/Direccion.dart';
import 'package:isw_implementacion_us_08_g5/models/PaymentMethod.dart';
import 'package:isw_implementacion_us_08_g5/providers/PaymentInformation.dart';
import 'package:isw_implementacion_us_08_g5/providers/PickupAddressInformation.dart';
import 'package:isw_implementacion_us_08_g5/resources/Strings.dart';
import 'package:provider/provider.dart';
import 'package:credit_card_validate/credit_card_validate.dart';

class FormaDePagoScreen extends StatefulWidget {
  FormaDePagoScreen();

  @override
  _FormaDePagoScreenState createState() => _FormaDePagoScreenState();
}

class _FormaDePagoScreenState extends State<FormaDePagoScreen> {
  PaymentInformation _paymentInformation;
  PaymentMethod _selectedPaymentMethod;
  TextEditingController _amountFieldController;
  bool _amoutTextFieldEnabled = true;

  final List<PaymentMethod> _paymentMethods = [
    PaymentMethod('Efectivo'),
    PaymentMethod('Tarjeta de crédito')
  ];

  String creditCardNumber = '';
  String cvvNumber = '';
  String expirationDate = '';
  IconData brandIcon;

  @override
  void initState() {
    _paymentInformation = Provider.of<PaymentInformation>(
      context,
      listen: false,
    );
    _selectedPaymentMethod = _paymentInformation.getPaymentMethod;
    _amountFieldController =
        TextEditingController(text: _paymentInformation.getAmount);

    super.initState();
  }

  @override
  void dispose() {
    _amountFieldController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Direccion direccionRetiro =
        Provider.of<PickupAddressInformation>(context).getDireccion;

    return Scaffold(
      appBar: AppBar(
          title: Text("Formas De Pago"), backgroundColor: Colors.redAccent),
      body: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        margin: EdgeInsets.only(top: 10, right: 10, left: 10),
        child: Column(
          verticalDirection: VerticalDirection.down,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            _buildTitle("Seleccioná la forma de pago"),
            _divider,
            _buildPaymentMethodRadioButtons(),
            _buildTitle("Información de pago"),
            _divider,
            _buildPaymentInformation()
          ],
        ),
      ),
    );
  }

  _buildPaymentInformation() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          enabled: _amoutTextFieldEnabled,
          controller: _amountFieldController,
          keyboardType: TextInputType.number,
          decoration:
              InputDecoration(labelText: Strings.CON_CUANTO_VAS_A_PAGAR),
        )
      ],
    );
  }

  _buildPaymentMethodRadioButtons() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RadioListTile(
            activeColor: Colors.redAccent,
            title: Text(Strings.EFECTIVO),
            value: _paymentMethods[0],
            groupValue: _selectedPaymentMethod,
            onChanged: (paymentMethod) {
              setState(() {
                _selectedPaymentMethod = paymentMethod;
                if (_paymentMethods[0] == paymentMethod) {
                  _amoutTextFieldEnabled = true;
                } else {
                  _amoutTextFieldEnabled = false;
                }
              });
            }),
        RadioListTile(
            activeColor: Colors.redAccent,
            title: Text(Strings.TARJETA_DE_CREDITO),
            value: _paymentMethods[1],
            groupValue: _selectedPaymentMethod,
            onChanged: (paymentMethod) {
              setState(() {
                _selectedPaymentMethod = paymentMethod;
                // if (_paymentMethods[1] == paymentMethod) {
                //   _amoutTextFieldEnabled = false;
                // } else {
                //   _amoutTextFieldEnabled = true;
                // }
              });
            })
      ],
    );
  }

  _buildTitle(String titulo) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      width: double.infinity,
      child: Text(
        titulo,
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }

  final Divider _divider = Divider(
    height: 0,
    color: Colors.grey,
  );
}
