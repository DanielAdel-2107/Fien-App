import 'package:fien/core/di/dependancy_injection.dart';
import 'package:fien/core/utilies/sizes/sized_config.dart';
import 'package:fien/core/utilies/styles/app_text_styles.dart';
import 'package:fien/features/user/home/view_models/cubit/get_found_items_cubit.dart';
import 'package:fien/features/user/home/views/widgets/home_screen_app_bar.dart';
import 'package:fien/features/user/home/views/widgets/lost_found_item_grid_view_builder.dart';
import 'package:fien/features/user/home/views/widgets/search_field.dart';
import 'package:fien/features/user/home/views/widgets/select_category.dart';
import 'package:fien/features/user/home/views/widgets/select_location.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.width * 0.025,
          vertical: SizeConfig.height * 0.02,
        ),
        child: BlocProvider.value(
          value: getIt.get<GetFoundItemsCubit>()..getFoundItems(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HomeScreenAppBar(),
              SizedBox(height: SizeConfig.height * 0.015),
              SelectLocation(),
              SizedBox(height: SizeConfig.height * 0.015),
              SearchField(),
              SizedBox(height: SizeConfig.height * 0.02),
              Text(
                "Latest ads in your location",
                style: AppTextStyles.title20BlackBold,
              ),
              SizedBox(height: SizeConfig.height * 0.01),
              SelectCategory(),
              SizedBox(height: SizeConfig.height * 0.01),
              Expanded(
                child: BlocBuilder<GetFoundItemsCubit, GetFoundItemsState>(
                  builder: (context, state) {
                    return LostFoundItemGridViewBuilder(
                      items: getIt.get<GetFoundItemsCubit>().foundItems,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
