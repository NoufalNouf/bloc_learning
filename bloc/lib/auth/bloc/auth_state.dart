
abstract class AuthState{}

class AuthInitial extends AuthState{}

class AuthSuccess extends AuthState{
  final String username;
  AuthSuccess({required this.username});
}