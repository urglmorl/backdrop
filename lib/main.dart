import 'package:backdrop/back_layer_widget.dart';
import 'package:backdrop/backdrop_widget.dart';
import 'package:backdrop/front_layer_widget.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final fakeData = List.generate(50, (index) => index);

  @override
  Widget build(BuildContext context) {
    return Backdrop(
      slideSensitivity: 0.5,
      sliderHeight: 75,
      backLayer: BackLayerWidget(data: fakeData),
      frontLayer: FrontLayerWidget(data: fakeData),
    );
  }
}
