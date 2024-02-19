import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mynotes/activity/MyHomeActivity.dart';
import 'package:mynotes/helper/colors.dart';
import 'package:mynotes/model/MyNoteModel.dart';
import 'package:mynotes/services/db.dart';
import 'EditNote.dart';
import 'package:fluttertoast/fluttertoast.dart';


class NoteView extends StatefulWidget {
  Note note;
   NoteView({super.key, required this.note});

  @override
  State<NoteView> createState() => _NoteViewState();
}

class _NoteViewState extends State<NoteView> {

  @override
  void initState() {
    super.initState();

    print(widget.note.pin);
  }

/*
  String heading="Heading";
  String longNote="The platform offers a high  of customization, allowing users to pers onalize their device's appearance, change themes, and use widgets for a unique user experience. It accommodates a wide range of devices, including smartphones, tablets, smart TVs, and other smart devices, providing users with choices from various manufacturers"
      "Android integrates seamlessly with Google services like Gmail, Google Maps, and Google Drive. This integration enables the synchronization of data and services across devices, contributing to a cohesive user experience. The operating system features a robust notification system, empowering users to interact with messages and updates promptly."
      "Android integrates seamlessly with Google services like Gmail, Google Maps, and Google Drive. This integration enables the synchronization of data and services across devices, contributing to a cohesive user experience. The operating system features a robust notification system, empowering users to interact with messages and updates promptly."
      "Android integrates seamlessly with Google services like Gmail, Google Maps, and Google Drive. This integration enables the synchronization of data and services across devices, contributing to a cohesive user experience. The operating system features a robust notification system, empowering users to interact with messages and updates promptly."
      "Android integrates seamlessly with Google services like Gmail, Google Maps, and Google Drive. This integration enables the synchronization of data and services across devices, contributing to a cohesive user experience. The operating system features a robust notification system, empowering users to interact with messages and updates promptly."
      "Android integrates seamlessly with Google services like Gmail, Google Maps, and Google Drive. This integration enables the synchronization of data and services across devices, contributing to a cohesive user experience. The operating system features a robust notification system, empowering users to interact with messages and updates promptly.";
  String smallNote="seamlessly with Google services like Gmail";
*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: myBlack2,
        foregroundColor: myWhite1,
        title: const Text("Note", style: TextStyle(color: Colors.white),),
        actions: [
          IconButton(onPressed: ()async{
            //print('Before PinUpdate: ${widget.note.pin}');
            await NotesDatabase.instance.PinUpdate(widget.note);
            widget.note = widget.note.copy(pin: !widget.note.pin);
            widget.note.pin? showToast('Pined') : showToast('Unpined');

            //print('After PinUpdate: ${widget.note.pin}');
            setState(() {});
            //Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MyHomeActivity(),));
          }, icon: widget.note.pin ?  const Icon(CupertinoIcons.pin_fill) :  const Icon(CupertinoIcons.pin_slash), splashRadius: 23.0,),

          IconButton(onPressed: ()async{
            await NotesDatabase.instance.ArchiveUpdate(widget.note);
            widget.note = widget.note.copy(isArchive: !widget.note.isArchive);
            widget.note.isArchive? showToast('Archive True') : showToast('Archive False');
            setState(() {
              
            });
          }, icon:widget.note.isArchive ? const Icon(Icons.archive_outlined) : Icon(Icons.archive)),
          IconButton(onPressed: (){
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text('Delete Confirmation'),
                  content: const Text('Are you sure you want to delete this item?'),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () async{
                        await NotesDatabase.instance.DeleteEntry(widget.note);
                        showToast('Note Delete Successfully');
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MyHomeActivity(),));
                      },
                      child: Text('Delete'),
                    ),
                    TextButton(
                      onPressed: () {
                        // Close the dialog
                        Navigator.of(context).pop();
                      },
                      child: Text('Cancel'),
                    ),
                  ],
                );
              },
            );
            //_showDeleteConfirmationDialog(context);
            //Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MyHomeActivity(),));
          }, icon: const Icon(Icons.delete_forever_outlined)),
          IconButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => EditNote(note: widget.note),));
          }, icon: const Icon(Icons.edit_outlined)),
        ],
      ),
      backgroundColor: bgColor,
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 15),
        decoration: const BoxDecoration(

        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(widget.note.title, style: TextStyle(color: myWhite2, fontSize: 22, fontWeight: FontWeight.bold),),
              const SizedBox(height: 7),
              Text(widget.note.content,textAlign: TextAlign.justify, style: TextStyle(color: myWhite2, fontSize: 14, fontWeight: FontWeight.normal,),),
            ],
          ),
        ),
      ),
    );
  }

  void showToast(String msg) {
    Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.blueGrey,
      textColor: Colors.white,
      fontSize: 18.0,
    );
  }
}

/*

void _showDeleteConfirmationDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Delete Confirmation'),
        content: Text('Are you sure you want to delete this item?'),
        actions: <Widget>[
          TextButton(
            onPressed: () async{
              await NotesDatabase.instance.DeleteEntry();
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MyHomeActivity(),));
            },
            child: Text('Delete'),
          ),
          TextButton(
            onPressed: () {
              // Close the dialog
              Navigator.of(context).pop();
            },
            child: Text('Cancel'),
          ),
        ],
      );
    },
  );
}*/
