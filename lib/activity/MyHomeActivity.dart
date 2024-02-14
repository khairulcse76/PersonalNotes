import 'package:flutter/material.dart';
import 'package:mynotes/helper/colors.dart';
import 'package:mynotes/widgets/DrawerMenuItem.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class MyHomeActivity extends StatefulWidget {
  const MyHomeActivity({super.key});

  @override
  State<MyHomeActivity> createState() => _MyHomeActivityState();
}

class _MyHomeActivityState extends State<MyHomeActivity> {
  final GlobalKey<ScaffoldState> _drawerKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawerEnableOpenDragGesture: true,

      drawer: const DrawerMenuItem(),
        key: _drawerKey,
        backgroundColor: bgColor,
        body: SafeArea(
            child: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                color: bgColor,
              ),
              child: Column(
                children: [
                  AppBar(context),
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
                ],
              ),
            ),
          ],
        ),
       ),
    );
  }

  Container AppBar(BuildContext context) {
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
}
