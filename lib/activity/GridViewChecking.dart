import 'package:flutter/material.dart';
import 'package:mynotes/helper/colors.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class myCustomiseGridView extends StatefulWidget {
  const myCustomiseGridView({super.key});

  @override
  State<myCustomiseGridView> createState() => _myCustomiseGridViewState();
}

class _myCustomiseGridViewState extends State<myCustomiseGridView> {

  String LongNote = "Evenly divided in n column The height of each row is equal to the width of each columnA pattern defines the size of the tiles and different mode of repetition are possible";
  String ShortNote = "olumnA pattern defines the size of the tiles and different mode of repetition are possible";

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            //height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: bgColor,
            child: Column(
              children: [
                Container(
                 // height: MediaQuery.of(context).size.height,
                  child: MasonryGridView.count(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    crossAxisCount: 2,
                    mainAxisSpacing: 8,
                    crossAxisSpacing:9,
                    itemCount: 200,
                    itemBuilder: (context, index) {
                      return Container(
                        decoration: BoxDecoration(
                          color: myWhite
                        ),
                        child: Text(index.isEven? LongNote:ShortNote),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
