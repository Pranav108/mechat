import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mechat/screens/chat_screen.dart';
import 'package:mechat/screens/login_screen.dart';
import 'package:mechat/screens/registration_screen.dart';
import 'package:mechat/screens/welcome_screen.dart';

//void main() => runApp(MeChat());
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MeChat());
}

class MeChat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      // theme: ThemeData.dark().copyWith(
      //   textTheme: TextTheme(
      //     // Replace body1 with bodyText2
      //     bodyText2: TextStyle(color: Colors.black54),
      //   ),
      // ),
      initialRoute: WelcomeScreen.screenID,
      routes: {
        WelcomeScreen.screenID: (context) => WelcomeScreen(),
        LoginScreen.screenID: (context) => LoginScreen(),
        RegistrationScreen.screenID: (context) => RegistrationScreen(),
        ChatScreen.screenID: (context) => ChatScreen(),
      },
      // home: WelcomeScreen(),
    );
  }
}
