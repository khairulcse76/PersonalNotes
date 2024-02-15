import 'package:flutter/material.dart';

import '../helper/colors.dart';
import 'EditNote.dart';
class SearchNote extends StatefulWidget {
  const SearchNote({super.key});

  @override
  State<SearchNote> createState() => _SearchNoteState();
}

class _SearchNoteState extends State<SearchNote> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.white38,
        foregroundColor: myWhite1,
        title: Container(
          child: TextField(
            style: TextStyle( fontSize: 18, color: myWhite),
            decoration: InputDecoration(
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                hintText: 'Search',
                hintStyle: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.normal
                )
            ),
          ),
        ),
        actions: [

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
              Text("Heading", style: TextStyle(color: myWhite2, fontSize: 22, fontWeight: FontWeight.bold),),
              SizedBox(height: 7,),
              Text("longNote",textAlign: TextAlign.justify, style: TextStyle(color: myWhite2, fontSize: 14, fontWeight: FontWeight.normal,),),
            ],
          ),
        ),
      ),
    );
  }
}
