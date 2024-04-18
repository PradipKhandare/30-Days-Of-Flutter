import 'package:flutter/material.dart';
import 'package:thirty_days_of_flutter/Utils/routes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);
    _controller.forward();
  }

  final _formKey = GlobalKey<FormState>();

  moveToHome(BuildContext context) async {
    final currentState = _formKey.currentState;
    if (currentState?.validate() ?? true) {
      await Navigator.pushNamed(context, MyRoutes.homeRoute);
    }
  }

  @override
  Widget build(BuildContext context) {
    String name = "";
    return Material(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Form(
          child: Column(
            children: [
              const SizedBox(height: 50),
              FadeTransition(
                opacity: _animation,
                child: Image.asset(
                  "assets/images/loginimage.png",
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 20),
              FadeTransition(
                opacity: _animation,
                child: const Text(
                  "Welcome to Pradip's Tech",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 16.0, horizontal: 32.0),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                          hintText: "Enter Your Username",
                          labelText: "Username"),
                      validator: (value) {
                        if (value?.isEmpty ?? false) {
                          return 'Please username can not be empty';
                        }
                        return null;
                      },

                      onChanged: (value) {
                        name = value;
                      },
                      autovalidateMode: AutovalidateMode
                          .onUserInteraction, // Enables auto-validation
                    ),
                    TextFormField(
                      obscureText: true,
                      decoration: const InputDecoration(
                          hintText: "Enter Your Password",
                          labelText: "Password"),
                      validator: (value) {
                        if ((value?.isEmpty ?? false) == true) {
                          return 'Please password can not be empty';
                        } else if ((value?.length ?? 0) < 6) {
                          return 'password minimum length should be 6';
                        }
                        return null;
                      },

                      autovalidateMode: AutovalidateMode
                          .onUserInteraction, // Enables auto-validation
                    ),
                    const SizedBox(height: 20),
                    ScaleTransition(
                      scale: _animation,
                      child: ElevatedButton(
                        onPressed: () {
                          moveToHome(context);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 228, 106, 45),
                          minimumSize: const Size(200, 40),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                8), // Change the radius here
                          ),
                          shadowColor: Colors.blue,
                        ),
                        child: const Text(
                          'Login',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
