class SignupWitheEmailAndPasswordFailure {
  final String message;
  const SignupWitheEmailAndPasswordFailure(
      [this.message = 'An Unknown error occured']);
  factory SignupWitheEmailAndPasswordFailure.code(String code) {
    switch (code) {
      case 'weak-password':
        return SignupWitheEmailAndPasswordFailure(
            'Please Suggest Strong Password');
      case 'invalid_email':
        return SignupWitheEmailAndPasswordFailure(
            'Email is not valid or badly formatted');
      case 'email-already-in-use':
        return SignupWitheEmailAndPasswordFailure(
            'An account already exits for that email');
      default:
        return SignupWitheEmailAndPasswordFailure();
    }
  }
}
