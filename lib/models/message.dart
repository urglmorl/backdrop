enum MessageType {
  sent,
  received,
}

class Message {
  int id;
  String text;
  final MessageType type;

  Message({this.id, this.text, this.type});
}

class ReceivedMessage extends Message {
  ReceivedMessage({id, text})
      : super(id: id, text: text, type: MessageType.received);
}

class SentMessage extends Message {
  SentMessage({id, text}) : super(id: id, text: text, type: MessageType.sent);
}
