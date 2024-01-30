import 'package:flutter/material.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:intl/intl.dart';
//import 'package:firebase_auth/firebase_auth.dart';
//import 'package:firebase_database/firebase_database.dart';
import 'firebase_options.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'first_time_intro/first_time_intro.dart';
//import 'dart:io';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
    .then((value) => FirebaseMessaging.instance.requestPermission(provisional: true))
    .then((value) => FirebaseMessaging.instance.subscribeToTopic('xime'));

  // REMEMBER THERE MIGHT NOT BE WIFI
  /*final userCredential = await FirebaseAuth.instance.signInAnonymously();
  String host = Platform.isAndroid ? 'http://10.0.2.2:9000/?ns=love-dbe0b' : 'http://localhost:9000/?ns=love-dbe0b';
  FirebaseDatabase database = FirebaseDatabase.instanceFor(
    app: app,
    databaseURL: host,
  );
  DatabaseReference ref = database.ref('users/${userCredential.user!.uid}/mensaje');
  await ref.set('te quierooooo <3');*/

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    Intl.defaultLocale = 'es_MX';

    return MaterialApp(
      title: 'Mensajito Diario',
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('es'),
      ],
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          brightness: Brightness.dark,
          background: const Color(0xffd3bbff),
          onBackground: const Color(0xff3f008d),
          surface: const Color.fromARGB(255, 191, 160, 248),
          onSurface: Colors.white,
        ),
      ),
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaler: const TextScaler.linear(1.0)),
          child: child!,
        );
      },
      home: const FirstTimeIntro(),
    );
  }
}
