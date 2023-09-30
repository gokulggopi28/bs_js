part of 'auth_cubit.dart';

@immutable
abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

final class AuthInitial extends AuthState {
  @override
  List<Object> get props => [];
}
final class AuthLoading extends AuthState{
  @override
  List<Object> get props => [];

}
final class AuthSuccess extends AuthState {
  final String email;
  AuthSuccess(this.email);
   List<Object> get props => [email];
}
final class AuthError extends AuthState{
  final String error;
  @override
  AuthError(this.error);
  List<Object> get props => [error];

}