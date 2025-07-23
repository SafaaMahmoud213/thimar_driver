class RegisterEvents {}

class RegisterGetEvent extends RegisterEvents {
  final String password,
      phone,
      code,
      email,
      passwordConfirmation,
      identityNumber;
  RegisterGetEvent({
    required this.password,
    required this.phone,
    required this.code,
    required this.email,
    required this.passwordConfirmation,
    required this.identityNumber,
  });
}
