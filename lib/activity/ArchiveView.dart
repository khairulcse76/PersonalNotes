import 'package:flutter/material.dart';
import 'package:mynotes/activity/NoteView.dart';
import 'package:mynotes/helper/colors.dart';
import 'package:mynotes/model/MyNoteModel.dart';
import 'package:mynotes/widgets/DrawerMenuItem.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'AddNote.dart';

class ArchiveView extends StatefulWidget {
  const ArchiveView({super.key});

  @override
  State<ArchiveView> createState() => _ArchiveViewState();
}

class _ArchiveViewState extends State<ArchiveView> {
  final GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

  String heading="Heading";
  String longNote="The platform offers a high  of customization, allowing users to pers onalize their device's appearance, change themes, and use widgets for a unique user experience. It accommodates a wide range of devices, including smartphones, tablets, smart TVs, and other smart devices, providing users with choices from various manufacturers"
      "Android integrates seamlessly with Google services like Gmail, Google Maps, and Google Drive. This integration enables the synchronization of data and services across devices, contributing to a cohesive user experience. The operating system features a robust notification system, empowering users to interact with messages and updates promptly.";
  String smallNote="seamlessly with Google services like Gmail";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawerEnableOpenDragGesture: true,
      drawer: const DrawerMenuItem(),
      key: _drawerKey,
      backgroundColor: bgColor,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => AddNewNote(),));
        },
        child: Icon(Icons.add),
        backgroundColor: cardColor,
        foregroundColor: myWhite2,
        splashColor: bgColor,
        hoverColor: Colors.green,
        elevation: 0.0,
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
                          Text('Archive', style: TextStyle(fontSize: 18, color: myWhite.withOpacity(0.5)),),
                        ],
                      ),
                    ),
                    /*ListViewCustom(context),*/
                    boxGridView(context),
                    ColorGridView(context),
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
        itemCount: 10,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: (){
              //Navigator.push(context, MaterialPageRoute(builder: (context) => NoteView(note,),));
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
                  Text(heading, style: TextStyle(fontSize: 22, color: myWhite, fontWeight: FontWeight.bold),),
                  SizedBox(height: 5,),
                  Text(index.isOdd?longNote.length>250?"${longNote.substring(0,201)}....." : longNote :smallNote, style: TextStyle(fontSize: 17, color: myWhite.withOpacity(0.9)),),
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
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      //height: MediaQuery.of(context).size.height,
      child: MasonryGridView.count(
        scrollDirection: Axis.vertical,
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 120,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: (){
             // Navigator.push(context, MaterialPageRoute(builder: (context) => NoteView(),));
            },
            child: Container(
              padding: const EdgeInsets.all(8),
              //margin: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.white.withOpacity(0.3)),
                  borderRadius: BorderRadius.all(Radius.circular(10))
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
                    onPressed: () {},
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
                    onPressed: () {},
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
