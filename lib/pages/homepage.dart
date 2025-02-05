// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, dead_code, non_constant_identifier_names, prefer_const_declarations, sort_child_properties_last
//import 'dart:ffi';

import 'package:first_project/pages/signin.dart';
import 'package:first_project/pages/signup.dart';
import 'package:first_project/pages/MainPage.dart';
import 'package:first_project/pages/custom_widgets/autherntication_login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'dart:math';
import 'dart:convert';
import 'package:http/http.dart' as http;

class homepage extends StatelessWidget {
  final Auth authenticator = Get.put(Auth());
  List<Widget> lst = [
    CategoryTile(
      title: 'Sajek',
      imageUrl:
          'https://images.unsplash.com/photo-1539967430815-b3d193609067?q=80&w=988&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    ),
    CategoryTile(
      title: 'Cox\'s Bazar',
      imageUrl:
          'https://images.unsplash.com/photo-1539967430815-b3d193609067?q=80&w=988&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    ),
    CategoryTile(
      title: 'Tanguar Haor',
      imageUrl:
          'https://images.unsplash.com/photo-1539967430815-b3d193609067?q=80&w=988&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    ),
    CategoryTile(
      title: 'Sundar Ban',
      imageUrl:
          'https://images.unsplash.com/photo-1539967430815-b3d193609067?q=80&w=988&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    ),
  ];
  @override
  homepage({super.key});

  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        backgroundColor: Colors.purple[50],
        child: Column(
          children: [
            DrawerHeader(child: Icon(Icons.favorite)),
            ListTile(
              leading: Icon(Icons.camera),
              title: Text("V L O G S"),
              onTap: () {
                // Navigate to the Vlogs page
              },
            ),
            ListTile(
              leading: Icon(Icons.map),
              title: Text("D E S T I N A T I O N S"),
              onTap: () {
                // Navigate to destinations page
              },
            ),
            if (Auth.isLoggedIn)
              ListTile(
                leading: Icon(Icons.logout),
                title: Text("Log Out"),
                onTap: () async {
                  String token = await authenticator.read_token();
                  final uri = Uri.https('api.tripstins.com', '/api/v1/logout');
                  final header = {
                    'Accept': 'application/json',
                    'Authorization': 'Bearer ${token}',
                  };
                  try {
                    final response = await http.get(uri, headers: header);

                    if (response.statusCode == 200) {
                      print('Success: ${response.body}');
                      authenticator.logout(context);
                    } else if (response.statusCode == 400) {
                      print(
                          'Could not logout: token => ${token} \n ${response.body}');
                    } else
                      print('error 401 token => ${token}');
                  } catch (e) {
                    print('Error logging out: ${e}');
                  }
                  //authenticator.logout(context);

                  //Get.offNamed('/');
                },
              )
          ],
        ),
      ),
      appBar: AppBar(
          title: Text(
            "Logo",
            style: TextStyle(
              color: Colors.blue,
              fontWeight: FontWeight.w900,
            ),
          ),
          actions: <Widget>[
            IconButton(
                onPressed: () {
                  showSearch(context: context, delegate: searchdelegate());
                },
                icon: Icon(Icons.search))
          ]),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            //SizedBox(height: 10),
            // Header Section
            Stack(
              children: [
                Image.network(
                  'https://images.unsplash.com/photo-1539967430815-b3d193609067?q=80&w=988&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                  height: Get.height * 0.2,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
                Positioned(
                  top: 50,
                  left: 10,
                  child: Text(
                    'Exploring Made Easy...',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            // Category Section
            Padding(
              padding: EdgeInsets.all(2.0),
              child: SizedBox(
                height: 80,
                width: double.infinity,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  physics: PageScrollPhysics(),
                  controller: PageController(viewportFraction: 0.51),
                  itemCount: lst.length,
                  itemBuilder: (context, iter) {
                    return lst[iter];
                  },
                ),
              ),
            ),
            SizedBox(height: 10),
            Center(
              child: Material(
                elevation: 4,
                borderRadius: BorderRadius.circular(30),
                child: SizedBox(
                  height: 30,
                  width: Get.width * 0.7,
                  child: Row(
                    children: [
                      Expanded(
                          child: InkWell(
                              onTap: () {},
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(30),
                                  bottomLeft: Radius.circular(30)),
                              child: Center(
                                child: Row(
                                  children: [
                                    Spacer(),
                                    Icon(
                                      Icons.map,
                                      size: 12,
                                    ),
                                    Text(
                                      " Where To?",
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 12),
                                    ),
                                    Spacer(),
                                  ],
                                ),
                              ))),

                      //VerticalDivider(thickness: 0.1, color: Colors.grey[800],),
                      Expanded(
                          child: InkWell(
                        onTap: () {},
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(30),
                            bottomRight: Radius.circular(30)),
                        child: Center(
                          child: Row(
                            children: [
                              Spacer(),
                              Icon(Icons.calendar_month, size: 12),
                              Text(
                                ' When?',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 12),
                              ),
                              Spacer()
                            ],
                          ),
                        ),
                      ))
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 50),
            Row(
              //crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(width: 10),
                Text(
                  "Trending Tour Packages",
                  style: TextStyle(
                      fontFamily: 'Arial',
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ),
                Spacer(),
                Container(
                  height: 22, // Set the height of the container
                  width: 70, // Set the width of the container
                  decoration: BoxDecoration(
                      //color: Colors.black,
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: Colors.black, width: 1.0)),
                  child: InkWell(
                    onTap: () {}, //Go To the Trending page.
                    borderRadius: BorderRadius.circular(5),
                    child: Center(
                      child: Text(
                        'See More...',
                        style: TextStyle(color: Colors.black, fontSize: 10),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
              ],
            ),
            SizedBox(height: 10),
            SizedBox(
              height: 80,
              width: double.infinity,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                physics: PageScrollPhysics(),
                controller: PageController(viewportFraction: 0.51),
                itemCount: lst.length,
                itemBuilder: (context, iter) {
                  return lst[iter];
                },
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: Container(
                height: 40,
                width: Get.width * 0.95,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  image: DecorationImage(
                    image: NetworkImage(
                        'https://images.unsplash.com/photo-1539967430815-b3d193609067?q=80&w=988&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Center(
                  child: Text(
                    '"If you never go, you will never know."',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 15,
                      //fontStyle: FontStyle.italic,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Row(
              //crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(width: 10),
                Text(
                  "Hire Guides",
                  style: TextStyle(
                      fontFamily: 'Arial',
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ),
                Spacer(),
                Container(
                  height: 22,
                  width: 70,
                  decoration: BoxDecoration(
                      //color: Colors.black,
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: Colors.black, width: 1.0)),
                  child: InkWell(
                    onTap: () {}, //Go To the Trending page.
                    borderRadius: BorderRadius.circular(5),
                    child: Center(
                      child: Text(
                        'See More...',
                        style: TextStyle(color: Colors.black, fontSize: 10),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 200,
              width: double.infinity,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                physics: PageScrollPhysics(),
                controller: PageController(viewportFraction: 0.51),
                itemCount: 5,
                itemBuilder: (context, iter) {
                  return GuideTiles();
                },
              ),
            ),

            SizedBox(height: 10),
            // Destinations and Travel Blog Sections
            Center(
              child: Container(
                height: 40,
                width: Get.width * 0.95,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  image: DecorationImage(
                    image: NetworkImage(
                        'https://images.unsplash.com/photo-1539967430815-b3d193609067?q=80&w=988&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Center(
                  child: Text(
                    '"Travelling is a way of self healing"',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 15,
                      //fontStyle: FontStyle.italic,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Footer(),
          ],
        ),
      ),
    );
  }
}

class CategoryTile extends StatelessWidget {
  final String title;
  final String imageUrl;

  const CategoryTile({required this.title, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.5),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
        ),
        child: Stack(children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(imageUrl,
                width: 90, height: 70, fit: BoxFit.cover),
          ),
          Positioned(
              bottom: 7,
              left: 3,
              child: Text(title,
                  style: TextStyle(fontSize: 11, color: Colors.white))),
        ]),
      ),
    );
  }
}

class Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Logo',
            style: TextStyle(
                color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FooterColumn(
                  title: 'Connect',
                  items: ['Facebook', 'Instagram', 'Twitter']),
              FooterColumn(
                  title: 'Support',
                  items: ['Contact Us', 'Help', 'Privacy Policy']),
            ],
          ),
          SizedBox(height: 10),
          Text(
            '© 2024 Travel App. All rights reserved.',
            style: TextStyle(color: Colors.grey[400]),
          ),
        ],
      ),
    );
  }
}

class FooterColumn extends StatelessWidget {
  final String title;
  final List<String> items;

  const FooterColumn({required this.title, required this.items});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        ...items.map((item) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: Text(item, style: TextStyle(color: Colors.grey[400])),
            )),
      ],
    );
  }
}

class searchdelegate extends SearchDelegate<String> {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      // Mic icon
      IconButton(onPressed: () {}, icon: Icon(Icons.mic)),
      // Clear query button
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
      //IconButton(onPressed: (){},icon: Icon(Icons.man))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, '');
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // Implement your search results display
    return ListView(
      children: [
        Text('Showing Search Results For: $query',
            style: TextStyle(color: Colors.black)),
        // Add search result items
      ],
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeOut,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 252, 252, 252),
        borderRadius: BorderRadius.circular(5.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            spreadRadius: -10.0,
            blurRadius: 10.0,
            offset: const Offset(0.0, 10.0),
          ),
        ],
      ),
      child: ListView(
        children: [
          // Suggestion items based on the current query
          if (query.isNotEmpty)
            ...getSuggestions(query).map(
              (suggestion) => ListTile(
                title: Text(suggestion),
                onTap: () {
                  query = suggestion;
                  showResults(context);
                },
              ),
            ),
        ],
      ),
    );
  }

  // Sample method to generate suggestions
  List<String> getSuggestions(String query) {
    // Implement your suggestion logic here
    final suggestions = [
      'Apple',
      'Banana',
      'Cherry',
      'Date',
      'Elderberry',
    ];

    return suggestions
        .where((suggestion) =>
            suggestion.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }

  @override
  ThemeData appBarTheme(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return theme.copyWith(
      inputDecorationTheme: InputDecorationTheme(
        hintStyle: TextStyle(
          color: theme.primaryColorLight,
          fontSize: 18.0,
        ),
        border: InputBorder.none,
      ),
      textTheme: TextTheme(
        titleLarge: TextStyle(
          color: theme.primaryColor,
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class GuideTiles extends StatelessWidget {
  const GuideTiles({super.key});

  @override
  Widget build(BuildContext context) {
    final String name = "Hasan Abi";
    final bool Available = true;
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        height: 170,
        width: 200,
        decoration: BoxDecoration(
            //border: Border.all(width: 1),
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: const Color.fromARGB(255, 255, 255, 255),
            boxShadow: [
              BoxShadow(
                color: const Color.fromARGB(255, 3, 8, 4).withOpacity(0.2),
                offset: Offset(4, 4),
                blurRadius: 5,
              ),
              BoxShadow(
                color: const Color.fromARGB(255, 5, 255, 47).withOpacity(0.2),
                offset: Offset(-4, -4),
                blurRadius: 5,
              ),
            ]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              child: Container(
                height: 90,
                width: 200,
                child: Image(
                  image: NetworkImage(
                      'https://images.pexels.com/photos/1222271/pexels-photo-1222271.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              height: 4,
            ),
            Center(
              child: Text(
                ' $name',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: const Color.fromARGB(255, 5, 1, 1)),
              ),
            ),
            if (Available)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 3,
                    backgroundColor: const Color.fromARGB(255, 112, 253, 116),
                  ),
                  Padding(
                      padding: EdgeInsets.all(2.5), child: Text('Available')),
                ],
              )
            else
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 3,
                    backgroundColor: const Color.fromARGB(255, 250, 0, 0),
                  ),
                  Padding(padding: EdgeInsets.all(2.5), child: Text('Offline')),
                ],
              ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  ' Guiding areas: ',
                  style: TextStyle(fontSize: 10),
                ),
                SizedBox(width: 5),
                Text(
                  'From Employee DataBase',
                  style: TextStyle(fontSize: 10),
                ),
              ],
            ),
            SizedBox(height: 5),
            Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                SizedBox(
                  height: 25,
                  width: 75,
                  child: FloatingActionButton(
                    onPressed: () {},
                    backgroundColor: Colors.white,
                    elevation: 4,
                    child: Text(
                      'Hire Now',
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                ),
                Spacer(),
                SizedBox(
                  height: 25,
                  width: 75,
                  child: FloatingActionButton(
                    onPressed: () {},
                    backgroundColor: Colors.white,
                    elevation: 4,
                    child: Text(
                      'View Profile',
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                ),
                SizedBox(width: 10),
              ],
            )
          ],
        ),
      ),
    );
  }
}
