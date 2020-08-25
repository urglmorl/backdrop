import 'package:backdrop/models/message.dart';
import 'package:backdrop/widgets/message_widgets/received_message_widget.dart';
import 'package:backdrop/widgets/message_widgets/sent_message_widget.dart';
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
            child: ListView.separated(
              itemBuilder: (context, index) {
                return index % 2 == 0
                    ? ReceivedMessageWidget(
                        message: ReceivedMessage(
                          id: index,
                          text: 'text',
                        ),
                      )
                    : SentMessageWidget(
                        message: SentMessage(
                          id: index,
                          text: 'text',
                        ),
                      );
              },
              separatorBuilder: (context, int) {
                return Container(
                  height: 2,
                  width: double.infinity,
                );
              },
              itemCount: widget.data.length,
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
