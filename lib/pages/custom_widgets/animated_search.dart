// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:first_project/pages/homepage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:math';



class Search_bar extends StatelessWidget {
  const Search_bar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          AnimatedSearch(),
        ],
      ),
    );
  }
}

class AnimatedSearch extends StatefulWidget {
  const AnimatedSearch({super.key});

  @override
  _AnimatedSearchState createState() => _AnimatedSearchState();
}

class _AnimatedSearchState extends State<AnimatedSearch>
    with SingleTickerProviderStateMixin {
  late int toggle = 0;
  late AnimationController _con;
  late TextEditingController _textEditingController;
  late String searched;
  //late FocusNode _searchFocusNode;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 500), () {
      setState(() {
        toggle = 1;
      });
    });
    _textEditingController = TextEditingController();
    _con = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1000),
    );
    _con.forward();
    
  }

@override

  

  @override
  Widget build(BuildContext context) {
    var wid = Get.width;
    return Container(
      color: const Color.fromARGB(0, 252, 252, 252),
      child: Center(
        child: Container(
          height: 100.0,
          width: wid * 0.88,
          alignment: Alignment(1.0, 0.0),
          child: AnimatedContainer(
            duration: Duration(milliseconds: 400),
            height: 40.0,
            width: (toggle == 0) ? 48 : wid,
            curve: Curves.easeOut,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 255, 255, 255),
              borderRadius: BorderRadius.circular(20.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  spreadRadius: -10.0,
                  blurRadius: 10.0,
                  offset: Offset(0.0, 10.0),
                ),
              ],
            ),
            child: Stack(
              children: [
                AnimatedPositioned(
                  duration: Duration(milliseconds: 400),
                  top: 2.0,
                  left: 4, // Move mic icon to the left when expanded
                  curve: Curves.easeOut,
                  child: AnimatedOpacity(
                    opacity: (toggle == 0) ? 0.0 : 1.0,
                    duration: Duration(milliseconds: 400),
                    child: Container(
                      padding: EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 255, 255, 255),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: AnimatedBuilder(
                        child: Icon(
                          Icons.mic,
                          size: 20.0,
                        ),
                        builder: (context, widget) {
                          return Transform.rotate(
                            angle: _con.value * 2.0 * pi,
                            child: widget,
                          );
                        },
                        animation: _con,
                      ),
                    ),
                  ),
                ),
                AnimatedPositioned(
                  duration: Duration(milliseconds: 400),
                  left: (toggle == 0) ? 20.0 : 40.0,
                  curve: Curves.easeOut,
                  top: 4.0,
                  child: AnimatedOpacity(
                    opacity: (toggle == 0) ? 0.0 : 1.0,
                    duration: Duration(milliseconds: 400),
                    child: Container(
                      height: 25.0,
                      width: wid,
                      child: TextField(
                        autofocus: false,
                        controller: _textEditingController,
                        cursorRadius: Radius.circular(10.0),
                        cursorWidth: 2.0,
                        cursorColor: Colors.black,
                        //maxLines: null,
                        keyboardType: TextInputType.multiline,
                        scrollController: ScrollController(),
                        scrollPhysics: AlwaysScrollableScrollPhysics(),
                        decoration: InputDecoration(
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          labelText: 'Search..',
                          labelStyle: TextStyle(
                            color: Color(0xff5B5B5B),
                            fontSize: 15.0,
                            fontWeight: FontWeight.w500,
                          ),
                          //alignLabelWithHint: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            borderSide: BorderSide.none,
                          ),
                        ),
                        onChanged: (value) {
                          setState(() {
                            searched = value;
                            //print(searched);
                          });
                        },
                      ),
                    ),
                  ),
                ),
                Positioned(
                  right: 0,
                  top:0,
                  bottom: 0.3,
                  child: Material(
                    color: const Color.fromARGB(255, 255, 255, 255),
                    borderRadius: BorderRadius.circular(40.0),
                    child: IconButton(
                      splashRadius: 19.0,
                      icon: Icon(
                        Icons.search,
                        size: 23.0,
                      ),
                      onPressed: () {
                        setState(
                          () {
                            //initiate search;
                          },
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}