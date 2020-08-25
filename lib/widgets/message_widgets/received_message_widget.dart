import 'package:backdrop/models/message.dart';
import 'package:flutter/material.dart';

class ReceivedMessageWidget extends StatelessWidget {
  final ReceivedMessage message;
  const ReceivedMessageWidget({Key key, this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.black12,
              borderRadius: BorderRadius.all(
                Radius.circular(5),
              ),
            ),
            margin: EdgeInsets.only(left: 5),
            padding: EdgeInsets.all(10),
            child: Text(
              message.text,
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
