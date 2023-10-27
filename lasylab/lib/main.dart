import 'package:flutter/material.dart';
import 'package:lasylab/helpers/iconhelper.dart';
import 'package:kommunicate_flutter/kommunicate_flutter.dart';


void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
      home: SplashPage(duration: 3, goToPage: WelcomePage())
  ));
}

class IconFont extends StatelessWidget {
  Color color;
  double size;
  String iconName;

  IconFont({ required this.color, required this.size, required this.iconName });

  @override
  Widget build(BuildContext context) {
    return Text(this.iconName,
      style: TextStyle(
        color: this.color,
        fontSize: this.size,
        fontFamily: 'orilla'
      ),
    );
  }
}

class SplashPage extends StatelessWidget {
  int duration = 0;
  Widget goToPage;

  SplashPage({required this.goToPage, required this.duration});

  @override
  Widget build(BuildContext context) {

    Future.delayed(Duration(seconds: this.duration), () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => this.goToPage)
      );
    });

    return Scaffold(
        body: Container(
          color: Color(0xFFEC9943),
          alignment: Alignment.center,
          child: IconFont(
            color: Colors.white,
            iconName: IconFontHelper.LOGO,
            size: 100,
          )
        )
    );
  }
}

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Text('Welcome'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          dynamic conversationObject = {
            'appId': '1eee16d9b72591d625f0e999709343d12', // Replace <APP_ID> with your App ID from the Kommunicate dashboard.
          };

          try {
            dynamic result = await KommunicateFlutterPlugin.buildConversation(conversationObject);
            print("Conversation builder success : " + result.toString());
          } on Exception catch (e) {
            print("Conversation builder error occurred : " + e.toString());
          }
        },
        child: Icon(Icons.chat), // This icon can be changed as per your preference.
      ),
    );
  }
}