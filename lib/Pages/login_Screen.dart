// ignore_for_file: use_build_context_synchronously, file_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:storeapp/Constants.dart';
import 'package:storeapp/cubits/LoginCubit/login_cubit.dart';

import '../Widgets/CustomTextField.dart';
import '../Widgets/CustomWideButton.dart';
import '../cubits/getallproducts/get_all_products_cubit.dart';
import '../helper/ShowSnackBar.dart';
import 'Register_Screen.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  static String id = 'LoginPage';

  bool isLoading = false;
  String? email;
  String? password;

  GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginCubitState>(
      listener: (context, state) {
        if (state is LoginCubitLoading) {
          isLoading = true;
        } else if (state is LoginCubitSuccess) {
          BlocProvider.of<GetAllProductsCubit>(context).getAllProductsMethod();
          isLoading = false;
        } else if (state is LoginCubitFailure) {
          isLoading = false;
          if (state.msg == 'Wrong password provided for that user.') {
            ShowSnackBarMsg(context, 'Wrong password provided for that user.');
          } else if (state.msg == 'user-not-found') {
            ShowSnackBarMsg(context, 'user-not-found');
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
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Scholar Chat",
                                style: TextStyle(
                                  fontFamily: 'Pacifico',
                                  fontSize: 32,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 100,
                    ),
                    const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Sign in",
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
                        ispassword: true,
                        hintText: "Password",
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomWideButton(
                      onTap: () async {
                        if (formKey.currentState!.validate()) {
                          BlocProvider.of<LoginCubit>(context)
                              .authUser(email!, password!);
                        }
                      },
                      buttonText: "Login ",
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Don't have an account?  ",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          GestureDetector(
                            onTap: () => {
                              Navigator.pushNamed(context, RegisterScreen.id)
                            },
                            child: const Text(
                              "Register",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Spacer(
                      flex: 1,
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
