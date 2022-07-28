// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../features/detail/data/repo/detail_repo_impl.dart' as _i7;
import '../../features/detail/domain/repo/detail_repo.dart' as _i6;
import '../../features/detail/domain/usecase/get_detail_info_food.dart' as _i8;
import '../../features/detail/presentation/bloc/detail_info_bloc.dart' as _i12;
import '../../features/home/data/repo/home_repo_impl.dart' as _i5;
import '../../features/home/domain/repo/home_repo.dart' as _i4;
import '../../features/home/domain/usecase/get_food_by_category.dart' as _i9;
import '../../features/home/domain/usecase/get_list_category.dart' as _i10;
import '../../features/home/presentation/bloc/home_bloc.dart' as _i11;
import 'register_module.dart' as _i13; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) async {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final registerModule = _$RegisterModule();
  await gh.factoryAsync<_i3.Dio>(() => registerModule.dio, preResolve: true);
  gh.lazySingleton<_i4.HomeRepo>(() => _i5.HomeRepoImpl(get<_i3.Dio>()));
  gh.lazySingleton<_i6.DetailRepo>(() => _i7.DetailRepoImpl(get<_i3.Dio>()));
  gh.factory<_i8.GetDetailInfoFood>(
      () => _i8.GetDetailInfoFood(get<_i6.DetailRepo>()));
  gh.factory<_i9.GetFoodByCategory>(
      () => _i9.GetFoodByCategory(get<_i4.HomeRepo>()));
  gh.factory<_i10.GetListCategory>(
      () => _i10.GetListCategory(get<_i4.HomeRepo>()));
  gh.factory<_i11.HomeBloc>(() =>
      _i11.HomeBloc(get<_i10.GetListCategory>(), get<_i9.GetFoodByCategory>()));
  gh.factory<_i12.DetailInfoBloc>(
      () => _i12.DetailInfoBloc(get<_i8.GetDetailInfoFood>()));
  return get;
}

class _$RegisterModule extends _i13.RegisterModule {}
