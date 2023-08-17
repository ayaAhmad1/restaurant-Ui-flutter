import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project/Home/outlineScreen.dart';
import 'package:project/auth/registerScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class loginScreen extends StatefulWidget {
  const loginScreen({super.key});

  @override
  State<loginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<loginScreen> {
  void saveAuthenticationState(bool isAuthenticated) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isAuthenticated', isAuthenticated);
  }

  bool visible = true;
  TextEditingController emailAddress = TextEditingController();
  TextEditingController passwordText = TextEditingController();
  var fromKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 11, 201, 157),
        title: const Text("Login page"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: ListView(
          children: [
            TextFormField(
              controller: emailAddress,
              keyboardType: TextInputType.emailAddress,
              onFieldSubmitted: (value) {},
              onChanged: (value) {},
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(40),
                ),
                labelText: "Email",
                prefix: Icon(
                  Icons.mail,
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            TextFormField(
              keyboardType: TextInputType.visiblePassword,
              obscureText: visible,
              controller: passwordText,
              onFieldSubmitted: (value) {},
              onChanged: (value) {},
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(40),
                ),
                labelText: "password",
                prefixIcon: const Icon(
                  Icons.lock,
                ),
                suffixIcon: IconButton(
                    icon: visible == true
                        ? const Icon(Icons.visibility_off)
                        : const Icon(Icons.visibility),
                    onPressed: () {
                      visible = !visible;
                      print(visible);
                      setState(() {});
                    }),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Container(
              child: MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(40.0))),
                elevation: 5.0,
                minWidth: double.infinity,
                height: 55,
                color: Color.fromARGB(255, 11, 201, 157),
                onPressed: () async {
                  print(emailAddress.text);

                  await FirebaseAuth.instance
                      .signInWithEmailAndPassword(
                          email: emailAddress.text, password: passwordText.text)
                      .then((value) {
                    print(value.user!.email);
                    print(value.user!.uid);
                    print("success login");
                  });
                  saveAuthenticationState(true);
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => OutlineScreen()),
                  );
                },
                child: const Text(
                  "LOGIN",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Don't have an account?"),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => RegisterScreen()),
                    );
                  },
                  child: const Text("Create Account"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
