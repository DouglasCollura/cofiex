part of 'auth_bloc.dart';

class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object?> get props => [];
}

class SetAuthStatus extends AuthEvent {
  final AuthStatus status;

  const SetAuthStatus(this.status);
}

class AuthLogin extends AuthEvent {
  
}