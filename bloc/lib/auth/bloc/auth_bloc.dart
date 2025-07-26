import 'package:flutter_bloc/flutter_bloc.dart';

import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState>{
  AuthBloc() : super (AuthInitial()){
    on <LoginEvent>((event,emit){
      emit (AuthSuccess(username: event.username));
    });
    on<LogoutEvent>((event,emit){
      emit(AuthInitial());
    });
  }
}