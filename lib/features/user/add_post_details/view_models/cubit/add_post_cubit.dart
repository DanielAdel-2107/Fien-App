import 'dart:developer';
import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:fien/app/my_app.dart';
import 'package:fien/core/cache/cache_helper.dart';
import 'package:fien/core/di/dependancy_injection.dart';
import 'package:fien/core/helper/pick_image.dart';
import 'package:fien/core/network/api/api_consumer.dart';
import 'package:fien/core/network/api/end_points.dart';
import 'package:fien/features/auth/sign_in/models/auth_response.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';

part 'add_post_state.dart';

class AddPostCubit extends Cubit<AddPostState> {
  AddPostCubit({required this.apiConsumer}) : super(AddPostInitial());
  final ApiConsumer apiConsumer;
  AuthResponse? authResponse;

  // Controllers
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final locationController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  // DateTime Handling
  DateTime _selectedDate = DateTime.now();
  TimeOfDay _selectedTime = TimeOfDay.now();

  // Getters
  DateTime get selectedDate => _selectedDate;
  TimeOfDay get selectedTime => _selectedTime;
  String get formattedDate => _formatDate(_selectedDate);
  String get formattedTime =>
      _selectedTime.format(navigatorKey.currentContext!);

  // Date Picker
  Future<void> pickDate() async {
    try {
      final date = await showDatePicker(
        context: navigatorKey.currentContext!,
        initialDate: _selectedDate,
        firstDate: DateTime(2000), // ✅ يسمح بالتواريخ السابقة
        lastDate: DateTime.now().add(const Duration(days: 365)),
      );

      if (date != null) {
        _selectedDate = date;
        emit(DateTimeUpdated(_selectedDate, _selectedTime));
      }
    } catch (e) {
      emit(AddPostError('Failed to pick date: ${e.toString()}'));
    }
  }

  // Time Picker
  Future<void> pickTime() async {
    try {
      final time = await showTimePicker(
        context: navigatorKey.currentContext!,
        initialTime: _selectedTime,
      );

      if (time != null) {
        _selectedTime = time;
        emit(DateTimeUpdated(_selectedDate, _selectedTime));
      }
    } catch (e) {
      emit(AddPostError('Failed to pick time: ${e.toString()}'));
    }
  }

  // Helper method to format date
  String _formatDate(DateTime date) {
    return '${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year}';
  }

  // Image Picker
  File? selectedImage;
  pickImageUseGallery() async {
    try {
      emit(PickImageLoading());
      pickImage(source: ImageSource.gallery).then((value) {
        if (value != null) {
          selectedImage = value;
          emit(PickImageSuccess());
        } else {
          emit(PickImageFailed(message: "Image is not selected"));
        }
      });
    } on Exception catch (e) {
      emit(PickImageFailed(message: e.toString()));
    }
  }

  // Add Post
  Future<void> addPost() async {
    if (formKey.currentState!.validate() &&
        selectedImage != null &&
        locationController.text.isNotEmpty) {
      try {
        emit(AddPostLoading());
        var response = await apiConsumer.post(
          EndPoints.login,
          data: {
            ApiKeys.userName: getIt.get<CacheHelper>().getUserModel()?.username,
            ApiKeys.password: getIt.get<CacheHelper>().getUserModel()?.password,
          },
        );
        authResponse = AuthResponse.fromJson(response);
        log(authResponse!.tokens.access);
        await apiConsumer.post(
          EndPoints.addPost,
          token: authResponse!.tokens.access,
          data: {
            "title": titleController.text,
            "item_type_id": 2,
            "status": "lost",
            "location_description": locationController.text,
            "exact_address": "",
            "transportation_type": "",
            "date_time":
                DateTime(
                  _selectedDate.year,
                  _selectedDate.month,
                  _selectedDate.day,
                  _selectedTime.hour,
                  _selectedTime.minute,
                ).toIso8601String(),

            "comments": "",
            "image": selectedImage,
            "is_resolved": false,
          },
          isformdata: true,
        );
        emit(AddPostSuccess());
      } catch (e) {
        log(e.toString());
        emit(AddPostError(e.toString()));
      }
    }
  }

  @override
  Future<void> close() {
    titleController.dispose();
    descriptionController.dispose();
    locationController.dispose();
    return super.close();
  }
}
