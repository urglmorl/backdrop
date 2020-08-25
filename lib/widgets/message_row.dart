import 'package:backdrop/utils/color_utils.dart';
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
      color: hexToColor('#569cfc'),
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 15),
            child: Image.asset(
              'assets/images/input_smile.png',
              color: Colors.white70,
            ),
          ),
          Expanded(
            child: TextFormField(
              style: TextStyle(
                fontSize: 20,
                color: Colors.white70,
              ),
              cursorColor: Colors.white70,
              keyboardType: TextInputType.multiline,
              decoration: InputDecoration(
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                contentPadding:
                    EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
                hintText: 'Message',
                hintStyle: TextStyle(fontSize: 22, color: Colors.white70),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
            child: Image.asset(
              'assets/images/input_attach.png',
              color: Colors.white70,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 15, top: 15, left: 5),
            child: Image.asset(
              'assets/images/input_mic.png',
              fit: BoxFit.contain,
              color: Colors.white70,
            ),
          ),
        ],
      ),
    );
  }
}
