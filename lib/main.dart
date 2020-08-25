import 'package:backdrop/widgets/backdrop/back_layer_widget.dart';
import 'package:backdrop/widgets/backdrop/backdrop_widget.dart';
import 'package:backdrop/widgets/backdrop/front_layer_widget.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
  final double _slideSensitivity = 2;

  @override
  Widget build(BuildContext context) {
    return Backdrop(
      slideSensitivity: _slideSensitivity,
      sliderHeight: _sliderHeight,
      backLayer: BackLayerWidget(data: _fakeData, height: _sliderHeight),
      frontLayer: FrontLayerWidget(data: _fakeData),
    );
  }
}
