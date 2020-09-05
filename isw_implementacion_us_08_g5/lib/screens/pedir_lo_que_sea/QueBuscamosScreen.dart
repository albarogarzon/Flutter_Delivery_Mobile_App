import 'package:flutter/material.dart';
import 'package:isw_implementacion_us_08_g5/resources/Strings.dart';

class QueBuscamosScreen extends StatefulWidget {
  QueBuscamosScreen({Key key}) : super(key: key);

  @override
  _QueBuscamosScreenState createState() => _QueBuscamosScreenState();
}

class _QueBuscamosScreenState extends State<QueBuscamosScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
          centerTitle: true,
          title: Text(Strings.QUE_BUSCAMOS),
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
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Ingresá una descripción'),
            ),
            _buildTitle(),
            _divider,
            Spacer(),
            _buildSubmitButton()
          ],
        ),
      ),
    );
  }

  _buildSubmitButton() {
    return Container(
      width: double.maxFinite,
      child: RaisedButton(
        color: Colors.redAccent,
        onPressed: () {},
        child: const Text('Listo',
            style: TextStyle(fontSize: 20, color: Colors.white)),
      ),
    );
  }

  _buildTitle() {
    return Container(
      margin: EdgeInsets.only(top: 10),
      width: double.infinity,
      child: Text(
        "Subí una foto",
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }

  final Divider _divider = Divider(
    color: Colors.grey,
  );
}
