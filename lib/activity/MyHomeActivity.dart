import 'package:flutter/material.dart';
import 'package:mynotes/activity/NoteView.dart';
import 'package:mynotes/activity/SearchNote.dart';
import 'package:mynotes/helper/colors.dart';
import 'package:mynotes/model/MyNoteModel.dart';
import 'package:mynotes/services/db.dart';
import 'package:mynotes/widgets/DrawerMenuItem.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'AddNote.dart';

class MyHomeActivity extends StatefulWidget {
  const MyHomeActivity({super.key});

  @override
  State<MyHomeActivity> createState() => _MyHomeActivityState();
}

class _MyHomeActivityState extends State<MyHomeActivity> {

  List<Note> notesList = [];
bool isLoading = true;
bool isGridView=true;

  final GlobalKey<ScaffoldState> _drawerKey = GlobalKey();
  bool grid=false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    //deleteData();
    /*createEntry(Note(pin: false, title: "This Title for Small post",
    content: "$smallNote",
     createdTime: DateTime.now()));*/
    getAllNotes();
    //getOneNote();
    //updateoneNotes();
  }

  Future createEntry(Note note) async{
    await NotesDatabase.instance.insertData(note);
  }

  Future getAllNotes() async{
   this.notesList =  await NotesDatabase.instance.ReadAllData();

  await Future.delayed( const Duration(seconds: 1));
   setState(() {
     isLoading=false;
   });
  }
  Future getOneNote(int id) async{
    await NotesDatabase.instance.ReadOneData(id);
  }
  Future updateOneNotes(Note note) async{
    await NotesDatabase.instance.UpdateData(note);
  }
  Future deleteData(Note note) async{
    await NotesDatabase.instance.DeleteEntry(note);
  }

  String heading="Heading";
  String longNote="The platform offers a high  of customization, allowing users to pers onalize their device's appearance, change themes, and use widgets for a unique user experience. It accommodates a wide range of devices, including smartphones, tablets, smart TVs, and other smart devices, providing users with choices from various manufacturers"
  "Android integrates seamlessly with Google services like Gmail, Google Maps, and Google Drive. This integration enables the synchronization of data and services across devices, contributing to a cohesive user experience. The operating system features a robust notification system, empowering users to interact with messages and updates promptly.";
  String smallNote="seamlessly with Google services like Gmail";

  @override
  Widget build(BuildContext context) {
    return isLoading? Scaffold(backgroundColor: bgColor,body:Center(child: Container(child: CircularProgressIndicator(color: Colors.blue,),),),):
      Scaffold(
      endDrawerEnableOpenDragGesture: true,
      drawer: const DrawerMenuItem(),
        key: _drawerKey,
        backgroundColor: bgColor,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => AddNewNote(),));
          },
          backgroundColor: cardColor,
          foregroundColor: myWhite2,
          splashColor: bgColor,
          hoverColor: Colors.green,
          elevation: 0.0,
          child: const Icon(Icons.add),
        ),
        body: SafeArea(
            child: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              //height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                color: bgColor,
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    AppBarCustom(context),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('All', style: TextStyle(fontSize: 18, color: myWhite.withOpacity(0.5)),),
                        ],
                      ),
                    ),
                    isGridView?boxGridView(context):ListViewCustom(context),
                    //ColorGridView(context),
                  ],
                ),
              ),
            ),
          ],
        ),
       ),
    );
  }

  Container ListViewCustom(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      //height: MediaQuery.of(context).size.height,
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: notesList.length,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => NoteView(note: notesList[index]),));
            },
            child: Container(
              padding: const EdgeInsets.all(8),
              margin: const EdgeInsets.symmetric(vertical: 5),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.white.withOpacity(0.5)),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color:index.isOdd?Colors.white.withOpacity(0.3): Colors.white.withOpacity(0.4),
              ),
              //width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(notesList[index].title, style: TextStyle(fontSize: 22, color: myWhite, fontWeight: FontWeight.bold),),
                  SizedBox(height: 5,),
                  Text(notesList[index].content.length>250?"${notesList[index].content.substring(0,201)}....." : notesList[index].content , style: TextStyle(fontSize: 17, color: myWhite.withOpacity(0.9)),),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  // my written codded
  Container boxGridView(BuildContext context) {
    return Container(
                    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    //height: MediaQuery.of(context).size.height,
                    child: MasonryGridView.count(
                      scrollDirection: Axis.vertical,
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: notesList.length,
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => NoteView(note: notesList[index])));
                          },
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            //margin: const EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.white.withOpacity(0.3)),
                              borderRadius: const BorderRadius.all(Radius.circular(10))
                            ),
                            //width: MediaQuery.of(context).size.width,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(notesList[index].title, style: TextStyle(fontSize: 22, color: myWhite.withOpacity(0.9), fontWeight: FontWeight.bold),),
                                SizedBox(height: 5,),
                                Text(notesList[index].content.length>250?"${notesList[index].content.substring(0,201)}....." : notesList[index].content , style: TextStyle(fontSize: 17, color: myWhite.withOpacity(0.7)),),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  );
  }

  Container AppBarCustom(BuildContext context) {
    return Container(
                  decoration: BoxDecoration(
                    color: cardColor,
                    borderRadius: BorderRadius.circular(15),
                      //border: Border.all(color: Colors.red)
                  ),
                  width: MediaQuery.of(context).size.width,
                  height: 55,
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  padding: EdgeInsets.symmetric(horizontal: 2, vertical: 2),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        //width: MediaQuery.of(context).size.width,
                        decoration: const BoxDecoration(
                            //border: Border.all(width: 1, color: Colors.green)
                        ),
                        child: Row( // Search Button
                          /*mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,*/
                          children: [
                            IconButton(
                                onPressed: () {
                                  _drawerKey.currentState!.openDrawer();
                                },
                                icon: Icon(
                                  Icons.menu,
                                  color: myWhite1,
                                )),
                            TextButton(
                                style:ButtonStyle(
                                    overlayColor: MaterialStateColor.resolveWith((states) => myWhite.withOpacity(0.1)),
                                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(50.00)
                                    ))
                                ),
                                onPressed: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => SearchNote(),));
                                },
                                child: Container(
                                  padding: EdgeInsets.only(right: 50),
                                  child: Text(
                                    "Search your Note",
                                    style: TextStyle(color: myWhite.withOpacity(.7)),
                                  ),
                                )),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 5),
                        //width: MediaQuery.of(context).size.width,
                        decoration: const BoxDecoration(
                          /*border: Border.all(width: 1, color: Colors.white)*/
                        ),
                        child: Row( //Profile Icons
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                              style:ButtonStyle(
                                overlayColor: MaterialStateColor.resolveWith((states) => myWhite.withOpacity(0.1)),
                                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50.00)
                                ))
                              ),
                                onPressed: () {
                                setState(() {
                                  isGridView= isGridView?false:true;
                                });
                                },
                                child: Icon(
                                  Icons.grid_view,
                                  color: myWhite1,
                                )),
                            const SizedBox(width: 5,),
                            CircleAvatar(
                              backgroundColor: myWhite1,
                              radius: 18,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                );
  }

  Container ColorGridView(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      //height: MediaQuery.of(context).size.height,
      child: MasonryGridView.count(
        scrollDirection: Axis.vertical,
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 12,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            padding: const EdgeInsets.all(8),
            //margin: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.green.withOpacity(0.5)),
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color:index.isOdd?Colors.green[900]: Colors.blue[900]
            ),
            //width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(heading, style: TextStyle(fontSize: 22, color: myWhite.withOpacity(0.9), fontWeight: FontWeight.bold),),
                SizedBox(height: 5,),
                Text(index.isOdd?longNote.length>250?"${longNote.substring(0,201)}....." : longNote :smallNote, style: TextStyle(fontSize: 17, color: myWhite.withOpacity(0.7)),),
              ],
            ),
          );
        },
      ),
    );
  }


}
