import 'package:flutter/material.dart';
import 'package:mynotes/activity/NoteView.dart';
import 'package:mynotes/helper/colors.dart';
import 'package:mynotes/model/MyNoteModel.dart';
import 'package:mynotes/services/db.dart';

class EditNote extends StatelessWidget {
  Note note;
  EditNote({super.key, required this.note});

  @override
  Widget build(BuildContext context) {
    String heading = note.title;
    String description = note.content;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: myBlack2,
        foregroundColor: myWhite1,
        title: Text("Edit Note", style: TextStyle(color: Colors.white),),
        actions: [
          IconButton(onPressed: ()async{
            Note newNote=Note(id: note.id,pin: false,title: heading, content: description, createdTime: DateTime.now());
            await NotesDatabase.instance.UpdateData(newNote);
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => NoteView(note: newNote)));
          }, icon: Icon(Icons.save_outlined)),
        ],
      ),
      backgroundColor: bgColor,
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(

        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Form(child: TextFormField(
                initialValue: heading,
                onChanged: (value){
                  heading=value;
                },
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
              ),),
              SizedBox(
                height: 300,
                child: Form(child: TextFormField(
                  initialValue: description,
                  onChanged: (value){
                    description=value;
                  },
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
