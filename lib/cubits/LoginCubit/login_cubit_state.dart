part of 'login_cubit.dart';

@immutable
sealed class LoginCubitState {}

final class LoginCubitInitial extends LoginCubitState {}

final class LoginCubitSuccess extends LoginCubitState {}

final class LoginCubitFailure extends LoginCubitState {
  String? msg;
  LoginCubitFailure({required String msg});
}

final class LoginCubitLoading extends LoginCubitState {}
