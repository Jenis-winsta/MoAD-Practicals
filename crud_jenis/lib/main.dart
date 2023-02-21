import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyC3GJGnXIg1vgNxLu2jlvzM5tP7EmSb5bY",
      appId: "1:11682018483:android:5c0773c5b130e2d7436cc6",
      messagingSenderId: "11682018483",
      projectId: "crud-pracs9",
    ),
  );
  runApp(MaterialApp(
    theme: ThemeData(
      brightness: Brightness.light,
      primaryColor: Colors.blue,
      colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.cyan),
    ),
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late String studentName, studentID, studyProgramID;
  late String studentGPA;

  getStudentName(name) {
    this.studentName = name;
  }

  getStudentID(id) {
    this.studentID = id;
  }

  getStudyProgramID(programID) {
    this.studyProgramID = programID;
  }

  getStudentGPA(gpa) {
    this.studentGPA = gpa;
  }

  createData() async {
    print("create");

    CollectionReference colref =
        FirebaseFirestore.instance.collection('MyStudents');
    //create map
    Map<String, dynamic> student_map = {
      "studentName": studentName,
      "studentID": studentID,
      "studentGPA": studentGPA,
      "studyProgramID": studyProgramID,
    };

    colref
        .add(student_map)
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }

  readData() {
    print("Read");
  }

  updateData() async {
    print("Update");

    CollectionReference colref =
        FirebaseFirestore.instance.collection('MyStudents');

    Map<String, dynamic> student_map = {
      "studentName": studentName,
      "studentID": studentID,
      "studentGPA": studentGPA,
      "studyProgramID": studyProgramID,
    };

    colref
        .doc('mtTt8BzAL3mbW2coYRIP')
        .set(student_map)
        .then((value) => print("User updated"))
        .catchError((error) => print("Failed to update user: $error"));
  }

  deleteData() {
    print("Delete");

    CollectionReference colref =
        FirebaseFirestore.instance.collection('MyStudents');

    colref.doc('8KD1GRXfxFSRH3MoWnqu').delete().then((colref) => print("Document Deleted"),
          onError: (e)=>print("Error deleting the document=$e")
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Airbase inc."),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextFormField(
                decoration: const InputDecoration(
                    labelText: "Student Name",
                    fillColor: Colors.white,
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.blue, width: 2.0))),
                onChanged: (String name) {
                  getStudentName(name);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextFormField(
                decoration: const InputDecoration(
                    labelText: "Student ID",
                    fillColor: Colors.white,
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.blue, width: 2.0))),
                onChanged: (String id) {
                  getStudentID(id);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextFormField(
                decoration: const InputDecoration(
                    labelText: "Course code",
                    fillColor: Colors.white,
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.blue, width: 2.0))),
                onChanged: (String programID) {
                  getStudyProgramID(programID);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextFormField(
                decoration: const InputDecoration(
                    labelText: "GPA",
                    fillColor: Colors.white,
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.blue, width: 2.0))),
                onChanged: (String gpa) {
                  getStudentGPA(gpa);
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ElevatedButton(
                  onPressed: (() {
                    createData();
                  }),
                  child: Text("CREATE"),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green,
                  ),
                ),
                ElevatedButton(
                    onPressed: (() {
                      readData();
                    }),
                    child: Text("Read"),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue,
                    )),
                ElevatedButton(
                    onPressed: (() {
                      updateData();
                    }),
                    child: Text("Update"),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.amber,
                    )),
                ElevatedButton(
                    onPressed: (() {
                      deleteData();
                    }),
                    child: Text("Delete"),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.red,
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
