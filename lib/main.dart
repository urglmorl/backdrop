import 'package:backdrop/widgets/back_layer_widget.dart';
import 'package:backdrop/widgets/backdrop_widget.dart';
import 'package:backdrop/widgets/front_layer_widget.dart';
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
  final _fakeData = List.generate(50, (index) => index);
  final double _sliderHeight = 75;

  @override
  Widget build(BuildContext context) {
    return Backdrop(
      slideSensitivity: 2,
      sliderHeight: _sliderHeight,
      backLayer: BackLayerWidget(data: _fakeData, height: _sliderHeight),
      frontLayer: FrontLayerWidget(data: _fakeData),
    );
  }
}
