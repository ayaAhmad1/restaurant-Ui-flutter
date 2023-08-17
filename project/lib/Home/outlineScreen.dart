import 'package:flutter/material.dart';
import 'package:project/Home/categoryScreen.dart';
import 'package:project/Home/profileScreen.dart';
import 'package:project/firebaseStorage/homePageScreen.dart';

class OutlineScreen extends StatefulWidget {
  const OutlineScreen({super.key});

  @override
  State<OutlineScreen> createState() => _OutlineScreenState();
}

class _OutlineScreenState extends State<OutlineScreen> {
  int currentIndex =0;
  List<Widget>Screens =[
    const HomePageScreen(),
    const CategoriesScreen(),
    const ProfileScreen(),
    
  ];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        currentIndex: currentIndex,
        onTap: (index){
          setState(() {
            currentIndex =index;
          });
        },
        items:const[
        BottomNavigationBarItem(icon: Icon(Icons.home),label: "Home"),
        BottomNavigationBarItem(icon: Icon(Icons.category),label: "Categories"),
        BottomNavigationBarItem(icon: Icon(Icons.person),label: "Profile"),
      ]
      ),
      
    );
  }
}