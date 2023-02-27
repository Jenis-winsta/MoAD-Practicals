import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink.shade100,
      appBar: AppBar(
        title: Text(
          'Bottom Nav',
        ),
        backgroundColor: Colors.purple,
      ),

      //Bottom Nav bar
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.pink.shade100,
        color: Colors.purple,
        //the time it takes to float
        //higher the no. more slow
        animationDuration: Duration(milliseconds: 300),
        items: <Widget>[
          //we are going to add icon
          
          Icon(
            Icons.home,
            color: Colors.white,
            size: 30,
          ),
          Icon(
            Icons.security,
            color: Colors.white,
            size: 30,
          ),
          Icon(
            Icons.add,
            color: Colors.white,
            size: 30,
          ),
          Icon(
            Icons.notifications,
            color: Colors.white,
            size: 30,
          ),
        ],

        onTap: (index) {
          print(index);
          

        },
      ),
    );
  }
}
