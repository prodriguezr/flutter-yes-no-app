import 'package:flutter/material.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {
  List<Message> message = [
    Message(text: 'Hola, amor', fromWho: FromWho.me),
    Message(text: 'Ya estás en casa?', fromWho: FromWho.me),
  ];

  Future<void> sendMessage(String message) async {
    // TODO: Pending method implementation
  }
}
