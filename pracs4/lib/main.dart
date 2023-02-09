import 'package:flutter/material.dart';
import 'package:draggable_fab/draggable_fab.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Floating Button demo'),
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
  double _counter = 0;
  //String _str = "";
  int display = 100;
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }

  void _multiply() {
    setState(() {
      _counter = 2 * _counter;
    });
  }

  void _divide() {
    setState(() {
      _counter = _counter / 2;
    });
  }

  void _reset() {
    setState(() {
      _counter = 0;
    });
  }
  void _question(){}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            alignment: Alignment.center,
            height: 100,
            width: 200,
            decoration: BoxDecoration(border: Border.all(color: Colors.black)),
            child: Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              FloatingActionButton(
                onPressed: _incrementCounter,
                tooltip: 'Increment',
                child: const Icon(Icons.add),
              ),
              FloatingActionButton(
                onPressed: _decrementCounter,
                tooltip: 'Decrement',
                child: const Icon(Icons.minimize_outlined),
              ),
              FloatingActionButton.extended(
                onPressed: _multiply,
                tooltip: 'Multiply by 2',
                label: Text("X 2"),
              ),
              FloatingActionButton.extended(
                onPressed: _divide,
                tooltip: 'Divide by 2',
                label: Text("/ 2"),
              ),
            ],
          ),
          FloatingActionButton.extended(
            onPressed: _reset,
            tooltip: 'Reset',
            label: Text("Reset"),
          ),
        ],
      )),
      floatingActionButton: Stack(
        fit: StackFit.expand,
        children: [
          Align(
            alignment: Alignment.bottomRight,
            child: DraggableFab(
                child: FloatingActionButton(
              onPressed: _question,
              tooltip: 'Any Question',
              child: Icon(Icons.question_mark),
            )),
          )
        ],
      ),
    );
  }
}
