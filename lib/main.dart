import 'dart:async';

import 'package:base_setup/application/auto_router/auto_router.dart';
import 'package:base_setup/data/service/notification.service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:localstore/localstore.dart';
import 'package:shared_preferences/shared_preferences.dart';

const onSurface = Color(0xFF202020);
const onSurfaceVariant = Color(0xFF919197);

late final FirebaseApp app;
late final FirebaseApp tradingAppForSignals;
late final FirebaseAuth auth;

// Obtain shared preferences.
late final SharedPreferences sharedPreferences;
final db = Localstore.instance;


final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  sharedPreferences = await SharedPreferences.getInstance();

  // We store the app and auth to make testing with a named instance easier.
  app = await Firebase.initializeApp();

  auth = FirebaseAuth.instanceFor(app: app);

  // Initialize secondary Firebase app
  tradingAppForSignals = await Firebase.initializeApp(name: 'TRADING',
    options: const FirebaseOptions(
      apiKey: 'AIzaSyA0ocdCg_NqDMzXWwPed0j3VjoWPkfTF1c',
      appId: '1:168764002174:android:21f2d8ae68a12607f8ed2f',
      messagingSenderId: '168764002174',
      projectId: 'trading-7e2cc',
      databaseURL: 'https://trading-7e2cc.firebaseio.com',
      storageBucket: 'trading-7e2cc.appspot.com',),);


  await NotificationService.init();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final appRouter = AppRouter();
    return MaterialApp.router(title: 'Trade View Alerts',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
          appBarTheme: const AppBarTheme(surfaceTintColor: Colors.white,)),
      routerConfig: appRouter.config(),);
  }
}
