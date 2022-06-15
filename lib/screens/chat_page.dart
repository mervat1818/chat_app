import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:message_me_app/models/message_model.dart';
import '../constants.dart';
import '../widgets/chat_bubble.dart';

// class ChatPage extends StatefulWidget {
//   const ChatPage({Key? key}) : super(key: key);
//
//   static String id = 'chatPage';
//
//   @override
//   _ChatPageState createState() => _ChatPageState();
// }
//
// class _ChatPageState extends State<ChatPage> {
//   TextEditingController controller = TextEditingController();
//   // FirebaseFirestore firestore = FirebaseFirestore.instance;
//   CollectionReference messages =
//       FirebaseFirestore.instance.collection(kMessagesCollection);
//
//   final _controller= ScrollController();
//
//
//   @override
//   Widget build(BuildContext context) {
//     var email = ModalRoute.of(context)!.settings.arguments;
//     return StreamBuilder<QuerySnapshot>(
//       stream: messages.orderBy(kCreatedAt, descending: true).snapshots(),
//       builder: (BuildContext context, snapshot) {
//         if (snapshot.hasData){
//           List<MessageModel> messagesList = [];
//           for (int i = 0; i < snapshot.data!.docs.length; i++) {
//             messagesList.add(
//               MessageModel.fromJson(snapshot.data!.docs[i]),
//             );
//           }
//         // }
//
//           return Scaffold(
//               appBar: AppBar(
//                 backgroundColor: kPrimaryColor,
//                 title: Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Image.asset(kChatLogo, height: 50),
//                       Text('Message Me')
//                     ]),
//                 centerTitle: true,
//               ),
//               body: Column(
//                 children: [
//                   Expanded(
//                     child: ListView.builder(
//                       reverse: true,
//                       controller: _controller,
//                       itemCount: messagesList.length,
//                       itemBuilder: (context, index) {
//                         return messagesList[index].id == email ?
//                         ChatBubble(
//                           message:messagesList[index]
//                         ): FriendChatBubble(message: messagesList[index]);
//                       },
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(16),
//                     child: TextField(
//                       controller: controller,
//                       onSubmitted: (data) {
//                         messages.add({
//                           kMessageKey: data,
//                           kCreatedAt: DateTime.now(),
//                           'id': email
//                         });
//                         controller.clear();
//                         _controller.animateTo(0,
//                             duration: Duration(seconds: 1),
//                             curve: Curves.easeIn);
//
//                       },
//                       decoration: InputDecoration(
//                         hintText: 'Enter a Message',
//                         suffixIcon: Icon(
//                           Icons.send,
//                           color: kPrimaryColor,
//                         ),
//                         enabledBorder: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(8),
//                             borderSide: BorderSide(color: kPrimaryColor)),
//                       ),
//                     ),
//                   )
//                 ],
//               )
//               // ChatBubble(),
//
//               );
//         } else {
//           return Text('Loading');
//         }
//       },
//     );
//   }
// }

class ChatPage extends StatelessWidget {
  static String id = 'ChatPage';

  final _controller = ScrollController();

  CollectionReference messages =
      FirebaseFirestore.instance.collection(kMessagesCollection);
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var email = ModalRoute.of(context)!.settings.arguments;
    return StreamBuilder<QuerySnapshot>(
      stream: messages.orderBy(kCreatedAt, descending: true).snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<MessageModel> messagesList = [];
          for (int i = 0; i < snapshot.data!.docs.length; i++) {
            messagesList.add(
              MessageModel.fromJson(snapshot.data!.docs[i]),
            );
          }

          return Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: kPrimaryColor,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    kChatLogo,
                    height: 50,
                  ),
                  Text('chat'),
                ],
              ),
              centerTitle: true,
            ),
            body: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    reverse: true,
                    controller: _controller,
                    itemCount: messagesList.length,
                    itemBuilder: (context, index) {
                      return messagesList[index].id == email
                          ? ChatBubble(
                              message: messagesList[index],
                            )
                          : FriendChatBubble(message: messagesList[index]);
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: TextField(
                    controller: controller,
                    onSubmitted: (data) {
                      messages.add(
                        {
                          kMessageKey: data,
                          kCreatedAt: DateTime.now(),
                          'id': email
                        },
                      );
                      controller.clear();
                      _controller.animateTo(0,
                          duration: Duration(milliseconds: 500),
                          curve: Curves.easeIn);
                    },
                    decoration: InputDecoration(
                      hintText: 'Send Message',
                      suffixIcon: Icon(
                        Icons.send,
                        color: kPrimaryColor,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide(
                          color: kPrimaryColor,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        } else {
          return Text('Loading...');
        }
      },
    );
  }
}
