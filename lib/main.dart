import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_provider_emo/providers/product_provider.dart';
import 'package:google_provider_emo/screens/login.dart';
import 'package:provider/provider.dart';

void main() {
  SystemChrome.setEnabledSystemUIOverlays([]);
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<ProductProvider>.value(
        value: ProductProvider(),
      )
    ],
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(
        primaryColor: Colors.yellow,
      ),
      home: LoginScreen(),
    ),
  ));
}
