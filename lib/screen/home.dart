import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:tasktick/const/colors.dart';
import 'package:tasktick/screen/add_note_screen.dart';
import 'package:tasktick/widgets/stream_note.dart';
import 'package:tasktick/data/auth_data.dart'; 
import 'package:tasktick/screen/login.dart';
import 'package:tasktick/screen/signup.dart'; 


class Home_Screen extends StatefulWidget {
  const Home_Screen({super.key});

  @override
  State<Home_Screen> createState() => _Home_ScreenState();
}

bool show = true;

class _Home_ScreenState extends State<Home_Screen> {
  final AuthenticationRemote authRemote = AuthenticationRemote();  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
appBar: AppBar(
  backgroundColor: custom_red,  // Ensures AppBar background is custom red
  title: const Text(
    'Home',
    style: TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: 30  // Sets AppBar title text color to white
    ),
  ),
  actions: <Widget>[
    TextButton.icon(
      icon: const Icon(Icons.logout, color: Colors.white),  // Set icon color to white
      label: const Text(
        'LOGOUT',  // Add LOGOUT text
        style: TextStyle(
          color: Colors.white,  // Ensures text color is white
        ),
      ),
      onPressed: () async {
        await authRemote.signOut();
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => LogIN_Screen(() {
            Navigator.push(context, MaterialPageRoute(builder: (context) => SignUp_Screen(() {
              Navigator.pop(context);
            })));
          })),
          (Route<dynamic> route) => false,
        );
      },
    ),
  ],
),

      backgroundColor: Colors.grey[200],  
      floatingActionButton: Visibility(
        visible: show,
        child: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => Add_creen(),
            ));
          },
          backgroundColor: custom_red,
          child: const Icon(Icons.add, size: 30, color: Colors.white,),
        ),
      ),
      body: SafeArea(
        child: NotificationListener<UserScrollNotification>(
          onNotification: (notification) {
            setState(() {
              show = notification.direction == ScrollDirection.forward;
            });
            return true;
          },
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Pending Tasks',
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Stream_note(false),  // Assuming this widget is for pending tasks
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Completed Tasks',
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                  ),
                ),
                Stream_note(true),  // Assuming this widget is for completed tasks
              ],
            ),
          ),
        ),
      ),
    );
  }
}
