import 'package:flutter/material.dart';

class MessageRow extends StatefulWidget {
  MessageRow({Key key}) : super(key: key);

  @override
  _MessageRowState createState() => _MessageRowState();
}

class _MessageRowState extends State<MessageRow> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.0),
      color: Colors.blue,
      child: Row(
        children: [
          Icon(Icons.verified_user),
          Expanded(
            child: TextField(),
          ),
          Icon(Icons.verified_user),
          Icon(Icons.verified_user),
        ],
      ),
    );
  }
}
