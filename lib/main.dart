import 'package:flutter/material.dart';
import 'package:message_me_app/screens/chat_page.dart';
import 'package:message_me_app/screens/log_in.dart';
import 'package:message_me_app/screens/register_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp (MessageMe(),
  );
}

class MessageMe extends StatelessWidget {
  const MessageMe ({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
      routes: {
        LogIn.id:(contex) =>  LogIn(),
        RegisterPage.id: (context)=> RegisterPage(),
        ChatPage.id: (context)=> ChatPage(),

      },
      initialRoute: LogIn.id,
    );
  }
}
