import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project/Home/outlineScreen.dart';
import 'package:project/auth/loginScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  void saveAuthenticationState(bool isAuthenticated) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isAuthenticated', isAuthenticated);
  }

  bool visible = true;
  TextEditingController emailAddress = TextEditingController();
  TextEditingController passwordText = TextEditingController();
  var formKey = GlobalKey<FormState>();

  bool visibleConfirmation = true;
  TextEditingController confirmPasswordText = TextEditingController();

  bool _isValidEmail(String email) {
    final pattern = r'^[\w-]+(\.[\w-]+)*@([a-zA-Z0-9-]+\.)+[a-zA-Z]{2,7}$';
    final regex = RegExp(pattern);
    return regex.hasMatch(email);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 11, 201, 157),
        title: const Text("Register page"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Form(
          key: formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: emailAddress,
                keyboardType: TextInputType.emailAddress,
                onFieldSubmitted: (value) {},
                onChanged: (value) {},
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter an email address';
                  } else if (!_isValidEmail(value)) {
                    return 'Please enter a valid email address';
                  }
                  return null;
                },
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
                  labelText: "Password",
                  prefixIcon: Icon(Icons.lock),
                  suffixIcon: IconButton(
                    icon: visible ? const Icon(Icons.visibility_off) : const Icon(Icons.visibility),
                    onPressed: () {
                      setState(() {
                        visible = !visible;
                      });
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              TextFormField(
                keyboardType: TextInputType.visiblePassword,
                obscureText: visibleConfirmation,
                controller: confirmPasswordText,
                onFieldSubmitted: (value) {},
                onChanged: (value) {},
                validator: (value) {
                  if (value != passwordText.text) {
                    return 'Passwords do not match';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40),
                  ),
                  labelText: "Confirm Password",
                  prefixIcon: Icon(Icons.lock),
                  suffixIcon: IconButton(
                    icon: visibleConfirmation ? const Icon(Icons.visibility_off) : const Icon(Icons.visibility),
                    onPressed: () {
                      setState(() {
                        visibleConfirmation = !visibleConfirmation;
                      });
                    },
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Container(
                child: MaterialButton(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(40.0))),
                  elevation: 5.0,
                  minWidth: double.infinity,
                  height: 55,
                  color: Color.fromARGB(255, 11, 201, 157),
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                      print(emailAddress.text);
                      await FirebaseAuth.instance.createUserWithEmailAndPassword(
                        email: emailAddress.text,
                        password: passwordText.text,
                      ).then((value) {
                        print(value.user!.email);
                        print(value.user!.uid);
                      });
                      saveAuthenticationState(true);
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => OutlineScreen()),
                  );
                    }
                  },
                  child: const Text(
                    "Register",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Have an account?"),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => loginScreen(),
                        ),
                      );
                    },
                    child: const Text("Log In"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
