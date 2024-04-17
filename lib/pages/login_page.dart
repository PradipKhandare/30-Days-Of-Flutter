import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.white,
        child: Column(
          children: [
            Image.asset(
              "assets/images/loginimage.png",
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 20),
            const Text(
              "Welcome in Pradip's Tech",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
              child: Column(
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                        hintText: "Enter Your Username", labelText: "Username"),
                  ),
                  TextFormField(
                    obscureText: true,
                    decoration: const InputDecoration(
                        hintText: "Enter Your Password", labelText: "Password"),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(),
                      child: const Text('Login'))
                ],
              ),
            )
          ],
        ));
  }
}
