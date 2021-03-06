import 'package:tawsel/controllers/bindings/authBindings.dart';
import 'package:tawsel/utils/root.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: AuthBinginds(),
      home: Root(),
      theme: ThemeData.light(),
      debugShowCheckedModeBanner: false,
    );
  }
}
