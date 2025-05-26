import 'package:fien/core/network/api/end_points.dart';
import 'package:fien/features/user/home/view_models/cubit/get_found_items_cubit.dart';
import 'package:fien/features/user/search/view_models/cubit/search_cubit.dart';
import 'package:http/http.dart' as http;
import 'package:fien/core/cache/cache_helper.dart';
import 'package:fien/core/network/api/api_consumer.dart';
import 'package:fien/core/network/api/http_consummer.dart';
import 'package:get_it/get_it.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final getIt = GetIt.instance;

Future<void> setupDI() async {
  getIt.registerLazySingleton(() => Supabase.instance.client);
  final cacheHelper = CacheHelper();
  await cacheHelper.init();
  getIt.registerSingleton<CacheHelper>(cacheHelper);
  getIt.registerLazySingleton<http.Client>(() => http.Client());
  getIt.registerLazySingleton<GetFoundItemsCubit>(() => GetFoundItemsCubit(apiConsumer: getIt<ApiConsumer>()));
  getIt.registerLazySingleton<SearchCubit>(() => SearchCubit(getIt<ApiConsumer>()));
  getIt.registerLazySingleton<ApiConsumer>(
    () => HttpConsumer(baseUrl: EndPoints.baseurl,),
  );
}
