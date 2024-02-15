
import 'package:flutter/material.dart';
import 'package:mynotes/activity/ArchiveView.dart';
import 'package:mynotes/activity/MyHomeActivity.dart';
import 'package:mynotes/helper/colors.dart';

import '../activity/SettingsActivity.dart';

class DrawerMenuItem extends StatefulWidget {
  const DrawerMenuItem({super.key});

  @override
  State<DrawerMenuItem> createState() => _DrawerMenuItemState();
}

class _DrawerMenuItemState extends State<DrawerMenuItem> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        width: MediaQuery.of(context).size.width,
        color: bgColor,
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  child: Text('My Notes', style: TextStyle(fontSize: 25, color: myWhite.withOpacity(0.9), fontWeight: FontWeight.bold),)),
              Divider(
                color: myBlack5.withOpacity(0.3),
              ),
              NoteSection(context),
              NoteArchive(context),
              NoteSettings(context),

            ],
          ),
        ),
      ),
    );
  }
}

Widget NoteSection(context){
  return Container(
    margin: EdgeInsets.only(right: 20),
    child: TextButton(
      style:ButtonStyle(
          backgroundColor: MaterialStateColor.resolveWith((states) => Colors.orangeAccent.withOpacity(0.1)),
          overlayColor: MaterialStateColor.resolveWith((states) => myWhite.withOpacity(0.3)),
          shape: MaterialStateProperty.all(const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(50.0),
              bottomRight: Radius.circular(50.0),
            ),
          ),
          )
      ),
      onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => MyHomeActivity(),));
      },
      child: Container(
        margin: EdgeInsets.only(left: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(Icons.lightbulb, size: 25, color: Colors.white.withOpacity(0.7),),
            SizedBox(width: 20,),
            Text("Notes", style: TextStyle(fontSize: 18, color: Colors.white.withOpacity(.7)),)
          ],
        ),
      ),
    ),
  );
}
Widget NoteArchive(context){
  return Container(
    margin: EdgeInsets.only(right: 20),
    child: TextButton(
      style:ButtonStyle(
          overlayColor: MaterialStateColor.resolveWith((states) => myWhite.withOpacity(0.3)),
          shape: MaterialStateProperty.all(const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(50.0),
              bottomRight: Radius.circular(50.0),
            ),
          ),
          )
      ),
      onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => ArchiveView(),));
      },
      child: Container(
        margin: EdgeInsets.only(left: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(Icons.archive_outlined, size: 25, color: Colors.white.withOpacity(0.7),),
            SizedBox(width: 20,),
            Text("Archive", style: TextStyle(fontSize: 18, color: Colors.white.withOpacity(.7)),)
          ],
        ),
      ),
    ),
  );
}
Widget NoteSettings(context){
  return Container(
    margin: EdgeInsets.only(right: 20),
    child: TextButton(
      style:ButtonStyle(
          overlayColor: MaterialStateColor.resolveWith((states) => myWhite.withOpacity(0.3)),
          shape: MaterialStateProperty.all(const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(50.0),
              bottomRight: Radius.circular(50.0),
            ),
          ),
          )
      ),
      onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => SettingsActivity(),));
      },
      child: Container(
        margin: EdgeInsets.only(left: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(Icons.settings, color: Colors.white.withOpacity(0.7),size: 25,),
            const SizedBox(width: 20,),
            Text("Settings", style: TextStyle(color: Colors.white.withOpacity(.7), fontSize: 18),)
          ],
        ),
      ),
    ),
  );
}
