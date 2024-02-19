import 'package:flutter/material.dart';

import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:mynotes/services/db.dart';
import '../helper/colors.dart';
import '../model/MyNoteModel.dart';
import 'EditNote.dart';
import 'NoteView.dart';

class SearchNote extends StatefulWidget {
  const SearchNote({super.key});

  @override
  State<SearchNote> createState() => _SearchNoteState();
}

class _SearchNoteState extends State<SearchNote> {

  List<int>SearchResultIds=[]; //[1,2.3,4,5,6,7]
  List<Note?>SearchResultNote=[];

  bool isLoading=false;
  void SearchResults(String query) async{
    SearchResultNote.clear();
    isLoading=true;

    final resultIds = await NotesDatabase.instance.getNoteString(query);
    List<Note?>SearchResultNotesLocal = [];
    await Future.forEach(resultIds, (element) async {
      final SearchNote = await NotesDatabase.instance.ReadOneData(element);
      SearchResultNotesLocal.add(SearchNote);
      setState((){
        SearchResultNote.add(SearchNote);
      });
    });
    setState(() {
      isLoading=false;
    });
  }

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
            textInputAction: TextInputAction.search,
            style: TextStyle(fontSize: 18, color: myWhite),
            decoration: const InputDecoration(
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                hintText: 'Search',
                hintStyle: TextStyle(
                    color: Colors.grey, fontWeight: FontWeight.normal)),
            onSubmitted: (value){
              setState(() {
                SearchResults(value.toLowerCase());
              });
            },
          ),
        ),
        actions: [],
      ),
      backgroundColor: bgColor,
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Search Result",
                style: TextStyle(
                    color: myWhite2, fontSize: 22, fontWeight: FontWeight.bold),
              ),

              Container(

                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                //height: MediaQuery.of(context).size.height,
                child: MasonryGridView.count(
                  scrollDirection: Axis.vertical,
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: SearchResultNote.length,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => NoteView(note: SearchResultNote[index]!),));
                      },
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        //margin: const EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Colors.white.withOpacity(0.3)),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10))),
                        //width: MediaQuery.of(context).size.width,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(SearchResultNote[index]!.title.toString(), style: TextStyle(fontSize: 22, color: myWhite.withOpacity(0.9), fontWeight: FontWeight.bold),),
                            SizedBox(height: 5,),
                            Text(SearchResultNote[index]!.content.length>250?"${SearchResultNote[index]!.content.substring(0,201)}....." : SearchResultNote[index]!.content , style: TextStyle(fontSize: 17, color: myWhite.withOpacity(0.7)),),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
