// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:device_info_plus/device_info_plus.dart' as _i8;
import 'package:firebase_core/firebase_core.dart' as _i4;
import 'package:firebase_remote_config/firebase_remote_config.dart' as _i7;
import 'package:get_it/get_it.dart' as _i1;
import 'package:get_storage/get_storage.dart' as _i3;
import 'package:examplearch/app/data/repository/user_repository.dart' as _i19;
import 'package:examplearch/app/data/service/auth_service.dart' as _i16;
import 'package:examplearch/app/presentation/app/app.vm.dart' as _i18;
import 'package:examplearch/app/presentation/auth/auth.vm.dart' as _i14;
import 'package:examplearch/app/presentation/auth/login/login.vm.dart' as _i25;
import 'package:examplearch/app/presentation/auth/on_boarding/onboarding.vm.dart'
    as _i13;
import 'package:examplearch/app/presentation/auth/register/register.vm.dart'
    as _i26;
import 'package:examplearch/app/presentation/auth/register_route/age_selection.vm.dart'
    as _i11;
import 'package:examplearch/app/presentation/auth/register_route/gender_selection.vm.dart'
    as _i15;
import 'package:examplearch/app/presentation/auth/register_route/height_selection.vm.dart'
    as _i9;
import 'package:examplearch/app/presentation/auth/register_route/name_selection.vm.dart'
    as _i10;
import 'package:examplearch/app/presentation/auth/register_route/promise.vm.dart'
    as _i23;
import 'package:examplearch/app/presentation/auth/register_route/weight_selection.vm.dart'
    as _i12;
import 'package:examplearch/app/presentation/home/home.vm.dart' as _i22;
import 'package:examplearch/app/presentation/profile/profile.vm.dart' as _i20;
import 'package:examplearch/app/presentation/profile/settings/settings.vm.dart'
    as _i21;
import 'package:examplearch/app/presentation/root/root_page.vm.dart' as _i24;
import 'package:examplearch/core/config.dart' as _i6;
import 'package:examplearch/core/di/app_module.dart' as _i27;
import 'package:examplearch/core/local_data_source/local_data_source.dart'
    as _i5;
import 'package:injectable/injectable.dart' as _i2;
import 'package:package_info_plus/package_info_plus.dart' as _i17;

const String _prod = 'prod';
const String _dev = 'dev';
const String _test = 'test';

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final appModule = _$AppModule();
    await gh.factoryAsync<_i3.GetStorage>(
      () => appModule.storage,
      registerFor: {
        _prod,
        _dev,
      },
      preResolve: true,
    );
    await gh.factoryAsync<_i4.FirebaseApp>(
      () => appModule.devFirebaseApp,
      registerFor: {_dev},
      preResolve: true,
    );
    await gh.factoryAsync<_i4.FirebaseApp>(
      () => appModule.firebaseApp,
      registerFor: {_prod},
      preResolve: true,
    );
    gh.lazySingleton<_i5.LocalDataSource>(
      () => _i5.LocalDataSourceImpl(gh<_i3.GetStorage>()),
      registerFor: {
        _prod,
        _dev,
      },
    );
    gh.lazySingleton<_i6.AppConfig>(
      () => _i6.TestAppConfigImpl(),
      registerFor: {_test},
    );
    await gh.factoryAsync<_i7.FirebaseRemoteConfig>(
      () => appModule.remoteConfigService,
      registerFor: {
        _dev,
        _prod,
      },
      preResolve: true,
    );
    gh.lazySingleton<_i6.AppConfig>(
      () => _i6.DevAppConfigImpl(gh<_i7.FirebaseRemoteConfig>()),
      registerFor: {_dev},
    );
    gh.singleton<_i6.AppConfig>(
      () => _i6.ProdAppConfigImpl(gh<_i7.FirebaseRemoteConfig>()),
      registerFor: {_prod},
    );
    gh.factory<_i8.DeviceInfoPlugin>(() => appModule.deviceInfo);
    gh.factory<_i9.HeightSelectionViewModel>(
        () => _i9.HeightSelectionViewModel());
    gh.factory<_i10.NameSelectionViewModel>(
        () => _i10.NameSelectionViewModel());
    gh.factory<_i11.AgeSelectionViewModel>(() => _i11.AgeSelectionViewModel());
    gh.factory<_i12.WeightSelectionViewModel>(
        () => _i12.WeightSelectionViewModel());
    gh.factory<_i13.OnboardingViewModel>(() => _i13.OnboardingViewModel());
    gh.factory<_i14.AuthPageViewModel>(() => _i14.AuthPageViewModel());
    gh.factory<_i15.GenderSelectionViewModel>(
        () => _i15.GenderSelectionViewModel());
    gh.singleton<_i16.AuthService>(() => _i16.AuthService());
    gh.lazySingleton<_i5.LocalDataSource>(
      () => _i5.LocalDataSourceMock(),
      registerFor: {_test},
    );
    await gh.factoryAsync<_i17.PackageInfo>(
      () => appModule.packageInfo,
      registerFor: {
        _prod,
        _dev,
      },
      preResolve: true,
    );
    gh.factory<_i17.PackageInfo>(
      () => appModule.packageInfoTest,
      registerFor: {_test},
    );
    gh.singleton<_i18.AppViewModel>(() => _i18.AppViewModel(
          gh<_i17.PackageInfo>(),
          gh<_i6.AppConfig>(),
          gh<_i5.LocalDataSource>(),
        ));
    gh.lazySingleton<_i19.UserRepository>(
      () => _i19.UserRepositoryImpl(
        gh<_i16.AuthService>(),
        gh<_i5.LocalDataSource>(),
      ),
      registerFor: {
        _dev,
        _prod,
      },
    );
    gh.factory<_i20.ProfileViewModel>(() => _i20.ProfileViewModel(
          gh<_i19.UserRepository>(),
          gh<_i5.LocalDataSource>(),
        ));
    gh.factory<_i21.SettingsViewModel>(() => _i21.SettingsViewModel(
          gh<_i5.LocalDataSource>(),
          gh<_i19.UserRepository>(),
        ));
    gh.factory<_i22.HomeViewModel>(
        () => _i22.HomeViewModel(gh<_i19.UserRepository>()));
    gh.factory<_i23.PromiseViewModel>(
        () => _i23.PromiseViewModel(gh<_i19.UserRepository>()));
    gh.factory<_i24.RootPageViewModel>(
        () => _i24.RootPageViewModel(gh<_i19.UserRepository>()));
    gh.factory<_i25.LoginViewModel>(
        () => _i25.LoginViewModel(gh<_i19.UserRepository>()));
    gh.factory<_i26.RegisterViewModel>(
        () => _i26.RegisterViewModel(gh<_i19.UserRepository>()));
    return this;
  }
}

class _$AppModule extends _i27.AppModule {}
