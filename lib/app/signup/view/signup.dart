import 'package:flutter/material.dart';
import 'package:hotel_book/app/login/view/loginpage.dart';
import 'package:hotel_book/app/signup/controller/signup.dart';
import 'package:hotel_book/app/utils/colors.dart';
import 'package:hotel_book/app/utils/constheight.dart';
import 'package:hotel_book/app/widgets/clipper.dart';
import 'package:hotel_book/app/widgets/googlesign.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<SignUpController>(context);
    return Scaffold(
      body: ListView(
        children: [
          Stack(
            children: [
              ClipPath(
                clipper: ClipperWidget(),
                child: Container(
                  decoration: const BoxDecoration(
                      color: mainColor,
                      image: DecorationImage(
                          image: AssetImage('assets/logimg.png'))),
                  //  color: const Color.fromARGB(255, 66, 236, 72),
                  height: MediaQuery.of(context).size.height / 3,
                  width: double.infinity,
                ),
              ),
              // Positioned(
              //   left: MediaQuery.of(context).size.width / 2.8,
              //   top: MediaQuery.of(context).size.width / 1.7,
              //   child: const CircleAvatar(
              //     radius: 50,
              //     backgroundImage: AssetImage('assets/fhlogo.png'),
              //   ),
              // ),
            ],
          ),
          Form(
            key: prov.formKey,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Consumer<SignUpController>(
                  builder: (context, value, child) {
                    return Column(
                      children: [
                        TextFormField(
                          controller: value.userNameController,
                          validator: value.nameValidator,
                          decoration: const InputDecoration(
                            hintText: 'UserName',
                            contentPadding: EdgeInsets.all(10),
                            border: OutlineInputBorder(),
                          ),
                        ),
                        kHeight15,
                        TextFormField(
                          controller: value.emailController,
                          validator: value.emailValidator,
                          decoration: const InputDecoration(
                            hintText: 'E-mail',
                            contentPadding: EdgeInsets.all(10),
                            border: OutlineInputBorder(),
                          ),
                        ),
                        kHeight15,
                        TextFormField(
                          controller: value.passwordController,
                          validator: value.passwordValidator,
                          decoration: const InputDecoration(
                            hintText: 'Password',
                            contentPadding: EdgeInsets.all(10),
                            border: OutlineInputBorder(),
                          ),
                        ),
                        kHeight15,
                        TextFormField(
                          controller: value.confirmController,
                          validator: value.confirmPasswordValidator,
                          decoration: const InputDecoration(
                            hintText: 'Confirm Password',
                            contentPadding: EdgeInsets.all(10),
                            border: OutlineInputBorder(),
                          ),
                        ),
                        kHeight20,
                        SizedBox(
                          width: 220,
                          height: 40,
                          child: Consumer<SignUpController>(
                            builder: (context, val, child) {
                            return  ElevatedButton(
                              onPressed: () {
                             //   value.formKey.currentState!.validate();
                              val.signUp(context);
                              // value.dispose();
                              },
                              style: ElevatedButton.styleFrom(
                                  fixedSize: const Size(150, 30),
                                  primary: mainColor),
                              child:  val.isLoading == true
                                  ? const CircularProgressIndicator(
                                      strokeWidth: 2,
                                      color: subColor,
                                    )
                                  : const Text('Sign Up'),
                            );
                            },
                          ),
                        ),
                        kHeight20,
                        // const GoogleSign(),
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.center,
                        //   children: [
                        //     const Text('ALREADY ON ACCOUNT?'),
                        //     TextButton(
                        //       onPressed: () {
                        //         Navigator.pop(context);
                              
                        //       },
                        //       child: const Text('Sign In'),
                        //     ),
                        //   ],
                        // ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
      //    floatingActionButton: Row(
      //   mainAxisAlignment: MainAxisAlignment.center,
      //   children: [
      //     kwidth10,
      //     const Text('ALREADY ON ACCOUNT?'),
      //     TextButton(
      //       onPressed: () {
      //         Navigator.of(context).pushAndRemoveUntil(
      //           MaterialPageRoute(
      //             builder: (context) => const LogInScreen(),
      //           ),
      //           (route) => false,
      //         );
      //         // value.emailController.clear();
      //         // value.passwordController.clear();
      //       },
      //       child: const Text('Sign In'),
      //     ),
      //   ],
      // ),
      // resizeToAvoidBottomInset: false,
    );
  }
}
