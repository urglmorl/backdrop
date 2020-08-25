import 'package:flutter/material.dart';
import 'package:backdrop/message_row.dart';
import 'package:backdrop/recepient_row.dart';

class FrontLayerWidget extends StatefulWidget {
  final List<int> data;
  FrontLayerWidget({Key key, this.data}) : super(key: key);

  @override
  _FrontLayerWidgetState createState() => _FrontLayerWidgetState();
}

class _FrontLayerWidgetState extends State<FrontLayerWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
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
                    title: Text('${widget.data[index]}'),
                  );
                },
                separatorBuilder: (context, int) {
                  return Divider();
                },
                itemCount: widget.data.length,
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
      ),
    );
  }
}
