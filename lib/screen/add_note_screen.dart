import 'package:flutter/material.dart';
import 'package:tasktick/const/colors.dart';
import 'package:tasktick/data/firestore.dart';

class Add_creen extends StatefulWidget {
  const Add_creen({super.key});

  @override
  State<Add_creen> createState() => _Add_creenState();
}

class _Add_creenState extends State<Add_creen> {
  final title = TextEditingController();
  final subtitle = TextEditingController();

  FocusNode _focusNode1 = FocusNode();
  FocusNode _focusNode2 = FocusNode();
  int indexx = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
   backgroundColor: backgroundColors,
       appBar: AppBar(
        backgroundColor: custom_red, 
        elevation: 0, 
        centerTitle: true, 
        title: Text('Add New Task', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 24)),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              titleWidget(),
              const SizedBox(height: 20),
              subtitleWidget(),
              const SizedBox(height: 30),
              button(),
            ],
          ),
        ),
      ),
    );
  }

Widget button() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.red,
          minimumSize: const Size(170, 48),
        ),
        onPressed: () {
          Navigator.pop(context);
        },
        child: const Text(
          'Cancel',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold, 
          ),
        ),
      ),
      ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: custom_red, 
          minimumSize: const Size(170, 48),
        ),
        onPressed: () {
          Firestore_Datasource().AddNote(subtitle.text, title.text, indexx);
          Navigator.pop(context);
        },
        child: const Text(
          'Add Task',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ],
  );
}


  Widget titleWidget() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: TextField(
          controller: title,
          focusNode: _focusNode1,
          style: TextStyle(fontSize: 18, color: Colors.black),
          decoration: InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              hintText: 'title',
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: Color(0xffc5c5c5),
                  width: 2.0,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: custom_red,
                  width: 2.0,
                ),
              )),
        ),
      ),
    );
  }

  Padding subtitleWidget() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: TextField(
          maxLines: 3,
          controller: subtitle,
          focusNode: _focusNode2,
          style: TextStyle(fontSize: 18, color: Colors.black),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            hintText: 'subtitle',
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: Color(0xffc5c5c5),
                width: 2.0,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: custom_red,
                width: 2.0,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
