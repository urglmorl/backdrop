import 'package:backdrop/backdrop_widget.dart';
import 'package:backdrop/message_row.dart';
import 'package:backdrop/recepient_row.dart';
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
      backLayer: Container(
        color: Colors.indigo,
        child: Column(
          children: [
            Expanded(
              child: Container(),
            ),
            Container(
                height: 75,
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.all(10),
                      child: CircleAvatar(
                        radius: 20,
                      ),
                    );
                  },
                  itemCount: fakeData.length,
                  scrollDirection: Axis.horizontal,
                ))
          ],
        ),
      ),
      frontLayer: Container(
          color: Colors.white,
          padding: MediaQuery.of(context).padding,
          child: Column(
            children: [
              Expanded(
                child: Container(
                  color: Colors.black54,
                  child: ListView.separated(
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text('${fakeData[index]}'),
                      );
                    },
                    separatorBuilder: (context, int) {
                      return Divider();
                    },
                    itemCount: fakeData.length,
                  ),
                ),
              ),
              Container(
                height: 75,
                child: RecepientRow(),
              ),
              Container(
                height: 75,
                color: Colors.blue,
                child: MessageRow(),
              ),
            ],
          )),
    );
  }
}
