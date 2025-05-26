import 'package:fien/core/constants/app_constants.dart';
import 'package:fien/core/utilies/colors/app_colors.dart';
import 'package:fien/core/utilies/sizes/sized_config.dart';
import 'package:fien/core/utilies/styles/app_text_styles.dart';
import 'package:fien/features/user/home/view_models/cubit/get_found_items_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SelectCategory extends StatelessWidget {
  const SelectCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetFoundItemsCubit, GetFoundItemsState>(
      builder: (context, state) {
        return SizedBox(
          height: SizeConfig.height * 0.04,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: AppConstants.itemTypes.length,
            itemBuilder:
                (context, index) => CategoryCard(
                  isSelected:
                      context.read<GetFoundItemsCubit>().selectedIndex == index,
                  categoryName:
                      AppConstants.itemTypes[index],
                ),
          ),
        );
      },
    );
  }
}

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    super.key,
    required this.categoryName,
    required this.isSelected,
  });
  final String categoryName;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          context.read<GetFoundItemsCubit>().selectCategory(categoryName);
        },
        child: Container(
          height: SizeConfig.height * 0.04,
          margin: EdgeInsets.only(right: SizeConfig.width * 0.02),
          padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.width * 0.06,
            vertical: SizeConfig.height * 0.004,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color:
                isSelected
                    ? AppColors.kPrimaryColor
                    : AppColors.kPrimaryColor.withOpacity(0.2),
          ),
          child: Text(
            categoryName,
            style:
                isSelected
                    ? AppTextStyles.title18WhiteW500
                    : AppTextStyles.title18PrimaryColorW500,
          ),
        ),
      ),
    );
  }
}
