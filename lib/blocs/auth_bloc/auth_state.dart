part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();
}

class Loading extends AuthState {
  @override
  List<Object?> get props => [];
}

class Authenticated extends AuthState {
  @override
  List<Object?> get props =>[];
}

class UnAuthenticated extends AuthState {
  @override
  List<Object?> get props =>[];
}

class AuthError extends AuthState {
  final String error;
  const AuthError(this.error);

  @override
  List<Object?> get props =>[error];
}
