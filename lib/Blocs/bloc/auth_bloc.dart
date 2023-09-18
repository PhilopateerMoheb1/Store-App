// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthEvent>((event, emit) async {
      if (event is LoginEvent) {
        emit(LoginCubitLoading());
        try {
          final credential = await FirebaseAuth.instance
              .signInWithEmailAndPassword(
                  email: event.email, password: event.password);
          emit(LoginCubitSuccess());
        } on FirebaseAuthException catch (e) {
          if (e.code == 'user-not-found') {
            emit(LoginCubitFailure(msg: "No user found for that email."));
          } else if (e.code == 'wrong-password') {
            emit(LoginCubitFailure(
                msg: "Wrong password provided for that user."));
          }
        } catch (e) {
          emit(LoginCubitFailure(msg: "Something went wrong"));
        }
      } else if (event is RegisterEvent) {
        emit(RegisterLoading());
        try {
          final credential =
              await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: event.email,
            password: event.password,
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
        }
      }
    });
  }
}
