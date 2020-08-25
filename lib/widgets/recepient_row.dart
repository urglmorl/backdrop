import 'package:flutter/material.dart';

class RecepientRow extends StatefulWidget {
  RecepientRow({Key key}) : super(key: key);

  @override
  _RecepientRowState createState() => _RecepientRowState();
}

class _RecepientRowState extends State<RecepientRow> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.0),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(Icons.keyboard_arrow_left),
          Padding(
            padding: EdgeInsets.only(left: 10, right: 20),
            child: CircleAvatar(
              radius: 20,
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'John Doe',
                  style: TextStyle(fontSize: 24),
                ),
                Text(
                  'was online in 10:15',
                  style: TextStyle(fontSize: 14),
                ),
              ],
            ),
          ),
          Icon(Icons.menu)
        ],
      ),
    );
  }
}
