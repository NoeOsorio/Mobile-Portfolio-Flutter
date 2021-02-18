import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobile_portfolio/day15/Lienzo.dart';

class ImageLoader extends StatefulWidget {
  @override
  _ImageLoaderState createState() => _ImageLoaderState();
}

class _ImageLoaderState extends State<ImageLoader> {
  GlobalKey<LienzoState> lienzoKey = GlobalKey();
  File _image;
  final picker = ImagePicker();

  // create some values
  Color pickerColor = Color(0xff443a49);
  Color currentColor = Color(0xff443a49);

// ValueChanged<Color> callback
  void changeColor(Color color) {
    setState(() => pickerColor = color);
  }

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Picker Example'),
      ),
      body: Column(
        children: [
          Expanded(
              child: Center(
                  child: Stack(
            children: [
              _image == null
                  ? Text('No image selected.')
                  : Image.file(
                      _image,
                      fit: BoxFit.cover,
                    ),
              Lienzo(
                key: lienzoKey,
                paintColor: currentColor,
              )
            ],
          ))),
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(10),
              scrollDirection: Axis.horizontal,
              children: [
                Container(
                  margin: EdgeInsets.all(10),
                  height: 10,
                  alignment: Alignment.center,
                  child: RaisedButton(
                    onPressed: () {
                      lienzoKey.currentState.clear();
                    },
                    child: Text(
                      "Borrar",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  height: 10,
                  alignment: Alignment.center,
                  child: RaisedButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                          title: const Text('Pick a color!'),
                          content: SingleChildScrollView(
                            child: ColorPicker(
                              pickerColor: pickerColor,
                              onColorChanged: changeColor,
                              showLabel: true,
                              pickerAreaHeightPercent: 0.8,
                            ),
                            // Use Material color picker:
                            //
                            // child: MaterialPicker(
                            //   pickerColor: pickerColor,
                            //   onColorChanged: changeColor,
                            //   showLabel: true, // only on portrait mode
                            // ),
                            //
                            // Use Block color picker:
                            //
                            // child: BlockPicker(
                            //   pickerColor: currentColor,
                            //   onColorChanged: changeColor,
                            // ),
                            //
                            // child: MultipleChoiceBlockPicker(
                            //   pickerColors: currentColors,
                            //   onColorsChanged: changeColors,
                            // ),
                          ),
                          actions: <Widget>[
                            FlatButton(
                              child: const Text('Got it'),
                              onPressed: () {
                                setState(() => currentColor = pickerColor);
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        ),
                      );
                    },
                    child: Text(
                      "Color",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: getImage,
        tooltip: 'Pick Image',
        child: Icon(Icons.add_a_photo),
      ),
    );
  }
}
