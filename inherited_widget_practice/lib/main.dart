import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';


void main(){
  runApp(const MyApp());
}


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


class MyHomepage extends StatefulWidget {
  const MyHomepage({super.key});

  @override
  State<MyHomepage> createState() => _MyHomepageState();
}

class _MyHomepageState extends State<MyHomepage> {

  ValueKey textKey = const ValueKey<String?>(null);
  String title = 'Tap the Screen to change';

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



class FakeApiProvider extends InheritedWidget{
  final FakeApi api; final String uuid;
  FakeApiProvider({
    Key? key, required Widget child, required this.api,
    }): uuid = const Uuid().v4(), super(key: key, child: child);
  
  @override
  bool updateShouldNotify(covariant FakeApiProvider oldWidget) {
    return uuid != oldWidget.uuid;
  }

  static of(BuildContext context){
    return context.dependOnInheritedWidgetOfExactType<FakeApiProvider>();
  }
}


class FakeApi{
  String? dateAndTime;
  Future<String> getDateAndTime(){
    return Future.delayed(
      const Duration(seconds: 1), () => DateTime.now().toIso8601String()
    ).then((result) {dateAndTime = result; return result;});
  }
}


class DateAndTime extends StatelessWidget {
  const DateAndTime({super.key});

  @override
  Widget build(BuildContext context) {
    final api = FakeApiProvider.of(context).api;
    return Text(api.dateAndTime ?? 'Tap on the screen to fetch date and time');
  }
}