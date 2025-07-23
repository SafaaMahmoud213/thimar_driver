class LoginEvents {}

class LoginLGetEvent extends LoginEvents {
  final String password, phone, code;
  LoginLGetEvent({
    required this.password,
    required this.phone,
    required this.code,
  });
}
