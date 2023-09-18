// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:meta/meta.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());
  Future<void> regUser(String email, String password) async {
    emit(RegisterLoading());
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      emit(RegisterSuccess());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(RegisterFailure(
          msg: "Weak-Password",
        ));
      } else if (e.code == 'email-already-in-use') {
        emit(RegisterFailure(msg: "email-already-in-use"));
      }
    } on Exception catch (e) {
      emit(RegisterFailure(msg: "Error"));
      // TODO
    }
  }
}
