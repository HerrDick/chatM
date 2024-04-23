import 'package:chat/app/models/chat_message/chat_message.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

class BubbleWidget extends StatelessWidget {
  final ChatMessage message;
  final bool itsMe;
  const BubbleWidget({super.key, required this.message, required this.itsMe});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}