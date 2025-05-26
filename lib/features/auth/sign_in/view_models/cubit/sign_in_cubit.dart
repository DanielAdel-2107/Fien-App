import 'package:bloc/bloc.dart';
import 'package:fien/core/cache/cache_helper.dart';
import 'package:fien/core/di/dependancy_injection.dart';
import 'package:fien/core/network/api/api_consumer.dart';
import 'package:fien/core/network/api/end_points.dart';
import 'package:fien/features/auth/sign_in/models/auth_response.dart';
import 'package:fien/features/auth/sign_in/models/user_model.dart';
import 'package:flutter/material.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit({required this.apiConsumer}) : super(SignInInitial());
  final ApiConsumer apiConsumer;
  final formKey = GlobalKey<FormState>();
  AuthResponse? authResponse;
  UserModel? userModel;
  //! controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  //! sign in function
  Future<void> signIn() async {
    if (formKey.currentState!.validate()) {
      try {
        emit(SignInLoading());
        var response = await apiConsumer.post(
          EndPoints.login,
          data: {
            ApiKeys.userName: emailController.text,
            ApiKeys.password: passwordController.text,
          },
        );
        authResponse = AuthResponse.fromJson(response);
        userModel = UserModel(
          username: authResponse!.user.username,
          id: authResponse!.user.id.toString(),
          password: passwordController.text,
        );
        await getIt.get<CacheHelper>().saveUserModel(userModel!);
        emit(SignInSuccess());
      } on Exception catch (e) {
        emit(SignInFailure(message: e.toString()));
      }
    }
  }
}
