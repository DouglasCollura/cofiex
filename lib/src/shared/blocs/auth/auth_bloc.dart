import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(const AuthState()) {
    on<AuthEvent>((event, emit) {
      // Manejo de eventos de autenticación
    });

    on<SetAuthStatus>((event, emit) {
      emit(state.copyWith(status: event.status));
    });
  }
}
