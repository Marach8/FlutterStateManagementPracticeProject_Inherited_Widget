import 'package:flutter/material.dart';
import 'package:inherited_widget_practice/fake_api_provider.dart';

class DateAndTime extends StatelessWidget {
  const DateAndTime({super.key});

  @override
  Widget build(BuildContext context) {
    final api = FakeApiProvider.of(context).api;
    return Text(api.dateAndTime ?? 'Tap on the screen to fetch date and time');
  }
}