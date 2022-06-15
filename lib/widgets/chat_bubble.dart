import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:message_me_app/constants.dart';
import 'package:message_me_app/models/message_model.dart';

// class ChatBubble extends StatefulWidget {
//   final MessageModel textMessage;
//
//    ChatBubble({Key? key,  required this.textMessage}) : super(key: key);
//
//   @override
//   _ChatBubbleState createState() => _ChatBubbleState();
// }
//
// class _ChatBubbleState extends State<ChatBubble> {
//
//
//
//   @override
//   Widget build(BuildContext context) {
//
//     return Align(
//       alignment: Alignment.centerLeft,
//       child: Container(
//         padding: EdgeInsets.all(16),
//         decoration: const BoxDecoration(
//           color: kPrimaryColor,
//           borderRadius: BorderRadius.only(
//             topRight: Radius.circular(32),
//             topLeft: Radius.circular(32),
//             bottomRight: Radius.circular(32),
//           ),
//         ),
//         margin: EdgeInsets.all(8),
//         child: Text(
//           textMessage.message,
//           style: TextStyle(
//             color: Colors.white,
//           ),
//         ),
//       ),
//     );
//   }
// }

class ChatBubble extends StatelessWidget {
  const ChatBubble({
    Key? key,
    required this.message,
  }) : super(key: key);

  final MessageModel message;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding: EdgeInsets.only(left: 16, top: 32, bottom: 32, right: 32),
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(32),
            topRight: Radius.circular(32),
            bottomRight: Radius.circular(32),
          ),
          color: kPrimaryColor,
        ),
        child: Text(
          message.message,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}


class FriendChatBubble extends StatelessWidget {
  const FriendChatBubble({
    Key? key,
    required this.message,
  }) : super(key: key);

  final MessageModel message;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        padding: EdgeInsets.only(left: 16, top: 32, bottom: 32, right: 32),
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(32),
            topRight: Radius.circular(32),
            bottomLeft: Radius.circular(32),
          ),
          color: Colors.orange,
        ),
        child: Text(
          message.message,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

