import 'package:flutter/material.dart';

class BackLayerWidget extends StatefulWidget {
  final List<int> data;
  final double height;
  BackLayerWidget({Key key, this.data, this.height}) : super(key: key);

  @override
  _BackLayerWidgetState createState() => _BackLayerWidgetState();
}

class _BackLayerWidgetState extends State<BackLayerWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
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
                    child: Icon(Icons.person),
                  ),
                );
              },
              itemCount: widget.data.length,
              scrollDirection: Axis.horizontal,
            ),
          ),
        ],
      ),
    );
  }
}
