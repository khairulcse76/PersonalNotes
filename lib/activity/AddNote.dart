import 'package:flutter/material.dart';
import 'package:mynotes/helper/colors.dart';

class AddNewNote extends StatefulWidget {
  AddNewNote({super.key});

  @override
  State<AddNewNote> createState() => _AddNewNote();
}

class _AddNewNote extends State<AddNewNote> {
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
        title: const Text("Add New Note", style: TextStyle(color: Colors.white),),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.save_outlined)),
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
              TextField(
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
