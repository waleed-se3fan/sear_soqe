part of 'auth_cubit.dart';

sealed class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

final class AuthInitial extends AuthState {}

final class CreateUserWithEmailAndPasswordLoading extends AuthState {}

final class CreateUserWithEmailAndPasswordSuccess extends AuthState {
  final String message;

  const CreateUserWithEmailAndPasswordSuccess(this.message);
}

final class CreateUserWithEmailAndPasswordError extends AuthState {
  final String message;

  const CreateUserWithEmailAndPasswordError(this.message);
}

final class SignInWithEmailAndPasswordLoading extends AuthState {}

final class SignInWithEmailAndPasswordSuccess extends AuthState {
  final String message;

  const SignInWithEmailAndPasswordSuccess(this.message);
}

final class SignInWithEmailAndPasswordError extends AuthState {
  final String message;

  const SignInWithEmailAndPasswordError(this.message);
}

final class SignInAnonymouslyLoading extends AuthState {}

final class SignInAnonymouslySuccess extends AuthState {
  final String message;

  const SignInAnonymouslySuccess(this.message);
}

final class SignInAnonymouslyError extends AuthState {
  final String message;

  const SignInAnonymouslyError(this.message);
}
