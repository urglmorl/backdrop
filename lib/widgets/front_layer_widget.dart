import 'package:flutter/material.dart';
import 'package:backdrop/widgets/message_row.dart';
import 'package:backdrop/widgets/recepient_row.dart';

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
              child: ListView.separated(
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text('${widget.data[index]}'),
                  );
                },
                separatorBuilder: (context, int) {
                  return Container(
                    height: 5,
                    width: double.infinity,
                  );
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
