//Practical 2: Two buttons which on clicking displays “Good Morning” and “Good Afternoon” respectively.
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: const MyHomePage(title: 'Button'),
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
  String _str = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[Text('JENIS WINSTA')],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(_str,
                    style: const TextStyle(fontSize: 30, fontFamily: 'Raleway'))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _str = "Good Morning";
                    });
                    print(_str);
                  },
                  child: const Text(
                    "Message1",
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _str = "Good Afternoon";
                    });
                    print(_str);
                  },
                  child: Text("Message2"),
                ),
              ],
            )
          ]),
      
    );
  }
}
