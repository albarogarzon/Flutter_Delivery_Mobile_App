import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:isw_implementacion_us_08_g5/resources/Strings.dart';

class QueBuscamosScreen extends StatefulWidget {
  QueBuscamosScreen({Key key}) : super(key: key);

  @override
  _QueBuscamosScreenState createState() => _QueBuscamosScreenState();
}

class _QueBuscamosScreenState extends State<QueBuscamosScreen> {
  File _image;
  final picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    final bytes = await pickedFile.readAsBytes();
    print("BYTES:${bytes.length}");
    setState(() {
      _image = File(pickedFile.path);
    });
  }

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
            GridView.count(
              shrinkWrap: true,
              primary: false,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              crossAxisCount: 3,
              children: <Widget>[
                GestureDetector(
                  //-----------------------------------ACA
                  onTap: getImage,
                  child: Container(
                    color: Colors.black12,
                    child: _image == null || checkFileSize(_image.path) == false
                        ? Icon(Icons.add)
                        : Image.file(_image),
                  ),
                ),
              ],
            ),
            Spacer(),
            _buildSubmitButton()
          ],
        ),
      ),
    );
  }

  checkFileSize(path) {
    print("Entro a check");
    var fileSizeLimit = 5000000;
    File f = new File(path);
    var s = f.lengthSync();
    print(s); // returns in bytes
    var fileSizeInKB = s / 1024;
    // Convert the KB to MegaBytes (1 MB = 1024 KBytes)
    var fileSizeInMB = fileSizeInKB / 1024;

    if (s > fileSizeLimit) {
      print("File size greater than the limit$s");
      return false;
    } else {
      print("File can be selected$s");
      return true;
    }
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