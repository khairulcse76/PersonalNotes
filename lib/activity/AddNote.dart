import 'package:flutter/material.dart';
import 'package:mynotes/activity/MyHomeActivity.dart';
import 'package:mynotes/helper/colors.dart';
import 'package:mynotes/model/MyNoteModel.dart';
import 'package:mynotes/services/db.dart';

class AddNewNote extends StatefulWidget {
  AddNewNote({super.key});

  @override
  State<AddNewNote> createState() => _AddNewNote();
}

class _AddNewNote extends State<AddNewNote> {
  String heading="Heading";

  TextEditingController titleCtrl=TextEditingController();
  TextEditingController descriptionCtrl=TextEditingController();

  @override
  void dispose() {
    super.dispose();
    titleCtrl.dispose();
    descriptionCtrl.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: myBlack2,
        foregroundColor: myWhite1,
        title: const Text("Add New Note", style: TextStyle(color: Colors.white),),
        actions: [
          IconButton(onPressed: () async{
            await NotesDatabase.instance.insertData(Note(pin: false, isArchive: false, title: titleCtrl.text, content: descriptionCtrl.text, createdTime: DateTime.now()));
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const MyHomeActivity(),));
          }, icon: const Icon(Icons.save_outlined)),
        ],
      ),
      backgroundColor: bgColor,
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        decoration: const BoxDecoration(

        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: titleCtrl,
                style: TextStyle( fontSize: 25, color: myWhite),
                decoration: InputDecoration(
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    hintText: 'Title',
                    hintStyle: TextStyle(
                        color: Colors.grey.withOpacity(0.8),
                        fontWeight: FontWeight.bold
                    )
                ),
              ),
              SizedBox(
                height: 300,
                child: TextField(
                  controller: descriptionCtrl,
                  style: TextStyle( fontSize: 18, color: myWhite),
                  keyboardType: TextInputType.multiline,
                  minLines: 50,
                  maxLines: null,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      hintText: 'Description',
                      hintStyle: TextStyle(
                          color: Colors.grey.withOpacity(0.8),
                          fontWeight: FontWeight.bold
                      )
                  ),
                ),
              ),

              /*Text("Heading", style: TextStyle(color: myWhite2, fontSize: 22, fontWeight: FontWeight.bold),),
              SizedBox(height: 7,),
              Text(longNote,textAlign: TextAlign.justify, style: TextStyle(color: myWhite2, fontSize: 14, fontWeight: FontWeight.normal,),),
            */
            ],
          ),
        ),
      ),
    );
  }
}
