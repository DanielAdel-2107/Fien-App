import 'package:fien/core/app_route/route_names.dart';
import 'package:fien/core/components/custom_elevated_button.dart';
import 'package:fien/core/components/custom_text_button.dart';
import 'package:fien/core/di/dependancy_injection.dart';
import 'package:fien/core/utilies/assets/images/app_images.dart';
import 'package:fien/core/utilies/colors/app_colors.dart';
import 'package:fien/core/utilies/extensions/app_extensions.dart';
import 'package:fien/core/utilies/sizes/sized_config.dart';
import 'package:fien/core/utilies/styles/app_text_styles.dart';
import 'package:fien/features/user/filter/views/widgets/filter_by_date_and_time.dart';
import 'package:fien/features/user/filter/views/widgets/filter_by_selected_category.dart';
import 'package:fien/features/user/filter/views/widgets/section_title.dart';
import 'package:fien/features/user/home/views/widgets/location_botton_sheet.dart';
import 'package:fien/features/user/search/view_models/cubit/search_cubit.dart';
import 'package:fien/features/user/select_upload_image_type/views/widgets/custom_divider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FilterScreenBody extends StatelessWidget {
  const FilterScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          bottom: 0,
          right: 0,
          child: Image.asset(
            AppImages.curveImage,
            fit: BoxFit.cover,
            height: SizeConfig.height * 0.15,
          ),
        ),
        SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.width * 0.03,
              vertical: SizeConfig.height * 0.01,
            ),
            child: BlocProvider.value(
              value: getIt.get<SearchCubit>(),
              child: BlocBuilder<SearchCubit, SearchState>(
                builder: (context, state) {
                  final cubit = context.read<SearchCubit>();
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      buildHeader(context),
                      SectionTitle(
                        "Apply Filter",
                        AppTextStyles.title24BlackBold,
                      ),
                      const CustomDivider(),
                      SectionTitle(
                        "Item Status",
                        AppTextStyles.title20PrimaryColorW500,
                      ),
                      const FilterBySelectCategory(),
                      const CustomDivider(),

                      buildListTile(
                        context,
                        title: "Item Category",
                        subtitle: cubit.selectedCategory ?? "Any",
                        onTap:
                            () =>
                                context.pushScreen(RouteNames.categoriesScreen),
                      ),
                      const CustomDivider(),

                      buildListTile(
                        context,
                        title: "Location",
                        subtitle: cubit.selectedLocation ?? "Not Selected",
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(20),
                              ),
                            ),
                            builder: (_) => const LocationBottomSheet(),
                          );
                        },
                      ),
                      const CustomDivider(),

                      SectionTitle(
                        "When was it Lost/Found?",
                        AppTextStyles.title24PrimaryColorW500,
                      ),
                      SizedBox(height: SizeConfig.height * 0.01),
                      FilterByDateAndTime(cubit: cubit),
                      const CustomDivider(),

                      SizedBox(height: SizeConfig.height * 0.02),
                      CustomElevatedButton(
                        name: "See Results",
                        onPressed: () {
                          cubit.filterItems();
                          context.popScreen();
                        },
                        backgroundColor: AppColors.kPrimaryColor,
                        textStyle: AppTextStyles.title20WhiteBold,
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildHeader(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomTextButton(
          title: "Cancel",
          onPressed: () => context.popScreen(),
          style: AppTextStyles.title18PrimaryColorW500.copyWith(
            color: Colors.red,
          ),
        ),
        CustomTextButton(
          title: "Clear All",
          onPressed: () {
            context.read<SearchCubit>().clearFilters();
            context.popScreen();
          },
          style: AppTextStyles.title18PrimaryColorW500,
        ),
      ],
    );
  }

  Widget buildListTile(
    BuildContext context, {
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return ListTile(
      onTap: onTap,
      title: Text(title, style: AppTextStyles.title20PrimaryColorW500),
      subtitle: Text(subtitle),
      trailing: const Icon(Icons.arrow_forward_ios),
    );
  }
}
