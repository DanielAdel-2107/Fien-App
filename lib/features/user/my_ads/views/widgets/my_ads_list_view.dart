import 'package:fien/core/utilies/sizes/sized_config.dart';
import 'package:fien/features/user/my_ads/view_models/cubit/my_ads_cubit.dart';
import 'package:fien/features/user/my_ads/views/widgets/my_ads_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyAdsListView extends StatelessWidget {
  const MyAdsListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: context.read<MyAdsCubit>().myLostFoundItems.length,
      padding: EdgeInsets.symmetric(
        vertical: SizeConfig.height * 0.01,
        horizontal: SizeConfig.width * 0.03,
      ),
      itemBuilder:
          (context, index) => MyAdsCard(
            lostFoundItemModel:
                context.read<MyAdsCubit>().myLostFoundItems[index],
          ),
    );
  }
}

