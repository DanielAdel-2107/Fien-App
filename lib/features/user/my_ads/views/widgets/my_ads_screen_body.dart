import 'package:fien/core/di/dependancy_injection.dart';
import 'package:fien/core/network/api/api_consumer.dart';
import 'package:fien/core/utilies/colors/app_colors.dart';
import 'package:fien/features/user/my_ads/view_models/cubit/my_ads_cubit.dart';
import 'package:fien/features/user/my_ads/views/widgets/my_ads_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyAdsScreenBody extends StatelessWidget {
  const MyAdsScreenBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider(
        create:
            (context) =>
                MyAdsCubit(apiConsumer: getIt<ApiConsumer>())..getMyAds(),
        child: BlocBuilder<MyAdsCubit, MyAdsState>(
          builder: (context, state) {
            if (state is GetMyAdsLoading) {
              return Center(
                child: CircularProgressIndicator(
                  color: AppColors.kPrimaryColor,
                ),
              );
            }
            return MyAdsListView();
          },
        ),
      ),
    );
  }
}
