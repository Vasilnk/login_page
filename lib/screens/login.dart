import 'package:flutter/material.dart';
import 'package:login_page/screens/homepage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  final userNameController = TextEditingController();
  final passwordController = TextEditingController();
  final username = "vasil";
  final password = "12345";
  final formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Login Page',
        ),
      ),
      body: Center(
          child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Form(
                  key: formkey,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text('Login',
                                style: TextStyle(
                                    color: Colors.green,
                                    fontSize: 40,
                                    fontWeight: FontWeight.w300,
                                    fontFamily: 'LilitaOne'))),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            controller: userNameController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              hintText: 'Enter user name',
                              hintStyle:
                                  const TextStyle(fontFamily: 'Rajdhani'),
                              prefixIcon: Icon(Icons.person),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'user name is empty';
                              } else {
                                return null;
                              }
                            },
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            controller: passwordController,
                            obscureText: true,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              hintText: 'Enter password',
                              hintStyle: TextStyle(fontFamily: 'Rajdhani'),
                              prefixIcon: Icon(Icons.lock_outline),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'password is empty';
                              } else {
                                return null;
                              }
                            },
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                          ),
                        ),
                        Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                                width: 300,
                                height: 50,
                                child: ElevatedButton(
                                  onPressed: () {
                                    if (formkey.currentState!.validate()) {
                                      validation(context);
                                    }
                                  },
                                  child: const Text('Sign in'),
                                  style: ButtonStyle(
                                    foregroundColor:
                                        MaterialStateProperty.all(Colors.white),
                                    backgroundColor:
                                        MaterialStateProperty.all(Colors.green),
                                  ),
                                ))),
                      ])))),
    );
  }

  void validation(BuildContext ctx) async {
    if (username == userNameController.text &&
        password == passwordController.text) {
      final sharedPref = await SharedPreferences.getInstance();
      await sharedPref.setString('key', username);
      Navigator.of(ctx).pushReplacement(
        MaterialPageRoute(builder: (ctx) => HomePage()),
      );
    } else {
      ScaffoldMessenger.of(ctx).showSnackBar(
        const SnackBar(
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.red,
          margin: EdgeInsets.all(20),
          content: Text('Username or password does not match'),
        ),
      );
    }
  }
}
