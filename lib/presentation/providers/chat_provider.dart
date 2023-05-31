import 'package:flutter/material.dart';
import 'package:yes_no_app/config/helpers/get_yes_no_answer.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {
  final ScrollController scrollController = ScrollController();

  List<Message> messageList = [
    Message(text: 'Hola, amor', fromWho: FromWho.me),
    Message(text: 'Ya estás en casa?', fromWho: FromWho.me),
  ];

  Future<void> sendMessage(String text) async {
    if (text.isEmpty) return;

    final newMessage = Message(text: text, fromWho: FromWho.me);

    messageList.add(newMessage);

    if (text.endsWith('?')) {
      youReply();
    }

    notifyListeners();
    scrollToBottom();
  }

  Future<void> scrollToBottom() async {
    await Future.delayed(const Duration(milliseconds: 100));

    scrollController.animateTo(
      scrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }

  Future<void> youReply() async {
    final message = await GetYesNoAnswer.getAnswer();

    messageList.add(message);

    notifyListeners();
    scrollToBottom();
  }
}
