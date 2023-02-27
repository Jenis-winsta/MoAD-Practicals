import 'dart:math';

import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyDRCm8tQaTHllDDtO9UNUIyWDqxHvw4GpE",
          authDomain:
              "practical-6.firebaseapp.com", //project name .firebaseapp.com
          databaseURL: "https://practical-6-8cb91-default-rtdb.firebaseio.com/",
          appId: "1:69678794187:android:47b1fc8531274f8b39624e",
          messagingSenderId: "69678794187", //cloud messaging
          projectId: "practical-6-8cb91"));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _fbApp = Firebase.initializeApp();
  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Realtime database',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FutureBuilder(
        future: _fbApp,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            print("you have an error ${snapshot.error.toString()}");
            return const Text("something went wrong");
          } else if (snapshot.hasData) {
            return const MyHomePage(title: "Firebase Demo");
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
      //home: const MyHomePage(title: 'Firebase demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    DatabaseReference mTestref = FirebaseDatabase.instance.ref().child("test");
    mTestref.set("Hello SYIT ${Random().nextInt(100)}");

    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
