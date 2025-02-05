// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class user_profile extends StatefulWidget {
  const user_profile({super.key});

  @override
  State<user_profile> createState() => _user_profileState();
}

class _user_profileState extends State<user_profile> {
  final List<Widget> _user_vlogs = [
    AnimatedBlogCard(
      title: "How to visit Sajek valley in Rangamati",
      location: "Rangamati",
      imageUrl:
          'https://images.unsplash.com/photo-1539967430815-b3d193609067?q=80&w=988&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D', // Replace with real image URL
    ),
    AnimatedBlogCard(
      title: "7 Tips For Visiting Tanguar Haor",
      location: "Sunamganj",
      imageUrl:
          'https://images.unsplash.com/photo-1539967430815-b3d193609067?q=80&w=988&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D', // Replace with real image URL
    ),
    AnimatedBlogCard(
      title: "Kuakata Travel Guide",
      location: "Patuakhali",
      imageUrl:
          'https://images.unsplash.com/photo-1539967430815-b3d193609067?q=80&w=988&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D', // Replace with real image URL
    ),
    AnimatedBlogCard(
      title: "Kuakata Travel Guide",
      location: "Patuakhali",
      imageUrl:
          'https://images.unsplash.com/photo-1539967430815-b3d193609067?q=80&w=988&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D', // Replace with real image URL
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Logo",
          style: TextStyle(
            color: Colors.blue,
            fontWeight: FontWeight.w900,
          ),
        ),
        actions: <Widget>[
          SizedBox(width: 10),
          GestureDetector(
            onTap: () {
              // Add Blog action
            },
            child: Text(
              "Edit Profile",
              style: TextStyle(color: Colors.purple[900]),
            ),
          ),
          SizedBox(width: 10),
          Container(
            height: 45,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                elevation: 5,
              ),
              onPressed: () {},
              child: const Row(
                children: [
                  CircleAvatar(
                    radius: 18,
                    backgroundImage: NetworkImage(
                        'https://scontent.fdac134-1.fna.fbcdn.net/v/t39.30808-6/322129857_724753472333572_2232619784599132458_n.jpg?_nc_cat=110&ccb=1-7&_nc_sid=a5f93a&_nc_eui2=AeERORM9gMHG0GhkzTvZjGKYm7M3hvTn3WabszeG9OfdZksosfwXAK8Fu7lwBYE59ULuDRy2kfaKXd9sgBwnkWtc&_nc_ohc=E-S7LidoiwMQ7kNvgFmTdMS&_nc_zt=23&_nc_ht=scontent.fdac134-1.fna&_nc_gid=Ay7_kRTNRUsW0YxMLu7XfBN&oh=00_AYDSuC1FPAAAAeFXWljfY8KOaGGv59m60HwGlP7d57Nkrw&oe=674B5571'), // Replace with your image asset
                  ),
                  SizedBox(width: 5),
                  Text(
                    'Sazzad',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Cover Photo and Profile Pic
            Stack(
              children: [
                // Cover Photo
                Container(
                  height: Get.height * 0.25,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                          'https://images.unsplash.com/photo-1539967430815-b3d193609067?q=80&w=988&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'), // Replace with your cover photo URL
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                // Profile Info Overlay
                Positioned(
                  bottom: 30,
                  left: 20,
                  right: 20,
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 40,
                        backgroundColor: Colors.grey[300],
                        child:
                            Icon(Icons.person, size: 50, color: Colors.white),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Sazzad",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        "@sazzad123",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey[200],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            // Blog Section
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              child: Row(
                children: [
                  SizedBox(width: 15),
                  Text(
                    "My Blogs",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  ElevatedButton(
                    onPressed: () {
                      // Add Blog action
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange[900],
                      foregroundColor: Colors.white,
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    child: Text("Add Blog"),
                  ),
                  SizedBox(width: 15)
                ],
              ),
            ),

            // Blog Cards
            Padding(
              padding: EdgeInsets.all(5),
              child: SizedBox(
                height: 100,
                width: double.infinity,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  physics: PageScrollPhysics(),
                  controller: PageController(viewportFraction: 0.51),
                  itemCount: _user_vlogs.length,
                  itemBuilder: (context, iter) {
                    return _user_vlogs[iter];
                  },
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              height: 22,
              width: 90,
              decoration: BoxDecoration(
                  //color: Colors.black,
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: Colors.black, width: 1.0)),
              child: InkWell(
                onTap: () {}, //Go To User vlogs page.
                borderRadius: BorderRadius.circular(5),
                child: Center(
                  child: Text(
                    'See All Vlogs',
                    style: TextStyle(color: Colors.black, fontSize: 10),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AnimatedBlogCard extends StatefulWidget {
  final String title;
  final String location;
  final String imageUrl;

  // const AnimatedBlogCard({
  //   Key? key,
  //   required this.title,
  //   required this.location,
  //   required this.imageUrl,
  // }) : super(key: key);
  const AnimatedBlogCard(
      {super.key,
      required this.title,
      required this.location,
      required this.imageUrl});

  @override
  _AnimatedBlogCardState createState() => _AnimatedBlogCardState();
}

class _AnimatedBlogCardState extends State<AnimatedBlogCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(seconds: 8),
      vsync: this,
    );

    // Define the animation with a delay at the beginning
    _animation = Tween<double>(begin: 0, end: -1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0.2, 1.0, curve: Curves.linear), // 20% delay
      ),
    );
    _controller.repeat();
    // Future.delayed(Duration(seconds: 1), () {
    //   _controller.repeat(); // Loop the animation
    // });
  }

  //@override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  //@override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width * 0.35,
      margin: EdgeInsets.symmetric(horizontal: 5),
      child: Wrap(
        spacing: 8.0,
        runSpacing: 8.0,
        runAlignment: WrapAlignment.spaceEvenly,
        //crossAxisAlignment: CrossAxisAlignment.start,
        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(
                image: NetworkImage(widget.imageUrl),
                fit: BoxFit.cover,
              ),
            ),
            child: Stack(
              children: [
                Positioned(
                  left: 5,
                  bottom: 25,
                  child: Text(
                    widget.location,
                    style: TextStyle(
                        color: Colors.cyan, fontWeight: FontWeight.bold),
                  ),
                ),
                AnimatedBuilder(
                  animation: _animation,
                  builder: (context, child) {
                    // Translate the position of the text based on the animation value
                    return Positioned(
                      left: (_animation.value * Get.width * 0.28) + 5,
                      bottom: 5,
                      //left: 5,
                      child: child!,
                    );
                  },
                  child: Text(
                    widget.title,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
