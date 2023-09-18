import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'login_cubit_state.dart';

class LoginCubit extends Cubit<LoginCubitState> {
  LoginCubit() : super(LoginCubitInitial());

  Future<void> authUser(String email, String password) async {
    emit(LoginCubitLoading());
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      emit(LoginCubitSuccess());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        emit(LoginCubitFailure(msg: "No user found for that email."));
      } else if (e.code == 'wrong-password') {
        emit(LoginCubitFailure(msg: "Wrong password provided for that user."));
      }
    } catch (e) {
      emit(LoginCubitFailure(msg: "Something went wrong"));
    }
  }
}
