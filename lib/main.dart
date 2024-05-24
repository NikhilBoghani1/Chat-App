import 'package:chat_app/services/auth/auth_gate.dart';
import 'package:chat_app/themes/light_mode.dart';
import 'package:chat_app/themes/theme_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyCKIYvMB1gFmPlA-FLHils8W4DuxBRk_cE",
      appId: "1:1038109899168:android:d01840fdd9e379a89e0cc5",
      messagingSenderId: "1038109899168",
      projectId: "ass-chat-app",
    ),
  );
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const AuthGate(),
      theme: Provider.of<ThemeProvider>(context).themeData,
    );
  }
}