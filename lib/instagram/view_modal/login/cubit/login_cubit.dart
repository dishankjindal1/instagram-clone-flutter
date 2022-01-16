import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  void loginStarted() {
    emit(LoadingState());
  }

  void loginSuccess() {
    emit(LoginSuccess());
  }

  void loginFailed() async {
    emit(LoginFailed());
    await Future.delayed(const Duration(seconds: 2));
    emit(LoginInitial());
  }
}
