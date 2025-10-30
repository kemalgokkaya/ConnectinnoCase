// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:connectinno_case/pages/home_page.dart' as _i1;
import 'package:connectinno_case/pages/note_page.dart' as _i2;
import 'package:connectinno_case/pages/sign_in_page.dart' as _i3;
import 'package:connectinno_case/pages/sign_up_page.dart' as _i4;

/// generated route for
/// [_i1.HomePage]
class HomeRoute extends _i5.PageRouteInfo<void> {
  const HomeRoute({List<_i5.PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i1.HomePage();
    },
  );
}

/// generated route for
/// [_i2.NotePage]
class NoteRoute extends _i5.PageRouteInfo<void> {
  const NoteRoute({List<_i5.PageRouteInfo>? children})
    : super(NoteRoute.name, initialChildren: children);

  static const String name = 'NoteRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i2.NotePage();
    },
  );
}

/// generated route for
/// [_i3.SignInPage]
class SignInRoute extends _i5.PageRouteInfo<void> {
  const SignInRoute({List<_i5.PageRouteInfo>? children})
    : super(SignInRoute.name, initialChildren: children);

  static const String name = 'SignInRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i3.SignInPage();
    },
  );
}

/// generated route for
/// [_i4.SignUpPage]
class SignUpRoute extends _i5.PageRouteInfo<void> {
  const SignUpRoute({List<_i5.PageRouteInfo>? children})
    : super(SignUpRoute.name, initialChildren: children);

  static const String name = 'SignUpRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i4.SignUpPage();
    },
  );
}
