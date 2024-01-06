import 'package:flutter/material.dart';
import 'package:inherited_widget_practice/date_time_widget.dart';
import 'package:inherited_widget_practice/fake_api_provider.dart';

class MyHomepage extends StatefulWidget {
  const MyHomepage({super.key});

  @override
  State<MyHomepage> createState() => _MyHomepageState();
}

class _MyHomepageState extends State<MyHomepage> {

  ValueKey textKey = const ValueKey<String?>(null);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white60,
      appBar: AppBar(title: Text(FakeApiProvider.of(context).api.dateAndTime ?? ''), centerTitle: true),
      body: GestureDetector(
        onTap: () async{
          final dateTime = await FakeApiProvider.of(context).api.getDateAndTime();
          setState(() {textKey = ValueKey(dateTime);});
        },
        child: SizedBox.expand(
          child: Container(
            color: Colors.white,
            child: DateAndTime(key : textKey)
          ),
        )
      )
    );
  }
}
