part of 'login_cubit.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoadingState extends LoginState {}

class LoginSuccess extends LoginState {}

class LogoutSuccess extends LoginState {}

class LoginFailed extends LoginState {}

class LoginUnknown extends LoginState {}