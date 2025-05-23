part of 'auth_bloc.dart';


enum AuthStatus { checking, authenticated, notAuthenticated }

class AuthState extends Equatable {
  final AuthStatus status;
  final String? token;

  const AuthState({
    this.status = AuthStatus.notAuthenticated,
    this.token = '',
  });

  copyWith({
    AuthStatus? status,
    String? token,
  }) {
    return AuthState(
      status: status ?? this.status, 
      token: token ?? this.token,
    );
  }

  @override
  List<Object?> get props => [status, token];
}

