import 'package:flutter/material.dart';
import 'package:mynotes/helper/colors.dart';
import 'package:mynotes/model/MyNoteModel.dart';
import 'EditNote.dart';

class NoteView extends StatelessWidget {
  Note note;
   NoteView({super.key, required this.note});

  String heading="Heading";
  String longNote="The platform offers a high  of customization, allowing users to pers onalize their device's appearance, change themes, and use widgets for a unique user experience. It accommodates a wide range of devices, including smartphones, tablets, smart TVs, and other smart devices, providing users with choices from various manufacturers"
      "Android integrates seamlessly with Google services like Gmail, Google Maps, and Google Drive. This integration enables the synchronization of data and services across devices, contributing to a cohesive user experience. The operating system features a robust notification system, empowering users to interact with messages and updates promptly."
      "Android integrates seamlessly with Google services like Gmail, Google Maps, and Google Drive. This integration enables the synchronization of data and services across devices, contributing to a cohesive user experience. The operating system features a robust notification system, empowering users to interact with messages and updates promptly."
      "Android integrates seamlessly with Google services like Gmail, Google Maps, and Google Drive. This integration enables the synchronization of data and services across devices, contributing to a cohesive user experience. The operating system features a robust notification system, empowering users to interact with messages and updates promptly."
      "Android integrates seamlessly with Google services like Gmail, Google Maps, and Google Drive. This integration enables the synchronization of data and services across devices, contributing to a cohesive user experience. The operating system features a robust notification system, empowering users to interact with messages and updates promptly."
      "Android integrates seamlessly with Google services like Gmail, Google Maps, and Google Drive. This integration enables the synchronization of data and services across devices, contributing to a cohesive user experience. The operating system features a robust notification system, empowering users to interact with messages and updates promptly.";
  String smallNote="seamlessly with Google services like Gmail";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: myBlack2,
        foregroundColor: myWhite1,
        title: Text("Note", style: TextStyle(color: Colors.white),),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.push_pin_outlined), splashRadius: 23.0,),
          IconButton(onPressed: (){}, icon: Icon(Icons.archive_outlined)),
          IconButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => EditNote(note: note),));
          }, icon: Icon(Icons.edit_outlined)),
        ],
      ),
      backgroundColor: bgColor,
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 15),
        decoration: BoxDecoration(

        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(note.title, style: TextStyle(color: myWhite2, fontSize: 22, fontWeight: FontWeight.bold),),
              SizedBox(height: 7),
              Text(note.content,textAlign: TextAlign.justify, style: TextStyle(color: myWhite2, fontSize: 14, fontWeight: FontWeight.normal,),),
            ],
          ),
        ),
      ),
    );
  }
}
