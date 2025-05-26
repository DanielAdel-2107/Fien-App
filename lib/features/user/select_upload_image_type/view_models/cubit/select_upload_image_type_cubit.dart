import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:fien/core/helper/pick_image.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';

part 'select_upload_image_type_state.dart';

class SelectUploadImageTypeCubit extends Cubit<SelectUploadImageTypeState> {
  SelectUploadImageTypeCubit() : super(SelectUploadImageTypeInitial());
  File? image;
  bool? useGallery;
  void selectType({required bool value}) {
    {
      useGallery = value;
      emit(SelectUploadImageTypeSuccess());
    }
  }

  pickImageForSearch() async {
    if (useGallery != null) {
      await pickImage(
        source: useGallery! ? ImageSource.gallery : ImageSource.camera,
      ).then((value) {
        if (value != null) {
          image = value;
          emit(UploadImageSuccess(image: image!));
        } else {
          emit(UploadImageFailure());
        }
      });
    } else {
      emit(SelectUploadImageType());
    }
  }
}
