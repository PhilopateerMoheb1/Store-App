// ignore_for_file: non_constant_identifier_names, file_names, must_be_immutable

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:storeapp/Widgets/CustomWideButton.dart';
import 'package:storeapp/helper/ShowSnackBar.dart';

import '../Constants.dart';
import '../Widgets/CustomTextField.dart';
import '../cubits/RegisterCubit/register_cubit.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});
  static String id = "RegisterPage";

  String? email;

  String? password;

  bool isLoading = false;

  GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state is RegisterLoading) {
          isLoading = true;
        } else if (state is RegisterSuccess) {
          isLoading = false;
          Navigator.pop(context);
        } else if (state is RegisterFailure) {
          isLoading = false;
          if (state.msg == 'email-already-in-use') {
            ShowSnackBarMsg(context, 'email-already-in-use');
          } else if (state.msg == 'Weak-Password') {
            ShowSnackBarMsg(context, 'Weak-Password');
          }
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: isLoading,
          child: Scaffold(
              backgroundColor: kPrimaryColor,
              body: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                child: Form(
                  key: formKey,
                  child: ListView(
                    children: [
                      Center(
                        child: Column(
                          children: [
                            Image.asset(
                              "assets/images/scholar.png",
                              height: 100,
                            ),
                            const Text(
                              "Scholar Chat",
                              style: TextStyle(
                                fontFamily: 'Pacifico',
                                fontSize: 32,
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 100,
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 8.0, vertical: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Register",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 6.0),
                        child: CustomTextFormField(
                          onChanged: (data) {
                            email = data;
                          },
                          hintText: "Email",
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: CustomTextFormField(
                          onChanged: (data) {
                            password = data;
                          },
                          hintText: "Password",
                          ispassword: true,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomWideButton(
                        onTap: () async {
                          if (formKey.currentState!.validate()) {
                            BlocProvider.of<RegisterCubit>(context)
                                .regUser(email!, password!);
                          }
                        },
                        buttonText: "SignUp",
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Already have an account?  ",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            GestureDetector(
                              onTap: () => {Navigator.pop(context)},
                              child: const Text(
                                "Login",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )),
        );
      },
    );
  }

  Future<void> RegisterUser() async {
    final credential =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email!,
      password: password!,
    );
  }
}
