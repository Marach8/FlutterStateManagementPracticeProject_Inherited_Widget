import 'package:flutter/material.dart';
import 'package:inherited_widget_practice/fake_api.dart';
import 'package:uuid/uuid.dart';

class FakeApiProvider extends InheritedWidget{
  final FakeApi api; final String uuid;
  FakeApiProvider({Key? key, required Widget child, required this.api})
    : uuid = const Uuid().v4(), super(key: key, child: child);
  
  @override
  bool updateShouldNotify(covariant FakeApiProvider oldWidget) {
    return uuid != oldWidget.uuid;
  }

  static of(BuildContext context){
    return context.dependOnInheritedWidgetOfExactType<FakeApiProvider>();
  }
}
