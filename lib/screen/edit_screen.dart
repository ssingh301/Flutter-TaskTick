import 'package:flutter/material.dart';
import 'package:tasktick/const/colors.dart';
import 'package:tasktick/data/firestore.dart';
import 'package:tasktick/model/notes_model.dart';

class Edit_Screen extends StatefulWidget {
  final Note _note;
  const Edit_Screen(this._note, {super.key});

  @override
  State<Edit_Screen> createState() => _Edit_ScreenState();
}

class _Edit_ScreenState extends State<Edit_Screen> {
  TextEditingController? title;
  TextEditingController? subtitle;

  final FocusNode _focusNode1 = FocusNode();
  final FocusNode _focusNode2 = FocusNode();
  int indexx = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    title = TextEditingController(text: widget._note.title);
    subtitle = TextEditingController(text: widget._note.subtitle);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColors,
       appBar: AppBar(
        backgroundColor: custom_red, 
        elevation: 0,
        centerTitle: true, 
        title: Text('Edit Task', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 24)),
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
          Firestore_Datasource().Update_Note(
              widget._note.id, indexx, title!.text, subtitle!.text); 
          Navigator.pop(context);
        },
        child: const Text(
          'Edit Task',
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
          style: const TextStyle(fontSize: 18, color: Colors.black),
          decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              hintText: 'title',
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
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
          style: const TextStyle(fontSize: 18, color: Colors.black),
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            hintText: 'subtitle',
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
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
