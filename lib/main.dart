import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'screen/Home.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: "AIzaSyDcPF6cMX-UY8VGQhkxs3NMDUTqsiosRpo",
          authDomain: "flutterproject-46003.firebaseapp.com",
          projectId: "flutterproject-46003",
          storageBucket: "flutterproject-46003.appspot.com",
          messagingSenderId: "130650583417",
          appId: "1:130650583417:web:d77e769b3359c65a32ffa8",
          measurementId: "G-R062YFCFZ5"));
  runApp(const MyApp());
  
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: Home(),
    );
  }
}
