import 'package:fien/core/utilies/assets/images/app_images.dart';
import 'package:fien/features/on_boarding/views/widgets/custom_on_boarding_step.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnBoardingCubit extends Cubit<int> {
  OnBoardingCubit() : super(0);
  final PageController pageController = PageController(initialPage: 0);
  List<Widget> steps = [
    CustomOnBoardingStep(
      image: AppImages.recover,
      title: "Recover Lost Items",
      description:
          "FIEN helps you search and locate your lost items quickly and easily!",
    ),
    CustomOnBoardingStep(
      image: AppImages.returnFoundBelongings,
      title: "Return Found Belongings",
      description:
          "FIEN connects you with the owner for a smooth and easy return.",
    ),
    CustomOnBoardingStep(
      image: AppImages.easyCommunication,
      title: "Easy Communication",
      description:
          "FIChat directly with users to quickly coordinate item returns.",
    ),
    CustomOnBoardingStep(
      image: AppImages.aIIntegration,
      title: "AI Integration",
      description: "FIEN uses AI to enhance your search experience.",
    ),
  ];

  nextPage() {
    if (state < steps.length - 1) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
      emit(state + 1);
    }
  }

  perviousPage() {
    if (state > 0) {
      pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
      emit(state - 1);
    }
  }
  changePage(int index) {
    pageController.jumpToPage(index);
    emit(index);
  }
}
