// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:test_technique_hellocse/core/manager/database_manager.dart'
    as _i3;
import 'package:test_technique_hellocse/data/datasource/film/dio/abstr_dio_film_datasource.dart'
    as _i6;
import 'package:test_technique_hellocse/data/datasource/film/dio/dio_film_datasource.dart'
    as _i7;
import 'package:test_technique_hellocse/data/datasource/film/sembast/abstr_sembast_film_datasource.dart'
    as _i8;
import 'package:test_technique_hellocse/data/datasource/film/sembast/sembast_film_datasource.dart'
    as _i9;
import 'package:test_technique_hellocse/data/repository/film/abstr_film_repository.dart'
    as _i10;
import 'package:test_technique_hellocse/data/repository/film/film_repository.dart'
    as _i11;
import 'package:test_technique_hellocse/data/source/film/dio/dio_film_source.dart'
    as _i4;
import 'package:test_technique_hellocse/data/source/film/sembast/sembast_film_source.dart'
    as _i5;
import 'package:test_technique_hellocse/domain/usecase/film/get_favorites_usecase.dart'
    as _i12;
import 'package:test_technique_hellocse/domain/usecase/film/get_now_playing_usecase.dart'
    as _i13;
import 'package:test_technique_hellocse/domain/usecase/film/is_favorite_usecase.dart'
    as _i14;
import 'package:test_technique_hellocse/domain/usecase/film/toggle_favorite_usecase.dart'
    as _i16;
import 'package:test_technique_hellocse/view/main/main_page_viewmodel.dart'
    as _i15;

/// ignore_for_file: unnecessary_lambdas
/// ignore_for_file: lines_longer_than_80_chars
extension GetItInjectableX on _i1.GetIt {
  /// initializes the registration of main-scope dependencies inside of [GetIt]
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i3.DatabaseManager>(_i3.DatabaseManager());
    gh.singleton<_i4.DioFilmSource>(_i4.DioFilmSource());
    gh.singleton<_i5.SembastFilmSource>(_i5.SembastFilmSource());
    gh.singleton<_i6.AbstrDioFilmDatasource>(_i7.DioFilmDatasource());
    gh.singleton<_i8.AbstrSembastFilmDatasource>(_i9.SembastFilmDatasource());
    gh.singleton<_i10.AbstrFilmRepository>(_i11.FilmRepository());
    gh.factory<_i12.GetFavoritesUseCase>(() => _i12.GetFavoritesUseCase());
    gh.factory<_i13.GetNowPlayingUseCase>(() => _i13.GetNowPlayingUseCase());
    gh.factory<_i14.IsFavoriteUseCase>(() => _i14.IsFavoriteUseCase());
    gh.factory<_i15.MainPageViewModel>(() => _i15.MainPageViewModel());
    gh.factory<_i16.ToggleFavoriteUseCase>(() => _i16.ToggleFavoriteUseCase());
    return this;
  }
}
