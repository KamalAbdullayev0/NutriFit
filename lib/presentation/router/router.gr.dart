// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i15;
import 'package:flutter/material.dart' as _i16;
import 'package:nutri_fit/domain/usecases/user/user.dart';
import 'package:nutri_fit/presentation/auth/pages/login.dart' as _i6;
import 'package:nutri_fit/presentation/auth/pages/register.dart' as _i8;
import 'package:nutri_fit/presentation/home/pages/home.dart' as _i3;
import 'package:nutri_fit/presentation/home_pages/diet/pages/diet_page.dart'
    as _i1;
import 'package:nutri_fit/presentation/home_pages/location/pages/location_page.dart'
    as _i5;
import 'package:nutri_fit/presentation/home_pages/profile/pages/profil_page.dart'
    as _i7;
import 'package:nutri_fit/presentation/home_pages/sport/pages/sport_page.dart'
    as _i10;
import 'package:nutri_fit/presentation/intro_sign/pages/get_started.dart'
    as _i2;
import 'package:nutri_fit/presentation/splash/pages/splash.dart' as _i9;
import 'package:nutri_fit/presentation/userdata/bloc/user_rxdart.dart';
import 'package:nutri_fit/presentation/userdata/pages/i_want_to.dart' as _i4;
import 'package:nutri_fit/presentation/userdata/pages/what_is_age.dart' as _i12;
import 'package:nutri_fit/presentation/userdata/pages/what_is_gender.dart'
    as _i14;
import 'package:nutri_fit/presentation/userdata/pages/what_is_heigh.dart'
    as _i11;
import 'package:nutri_fit/presentation/userdata/pages/what_is_weight.dart'
    as _i13;

/// generated route for
/// [_i1.DietPageWidget]
class DietRouteWidget extends _i15.PageRouteInfo<void> {
  const DietRouteWidget({List<_i15.PageRouteInfo>? children})
      : super(
          DietRouteWidget.name,
          initialChildren: children,
        );

  static const String name = 'DietRouteWidget';

  static _i15.PageInfo page = _i15.PageInfo(
    name,
    builder: (data) {
      return _i1.DietPageWidget();
    },
  );
}

/// generated route for
/// [_i2.GetStartedScreen]
class GetStartedRoute extends _i15.PageRouteInfo<GetStartedRouteArgs> {
  GetStartedRoute({
    _i16.Key? key,
    List<_i15.PageRouteInfo>? children,
  }) : super(
          GetStartedRoute.name,
          args: GetStartedRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'GetStartedRoute';

  static _i15.PageInfo page = _i15.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<GetStartedRouteArgs>(
          orElse: () => const GetStartedRouteArgs());
      return _i2.GetStartedScreen(key: args.key);
    },
  );
}

class GetStartedRouteArgs {
  const GetStartedRouteArgs({this.key});

  final _i16.Key? key;

  @override
  String toString() {
    return 'GetStartedRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i3.HomePage]
class HomeRoute extends _i15.PageRouteInfo<void> {
  const HomeRoute({List<_i15.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static _i15.PageInfo page = _i15.PageInfo(
    name,
    builder: (data) {
      return const _i3.HomePage();
    },
  );
}

/// generated route for
/// [_i4.IWantToScreen]
class IWantToRoute extends _i15.PageRouteInfo<void> {
  const IWantToRoute({List<_i15.PageRouteInfo>? children})
      : super(
          IWantToRoute.name,
          initialChildren: children,
        );

  static const String name = 'IWantToRoute';

  static _i15.PageInfo page = _i15.PageInfo(
    name,
    builder: (data) {
      return _i4.IWantToScreen(
        userBloc: UserBloc(),
      );
    },
  );
}

/// generated route for
/// [_i5.LocationPageWidget]
class LocationRouteWidget extends _i15.PageRouteInfo<void> {
  const LocationRouteWidget({List<_i15.PageRouteInfo>? children})
      : super(
          LocationRouteWidget.name,
          initialChildren: children,
        );

  static const String name = 'LocationRouteWidget';

  static _i15.PageInfo page = _i15.PageInfo(
    name,
    builder: (data) {
      return _i5.LocationPage();
    },
  );
}

/// generated route for
/// [_i6.LoginPage]
class LoginRoute extends _i15.PageRouteInfo<void> {
  const LoginRoute({List<_i15.PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static _i15.PageInfo page = _i15.PageInfo(
    name,
    builder: (data) {
      return const _i6.LoginPage();
    },
  );
}

/// generated route for
/// [_i7.ProfilPageWidget]
class ProfilRouteWidget extends _i15.PageRouteInfo<void> {
  const ProfilRouteWidget({List<_i15.PageRouteInfo>? children})
      : super(
          ProfilRouteWidget.name,
          initialChildren: children,
        );

  static const String name = 'ProfilRouteWidget';

  static _i15.PageInfo page = _i15.PageInfo(
    name,
    builder: (data) {
      return _i7.ProfilePageWidget(getUserDataUseCase: GetUserDataUseCase());
    },
  );
}

/// generated route for
/// [_i8.RegisterPage]
class RegisterRoute extends _i15.PageRouteInfo<void> {
  const RegisterRoute({List<_i15.PageRouteInfo>? children})
      : super(
          RegisterRoute.name,
          initialChildren: children,
        );

  static const String name = 'RegisterRoute';

  static _i15.PageInfo page = _i15.PageInfo(
    name,
    builder: (data) {
      return const _i8.RegisterPage();
    },
  );
}

/// generated route for
/// [_i9.SplashPage]
class SplashRoute extends _i15.PageRouteInfo<void> {
  const SplashRoute({List<_i15.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static _i15.PageInfo page = _i15.PageInfo(
    name,
    builder: (data) {
      return const _i9.SplashPage();
    },
  );
}

/// generated route for
/// [_i10.SportPageWidget]
class SportRouteWidget extends _i15.PageRouteInfo<void> {
  const SportRouteWidget({List<_i15.PageRouteInfo>? children})
      : super(
          SportRouteWidget.name,
          initialChildren: children,
        );

  static const String name = 'SportRouteWidget';

  static _i15.PageInfo page = _i15.PageInfo(
    name,
    builder: (data) {
      return const _i10.SportPageWidget();
    },
  );
}

/// generated route for
/// [_i11.WhatIsAgeHeightScreen]
class WhatIsAgeHeightRoute extends _i15.PageRouteInfo<void> {
  const WhatIsAgeHeightRoute({List<_i15.PageRouteInfo>? children})
      : super(
          WhatIsAgeHeightRoute.name,
          initialChildren: children,
        );

  static const String name = 'WhatIsAgeHeightRoute';

  static _i15.PageInfo page = _i15.PageInfo(
    name,
    builder: (data) {
      return _i11.WhatIsAgeHeightScreen(userBloc: UserBloc());
    },
  );
}

/// generated route for
/// [_i12.WhatIsAgeScreen]
class WhatIsAgeRoute extends _i15.PageRouteInfo<void> {
  const WhatIsAgeRoute({List<_i15.PageRouteInfo>? children})
      : super(
          WhatIsAgeRoute.name,
          initialChildren: children,
        );

  static const String name = 'WhatIsAgeRoute';

  static _i15.PageInfo page = _i15.PageInfo(
    name,
    builder: (data) {
      return _i12.WhatIsAgeScreenWrapper(userBloc: UserBloc());
    },
  );
}

/// generated route for
/// [_i13.WhatIsAgeWeightScreen]
class WhatIsAgeWeightRoute extends _i15.PageRouteInfo<void> {
  const WhatIsAgeWeightRoute({List<_i15.PageRouteInfo>? children})
      : super(
          WhatIsAgeWeightRoute.name,
          initialChildren: children,
        );

  static const String name = 'WhatIsAgeWeightRoute';

  static _i15.PageInfo page = _i15.PageInfo(
    name,
    builder: (data) {
      return _i13.WhatIsAgeWeightScreen(userBloc: UserBloc());
    },
  );
}

/// generated route for
/// [_i14.WhatIsGenderScreen]
class WhatIsGenderRoute extends _i15.PageRouteInfo<void> {
  const WhatIsGenderRoute({List<_i15.PageRouteInfo>? children})
      : super(
          WhatIsGenderRoute.name,
          initialChildren: children,
        );

  static const String name = 'WhatIsGenderRoute';

  static _i15.PageInfo page = _i15.PageInfo(
    name,
    builder: (data) {
      return _i14.WhatIsGenderScreen(userBloc: UserBloc());
    },
  );
}
