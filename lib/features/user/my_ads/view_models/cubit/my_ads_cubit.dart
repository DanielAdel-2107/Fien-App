import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:fien/core/cache/cache_helper.dart';
import 'package:fien/core/di/dependancy_injection.dart';
import 'package:fien/core/network/api/api_consumer.dart';
import 'package:fien/core/network/api/end_points.dart';
import 'package:fien/features/user/home/models/lost_found_item_model.dart';
import 'package:meta/meta.dart';

part 'my_ads_state.dart';

class MyAdsCubit extends Cubit<MyAdsState> {
  MyAdsCubit({required this.apiConsumer}) : super(MyAdsInitial());
  final ApiConsumer apiConsumer;
  List<LostFoundItemModel> lostFoundItems = [];
  List<LostFoundItemModel> myLostFoundItems = [];
  Future<void> getMyAds() async {
    try {
      emit(GetMyAdsLoading());
      await apiConsumer.get(EndPoints.getFoundItems).then((response) {
        if (response is List) {
          lostFoundItems =
              response
                  .map((item) => LostFoundItemModel.fromJson(item))
                  .toList();
          for (var element in lostFoundItems) {
            if (element.user.id.toString() ==
                getIt<CacheHelper>().getUserModel()!.id) {
              myLostFoundItems.add(element);
            }
          }
          emit(GetMyAdsSuccess());
        } else {
          emit(GetMyAdsError(message: "You don't have any ads"));
        }
      });
    } catch (e) {
      log(e.toString());
      emit(GetMyAdsError(message: e.toString()));
    }
  }
}
