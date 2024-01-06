import 'package:flutter/material.dart';
import 'package:inherited_widget_practice/fake_api.dart';
import 'package:inherited_widget_practice/fake_api_provider.dart';
import 'package:inherited_widget_practice/main_view.dart';


void main(){runApp(const MyApp());}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.blue
        ),
        useMaterial3: true,
        primarySwatch: Colors.blue,
      ),
      home: FakeApiProvider(
        api: FakeApi(),
        child: const MyHomepage()
      ),
    );
  }
}