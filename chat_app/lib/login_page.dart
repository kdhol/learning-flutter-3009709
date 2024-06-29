import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_learn/chat_page.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final _formkey = GlobalKey<FormState>(); // global key of form state,
  // will be used to uniquely identify our form elements as it is global,
  // it will be unique across entire app

  final userNamController = TextEditingController();
  final passwordController = TextEditingController();

  void printLogin(context) {
    // if currentState is not null then validate currentState
    // ! symbol is necessary, otherwise it assumes that currentState is null
    if (_formkey.currentState != null && _formkey.currentState!.validate()) {
      Navigator.pushNamed(context, 'chat', arguments: userNamController.text);

      if (kDebugMode) {
        print(userNamController.text);
        print('Logged in!');
      }
    } else {
      print('Login Error!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                textAlign: TextAlign.center,
                'Let\'s sign you in!',
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.brown,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.5),
              ),

              const Text(
                'Welcome back! \n You\'ve been missed!',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.blueGrey),
              ),
              Image.network(
                'https://3009709.youcanlearnit.net/Alien_LIL_131338.png',
                height: 200,
              ),

              Form(
                key: _formkey,
                child: Column(
                  children: [
                    TextFormField(
                      validator: (value) {
                        if (value != null &&
                            value.isNotEmpty &&
                            value.length < 5) {
                          return "Username should be at least 5 char long.";
                        } else if (value != null && value.isEmpty) {
                          return "Please enter username";
                        }
                        return null;
                      },
                      controller: userNamController,
                      onChanged: (value) {
                        if (kDebugMode) {
                          print('value: $value');
                        }
                      },
                      decoration: const InputDecoration(
                          hintText: 'Username',
                          hintStyle: TextStyle(color: Colors.blueGrey),
                          border: OutlineInputBorder()),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: passwordController,
                      onChanged: (value) {
                        if (kDebugMode) {
                          print('value: $value');
                        }
                      },
                      obscureText: true,
                      decoration: InputDecoration(
                          hintText: 'password',
                          hintStyle: TextStyle(color: Colors.blueGrey),
                          border: OutlineInputBorder()),
                    ),
                  ],
                ),
              ),
              //TODO: Add Login Button
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  onPressed: () {
                    printLogin(context);
                  },
                  child: const Text(
                    "Login",
                    style: TextStyle(fontSize: 30),
                  )),

              //TODO: Add URL Text Button
              GestureDetector(
                onLongPress: () {
                  if (kDebugMode) {
                    print('Longpress');
                  }
                },
                onDoubleTap: () {
                  if (kDebugMode) {
                    print('DoubleTap');
                  }
                },
                onTap: () {
                  if (kDebugMode) {
                    print('Link clicked.');
                  }
                },
                child: const Column(
                  children: [
                    Text('Find us on here.'),
                    Text('HTTPS://https://docs.flutter.dev/'),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
