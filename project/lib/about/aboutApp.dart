import 'package:flutter/material.dart';

class AboutApp extends StatelessWidget {
  const AboutApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            "About App",
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 25,
            ),
          ),
          centerTitle: true,
          backgroundColor: Color.fromARGB(255, 11, 201, 157),
          actions: [
            CircleAvatar(
              radius: 25,
              child: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.error_outline,
                  size: 25,
                ),
              ),
            ),
            SizedBox(
              width: 10,
            ),
          ]),
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: ListView(
          children: [
            Image(
              image: AssetImage('assets/images/app.jpg'),
              width:800,
              height: 220,
            ),
            Text(
              "This app is about Restaurant . This app is made by flutter . It contains several pages , The first page contains welcome screen. The second page is register page . You can create account or go to login page if you have account . The third page is home page that contains all food the restaurant presents . The fourth page contains all categories of food to make it easy for users to reserve food . The last page is profile page. It contains some information about users . ",
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 26,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
