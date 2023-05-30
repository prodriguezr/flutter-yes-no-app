import 'package:flutter/material.dart';
import 'package:yes_no_app/presentation/widgets/chat/her_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/chat/my_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/shared/message_field_box.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(4.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
                'https://www.stylist.co.uk/images/app/uploads/2022/06/01105352/jennifer-aniston-crop-1654077521-1390x1390.jpg?w=256&h=256&fit=max&auto=format%2Ccompress'),
          ),
        ),
        title: const Text('Mi amor ♥️'),
        centerTitle: false,
      ),
      body: _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                  itemCount: 100,
                  itemBuilder: (context, index) {
                    return (index % 2 == 0)
                        ? const HerMessageBubble()
                        : const MyMessageBubble();
                  }),
            ),
            Container(
              //height: 70,
              color: Colors.green.shade50,
              child: const Padding(
                padding: EdgeInsets.all(5.0),
                child: Column(
                  children: [
                    SizedBox(
                      height: 5,
                    ),
                    MessageFieldBox(),
                    SizedBox(
                      height: 5,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
