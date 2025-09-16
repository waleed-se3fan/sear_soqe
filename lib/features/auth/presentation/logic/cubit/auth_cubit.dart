import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sear_soqe/core/data/firebase/firebase_auth_service.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  final formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  createUserWithEmailAndPassword(String email, String password) async {
    emit(CreateUserWithEmailAndPasswordLoading());
    try {
      final message = await FirebaseAuthService().signUpWithEmail(
        email,
        password,
      );
      emit(CreateUserWithEmailAndPasswordSuccess(message!.toString()));
    } on Exception catch (e) {
      emit(CreateUserWithEmailAndPasswordError(e.toString()));
    }
  }

  signInWithEmailAndPassword(String email, String password) async {
    emit(SignInWithEmailAndPasswordLoading());
    try {
      final message = await FirebaseAuthService().signInWithEmail(
        email,
        password,
      );
      emit(SignInWithEmailAndPasswordSuccess(message!.toString()));
    } on Exception catch (e) {
      emit(SignInWithEmailAndPasswordError(e.toString()));
    }
  }

  signInAnonymously() async {
    emit(SignInAnonymouslyLoading());
    try {
      final message = await FirebaseAuthService().signInAnonymously();
      emit(SignInAnonymouslySuccess('تم تسجيل الدخول كزائر'));
    } on Exception catch (e) {
      emit(SignInAnonymouslyError(e.toString()));
    }
  }
}
