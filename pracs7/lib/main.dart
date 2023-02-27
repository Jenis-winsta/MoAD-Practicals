import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
      brightness: Brightness.light,
      primaryColor: Colors.pink,
      colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.cyan),
    ),
    home: const MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
    late String  studentName, studentID, studyProgramID;
    late double studentGPA;
  

    getStudentName(name){
      this.studentName = name;
    }

    getStudentID(id){
      this.studentID = id;
    }

    getStudyProgramID(programID){
      this.studyProgramID = programID;
    }

    getStudentGPA(gpa){
      this.studentGPA = double.parse(gpa);
    }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Airbase inc."),
      ),
      body: SingleChildScrollView(
        child: Padding(padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(bottom:8.0),
            child: TextFormField(
              decoration: const InputDecoration(
                  labelText: "Student Name",
                  fillColor: Colors.white,
                  focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue, width: 2.0))),
                  onChanged: (String name){
                    getStudentName(name);
                  },
            ),
            ),
            
            Padding(
              padding: const EdgeInsets.only(bottom:8.0),
            child: TextFormField(
              decoration: const InputDecoration(
                  labelText: "Student ID",
                  fillColor: Colors.white,
                  focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue, width: 2.0))),
                  onChanged: (String id){
                    getStudentID(id);
                  },
            ),
            ),
            
            Padding(
              padding: const EdgeInsets.only(bottom:8.0),
            child: TextFormField(
              decoration: const InputDecoration(
                  labelText: "Course code",
                  fillColor: Colors.white,
                  focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue, width: 2.0))),
                  onChanged: (String programID){
                    getStudyProgramID(programID);
                  },
            )
          ),
          
          Padding(
              padding: const EdgeInsets.only(bottom:8.0),
            child: TextFormField(
              decoration: const InputDecoration(
                  labelText: "GPA",
                  fillColor: Colors.white,
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue, width: 2.0))),
                      onChanged: (String gpa){
                        getStudentGPA(gpa);
                  },
            )
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            ElevatedButton(
              child: Text('CREATE'),
              style: ElevatedButton.styleFrom(
                      primary: Colors.green,
                      //onPrimary: Colors.black,
                    ),
              onPressed: () {
                createdata();
              },
              ),
            ElevatedButton(
              child: Text('READ'),
              style: ElevatedButton.styleFrom(
                      primary: Colors.blue,
                      //onPrimary: Colors.black,
                    ),
              onPressed: () {
                readdata();
              },
              ),
              ElevatedButton(
              child: Text('UPDATE'),
              style: ElevatedButton.styleFrom(
                      primary: Colors.deepOrangeAccent,
                      //onPrimary: Colors.black,
                    ),
              onPressed: () {
                updatedata();
              },
              ),
              ElevatedButton(
              child: Text('DELETE'),
              style: ElevatedButton.styleFrom(
                      primary: Colors.red,
                      //onPrimary: Colors.black,
                    ),
              onPressed: () {
                deletedata();
              },
              )
          ])
        ],)
          //TextFormField
        , //Widget
        ),
      ), //Column
    );
  }
  
  void createdata() {
    print("created");
  }
  
  void readdata() {
    print("read");
  }
  
  void updatedata() {
    print("updated");
  }
  
  void deletedata() {
    print("deleted");
  }
}