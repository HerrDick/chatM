import 'package:chat/app/models/chat_message/chat_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

class BubbleWidget extends StatelessWidget {
  final ChatMessage message;
  final bool itsMe;
  final DateTime? date;
  const BubbleWidget({super.key, required this.message, required this.itsMe, required this.date,});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: itsMe? Alignment.topRight: Alignment.topLeft,
      child: Tooltip(
        message: date == null ? "Неизвестное время" : DateFormat("yyyy-MM-dd kk:mm").format(date!),
        child: Container(padding: const EdgeInsets.all(8.0),
          margin: EdgeInsets.only( top: 5, bottom: 10, left: itsMe ? 60 : 15, right: itsMe? 10:60),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: itsMe
            ? Color.fromARGB(255, 0, 183, 168)
            : Color.fromARGB(255, 86, 13, 255),
            ),
          child: Column(
            crossAxisAlignment: itsMe? CrossAxisAlignment.end : CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              if(!itsMe) const SizedBox(height: 5,),
              Text(message.username),
              Text(message.message)
            
            ],
          ),
        ),
      ),
    );
  }
}