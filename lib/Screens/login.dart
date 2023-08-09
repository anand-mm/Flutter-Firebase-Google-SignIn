import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/LoginController.dart';

class Login extends StatelessWidget {
  final LoginController controller = Get.put(LoginController());

  Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              // color: Colors.blue,
              onPressed: () {
                controller.loginWithGoogle();
                print("Inside the ElevatedButton");
              },
              child: const Center(
                  child: Text(
                "Login with google",
                style: TextStyle(color: Colors.white),
              )),
            ),
            // TextButton(
            //     onPressed: () {
            //       controller.loginWithGoogle();
            //     },
            //     child: const Text("Google Sign-In"))
          ],
        ),
      ),
    );
  }
}





























// class Login extends StatelessWidget {
//   final passwordController = TextEditingController();

//   double _sigmaX = 5; // from 0-10
//   double _sigmaY = 5; // from 0-10
//   double _opacity = 0.2;
//   double _width = 350;
//   double _height = 300;
//   final _formKey = GlobalKey<FormState>();

//   void signUserIn() {
//     if (_formKey.currentState!.validate()) {
//       print('valid');
//     } else {
//       print('not valid');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         backgroundColor: Colors.grey[300],
//         body: SingleChildScrollView(
//           child: Container(
//             height: MediaQuery.of(context).size.height,
//             child: const Stack(
//               alignment: Alignment.center,
//             ),
//           ),
//         ));
//   }
// }





