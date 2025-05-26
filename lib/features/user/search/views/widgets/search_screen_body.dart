import 'package:fien/core/utilies/colors/app_colors.dart';
import 'package:fien/core/utilies/sizes/sized_config.dart';
import 'package:fien/core/utilies/styles/app_text_styles.dart';
import 'package:fien/features/user/home/views/widgets/lost_found_item_grid_view_builder.dart';
import 'package:fien/features/user/search/view_models/cubit/search_cubit.dart';
import 'package:fien/features/user/search/views/widgets/filter_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchScreenBody extends StatelessWidget {
  const SearchScreenBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: SizeConfig.width * 0.02),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: SizeConfig.height * 0.02),
          FilterButton(),
          SizedBox(height: SizeConfig.height * 0.01),
          Expanded(
            child: BlocBuilder<SearchCubit, SearchState>(
              builder: (context, state) {
                var cubit = context.read<SearchCubit>();
                if (state is GetItemsByImageLoading) {
                  return Center(
                    child: CircularProgressIndicator(
                      color: AppColors.kPrimaryColor,
                    ),
                  );
                }
                if (state is GetItemsByImageFailure) {
                  return Center(
                    child: Text(
                      state.message,
                      style: AppTextStyles.title24PrimaryColorBold,
                    ),
                  );
                }
                return LostFoundItemGridViewBuilder(
                  items: cubit.searchedItems,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

