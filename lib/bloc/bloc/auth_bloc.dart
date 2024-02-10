import 'package:bloc/bloc.dart';
import 'package:prac2/repository/authentication/auth_repository.dart';
part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthenticationRepository authRepository;
  AuthBloc({required this.authRepository}) : super(unAuthenticated()) {
    on<SignUpRequested>((event, state) async {
      // ignore: invalid_use_of_visible_for_testing_member
      emit(Loading());
      try {} catch (e) {
        // ignore: invalid_use_of_visible_for_testing_member
        emit(unAuthenticated());
      }
    });
  }
}
