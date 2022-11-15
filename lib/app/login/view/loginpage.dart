import 'package:flutter/material.dart';
import 'package:hotel_book/app/login/controller/login.dart';
import 'package:hotel_book/app/mobile_otp/view/mobile.dart';
import 'package:hotel_book/app/utils/constheight.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class LogInScreen extends StatelessWidget {
  const LogInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            children: const [
              // ClipPath(
              //   clipper: ClipperWidget(),
              //   child: Container(
              //     decoration: const BoxDecoration(
              //         color: Color.fromRGBO(47, 173, 103, 1),
              //         image: DecorationImage(
              //             image: AssetImage('assets/logimg.png'))),
              //     //  color: const Color.fromARGB(255, 66, 236, 72),
              //     height: MediaQuery.of(context).size.height / 2.5,
              //     width: double.infinity,
              //   ),
              // ),
              // Positioned(
              //   left: MediaQuery.of(context).size.width / 2.5,
              //   top: MediaQuery.of(context).size.width / 2.5,
              //   child: const CircleAvatar(
              //     radius: 50,
              //     backgroundImage: AssetImage('assets/fhlogo.png'),
              //   ),
              // ),
            ],
          ),
          kHeight15,
          Center(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Consumer<SignInController>(
                builder: (context, value, child) {
                  return Form(
                    key: value.formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        kHeight30,
                        TextFormField(
                          controller: value.emailOrPhneController,
                          validator: value.emailValidator,
                          decoration: const InputDecoration(
                            hintText: 'E-mail',
                            counterText: '',
                            contentPadding: EdgeInsets.all(10),
                            border: OutlineInputBorder(),
                          ),
                        ),
                        kHeight15,
                        TextFormField(
                          controller: value.passwordController,
                          obscureText: true,
                          validator: value.passwordValidator,
                          decoration: const InputDecoration(
                            hintText: 'Password',
                            counterText: '',
                            contentPadding: EdgeInsets.all(10),
                            border: OutlineInputBorder(),
                          ),
                          maxLength: 12,
                        ),
                        kHeight20,
                        SizedBox(
                          width: 220,
                          height: 40,
                          child: Consumer<SignInController>(
                            builder: (context, val, child) => val.isLoading ==
                                    true
                                ? SizedBox(
                                    height: 150,
                                    child: Lottie.asset(
                                      'assets/loading_lottie.json',
                                    ),
                                  )
                                : ElevatedButton(
                                    onPressed: () {
                                      val.logIn(context);
                                      // value.formKey.currentState!.validate();
                                    },
                                    style: ElevatedButton.styleFrom(
                                      fixedSize: const Size(150, 30),
                                      backgroundColor:
                                          const Color.fromRGBO(47, 173, 103, 1),
                                    ),
                                    child: const Text('Sign In'),
                                  ),
                          ),
                        ),
                        kHeight30,
                        // const GoogleSign(),
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.center,
                        //   children: [
                        //     const Text('DONT HAVE AN ACCOUNT?'),
                        //     TextButton(
                        //       onPressed: () {
                        //         Navigator.of(context).push(
                        //           MaterialPageRoute(
                        //             builder: (context) =>
                        //                 const MobileNoScreen(),
                        //           ),
                        //         );
                        //         value.emailController.clear();
                        //         value.passwordController.clear();
                        //       },
                        //       child: const Text('Sign Up'),
                        //     ),
                        //   ],
                        // ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
      bottomSheet: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          kwidth10,
          const Text('DONT HAVE AN ACCOUNT?'),
          TextButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const MobileNoScreen(),
                ),
              );
              // value.emailController.clear();
              // value.passwordController.clear();
            },
            child: const Text('Sign Up'),
          ),
        ],
      ),
      resizeToAvoidBottomInset: false,
      //  floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
