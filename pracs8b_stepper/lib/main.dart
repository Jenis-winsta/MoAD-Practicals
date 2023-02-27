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
      title: 'Stepper demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Stepper Demo'),
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
  int currentStep = 0;

  List<Step> getSteps() => [
        Step(
          content: Text("Content 1"),
          title: const Text("Step 1"),
          isActive: currentStep >= 0,
        ),
        Step(
          content: Text("Content 2"),
          title: const Text("Step 2"),
          isActive: currentStep >= 1,
        ),
        Step(
          content: Text("Content 3"),
          title: const Text("Step 3"),
          isActive: currentStep >= 2,
        ),
        Step(
          content: Text("Content 4"),
          title: const Text("Step 4"),
          isActive: currentStep >= 3,
        ),
      ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: SafeArea(
            child: SingleChildScrollView(
          child: Stepper(
            steps: getSteps(),
            currentStep: currentStep,
            onStepCancel: () {
              setState(() {
                if(currentStep == 0){
                  currentStep=currentStep;
                }
                else{
                  currentStep --;
                }
              }
              );
            },
             onStepContinue: () {
               setState(() {
                //the no. gives access to steps n-1
                 if(currentStep == 3){
                  currentStep = currentStep;
                 }else{
                  currentStep ++;
                 }
               });
             },

             onStepTapped: (int currentStep) {
               setState(() {
                 currentStep=currentStep;
               });
             },
          ),
        ))
        // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}
