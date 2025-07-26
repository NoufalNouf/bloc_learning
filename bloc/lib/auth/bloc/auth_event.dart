abstract class AuthEvent{}

class LoginEvent extends AuthEvent{
  final String username;
  LoginEvent(this.username);
}

class LogoutEvent extends AuthEvent{}

