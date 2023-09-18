part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class LoginCubitInitial extends AuthState {}

final class LoginCubitSuccess extends AuthState {}

final class LoginCubitFailure extends AuthState {
  String? msg;
  LoginCubitFailure({required String msg});
}

final class LoginCubitLoading extends AuthState {}

final class RegisterInitial extends AuthState {}

final class RegisterSuccess extends AuthState {}

final class RegisterLoading extends AuthState {}

final class RegisterFailure extends AuthState {
  String msg;
  RegisterFailure({required this.msg});
}
