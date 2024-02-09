import 'package:movie_ducr/core/service_locator.dart';
import 'package:movie_ducr/features/profile/data/datasource/profile_datasource.dart';
import 'package:movie_ducr/features/profile/domain/usecases/get_profile_usecase.dart';
import 'package:movie_ducr/features/profile/presentation/bloc/profile/profile_bloc.dart';

void initFeatureProfile() {

  sl.registerLazySingleton(() => ProfileDatasource());

  sl.registerFactory(() => ProfileUc(dataSource: sl()));
  
  sl.registerFactory(() => ProfileBloc(profileUc: sl()));
}