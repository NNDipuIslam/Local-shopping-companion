import 'package:bloc/bloc.dart';
part 'sign_in_state.dart';
part 'sign_in_event.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(const SignInState()) {
    on<EmailEvent>((_emailEvent));
    on<PasswordEvent>((_passwordEvent));
  }

  void _emailEvent(EmailEvent event, Emitter<SignInState> emit) {
    emit(state.copywith(email: event.email));
    print("my email is ${event.email}");
  }

  void _passwordEvent(PasswordEvent event, Emitter<SignInState> emit) {
    emit(state.copywith(password: event.password));
    print("my password is ${event.password}");
  }
}
