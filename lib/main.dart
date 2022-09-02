import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:developer' as developer;

//link to external web
final Uri _url = Uri.parse('https://wa.me/+584246200372');

//email
String? encodeQueryParameters(Map<String, String> params) {
  return params.entries
      .map((MapEntry<String, String> e) =>
          '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
      .join('&');
}

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: ThemeMode.system == ThemeMode.dark
          ? Brightness.light
          : Brightness.dark,
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Center(
                child: CircleAvatar(
                  radius: 50.0,
                  backgroundImage: AssetImage('images/me.png'),
                ),
              ),
              const Text(
                'Cecilia Leon',
                style: TextStyle(
                    fontFamily: 'Pacifico',
                    fontSize: 40.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                'FLUTTER DEVELOPER',
                style: TextStyle(
                  fontFamily: 'Ubuntu',
                  color: Colors.teal.shade100,
                  fontSize: 20.0,
                  letterSpacing: 2.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 20.0,
                width: 150.0,
                child: Divider(
                  color: Colors.teal.shade100,
                ),
              ),
              Card(
                color: Colors.white,
                margin: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 25.0),
                child: InkWell(
                  onTap: () {
                    _launchUrl();
                    developer.log('tapped');
                  },
                  child: const ListTile(
                    leading: Icon(Icons.phone, color: Colors.teal),
                    title: Text(
                      '+58 424 620 03 72',
                      style: TextStyle(
                          fontFamily: 'Ubuntu',
                          fontSize: 20.0,
                          color: Colors.teal),
                    ),
                  ),
                ),
              ),
              Card(
                color: Colors.white,
                margin: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 25.0),
                child: InkWell(
                  onTap: () {
                    _composeMail();
                    developer.log('tapped');
                  },
                  child: const ListTile(
                    leading: Icon(Icons.email, color: Colors.teal),
                    title: Text(
                      'leonc4667@gmail.com',
                      style: TextStyle(
                          fontFamily: 'Ubuntu',
                          fontSize: 20.0,
                          color: Colors.teal),
                    ),
                  ),
                ),
              ),
            ], // <Widget>[]
          ),
        ),
      ),
    );
  }
}

//link to external web
Future<void> _launchUrl() async {
  if (!await launchUrl(_url, webOnlyWindowName: '_self')) {
    throw 'Could not launch $_url';
  }
}

//email
void _composeMail() {
  final Uri emailLaunchUri = Uri(
    scheme: 'mailto',
    path: 'leonc4667@gmail.com',
    query: encodeQueryParameters(<String, String>{
      'subject': 'Flutter Development',
    }),
  );
  launchUrl(emailLaunchUri);
}
