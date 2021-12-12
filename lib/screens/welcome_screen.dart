import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:mechat/rounded_button.dart';
import 'package:mechat/screens/login_screen.dart';
import 'package:mechat/screens/registration_screen.dart';

class WelcomeScreen extends StatefulWidget {
  static const String screenID = 'welcome_screen';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation animation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this,
    );

    animation = ColorTween(begin: Colors.blue[900], end: Colors.white)
        .animate(controller);

    controller.forward();
    controller.addListener(() {
      setState(() {});
      // print(animation.value);
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      backgroundColor: animation.value,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: Container(
                    child: Image.asset('images/logo.png'),
                    height: 60.0,
                  ),
                ),
                AnimatedTextKit(
                  animatedTexts: [
                    TypewriterAnimatedText(
                      'Flash Chat',
                      speed: Duration(milliseconds: 300),
                      textStyle: TextStyle(
                        fontSize: 45.0,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            Hero(
              tag: 'login',
              child: RoundedButton(
                buttonText: 'Log In',
                colour: Colors.lightBlueAccent,
                onTap: () {
                  Navigator.pushNamed(context, LoginScreen.screenID);
                },
              ),
            ),
            Hero(
              tag: 'register',
              child: RoundedButton(
                buttonText: 'Register',
                colour: Colors.blueAccent,
                onTap: () {
                  Navigator.pushNamed(context, RegistrationScreen.screenID);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
