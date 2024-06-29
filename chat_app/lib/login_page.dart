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
      //TODO: 04_12_b Navigate to ChatPage on successful login
      // we will use here Navigator imperative API for Pop and Push
      // right now it is just to check, what happens if we push
      // empty widget without the material app hello world text
      // after tetsing hello world we will navigate to the real chat_page Route
      // Here the problem is, there is Back button by default, so on chat page,
      // if I press back button then I navigate to loginpage, we need solution!

      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const ChatPage()));

      if (kDebugMode) {
        print('login successful!');
      }
    } else {
      if (kDebugMode) {
        print('not successful!');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                textAlign: TextAlign.center,
                'Let\'s sign you in!',
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.brown,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.2),
              ),

              const Text(
                'Welcome back! \n You\'ve been missed!',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 10,
                    color: Colors.blueGrey),
              ),
              Image.network(
                'https://3009709.youcanlearnit.net/Alien_LIL_131338.png',
                height: 100,
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
                          hintStyle:
                              TextStyle(color: Colors.blueGrey, fontSize: 15),
                          border: OutlineInputBorder()),
                    ),
                    const SizedBox(
                      height: 0.5,
                    ),
                    TextFormField(
                      controller: passwordController,
                      onChanged: (value) {
                        if (kDebugMode) {
                          print('value: $value');
                        }
                      },
                      obscureText: true,
                      decoration: const InputDecoration(
                          hintText: 'Type your password',
                          hintStyle:
                              TextStyle(color: Colors.blueGrey, fontSize: 15),
                          border: OutlineInputBorder()),
                    ),
                  ],
                ),
              ),

              // empty box between Login button and Password field
              const SizedBox(
                height: 0.5,
              ),

              //TODO: Add Login Button
              ElevatedButton(
                  onPressed: () {
                    printLogin(context);
                  },
                  child: const Text(
                    "Login",
                    style: TextStyle(fontSize: 20),
                  )),

              //TODO: Add URL Text Button
              GestureDetector(
                onLongPress: () {
                  if (kDebugMode) {
                    print('Long press');
                  }
                },
                onDoubleTap: () {
                  if (kDebugMode) {
                    print('DoubleTap');
                  }
                },
                onTap: () {
                  //todo: Navigate to browser
                  if (kDebugMode) {
                    print('Link clicked!');
                  }
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
