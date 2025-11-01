// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i6;
import 'package:connectinno_case/model/note_model.dart' as _i8;
import 'package:connectinno_case/pages/home_page.dart' as _i2;
import 'package:connectinno_case/pages/note_detail_page.dart' as _i1;
import 'package:connectinno_case/pages/note_page.dart' as _i3;
import 'package:connectinno_case/pages/sign_in_page.dart' as _i4;
import 'package:connectinno_case/pages/sign_up_page.dart' as _i5;
import 'package:flutter/material.dart' as _i7;

/// generated route for
/// [_i1.DetailPage]
class DetailRoute extends _i6.PageRouteInfo<DetailRouteArgs> {
  DetailRoute({
    _i7.Key? key,
    required _i8.NoteModel note,
    List<_i6.PageRouteInfo>? children,
  }) : super(
         DetailRoute.name,
         args: DetailRouteArgs(key: key, note: note),
         initialChildren: children,
       );

  static const String name = 'DetailRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<DetailRouteArgs>();
      return _i1.DetailPage(key: args.key, note: args.note);
    },
  );
}

class DetailRouteArgs {
  const DetailRouteArgs({this.key, required this.note});

  final _i7.Key? key;

  final _i8.NoteModel note;

  @override
  String toString() {
    return 'DetailRouteArgs{key: $key, note: $note}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! DetailRouteArgs) return false;
    return key == other.key && note == other.note;
  }

  @override
  int get hashCode => key.hashCode ^ note.hashCode;
}

/// generated route for
/// [_i2.HomePage]
class HomeRoute extends _i6.PageRouteInfo<void> {
  const HomeRoute({List<_i6.PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return const _i2.HomePage();
    },
  );
}

/// generated route for
/// [_i3.NotePage]
class NoteRoute extends _i6.PageRouteInfo<void> {
  const NoteRoute({List<_i6.PageRouteInfo>? children})
    : super(NoteRoute.name, initialChildren: children);

  static const String name = 'NoteRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return const _i3.NotePage();
    },
  );
}

/// generated route for
/// [_i4.SignInPage]
class SignInRoute extends _i6.PageRouteInfo<void> {
  const SignInRoute({List<_i6.PageRouteInfo>? children})
    : super(SignInRoute.name, initialChildren: children);

  static const String name = 'SignInRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return const _i4.SignInPage();
    },
  );
}

/// generated route for
/// [_i5.SignUpPage]
class SignUpRoute extends _i6.PageRouteInfo<void> {
  const SignUpRoute({List<_i6.PageRouteInfo>? children})
    : super(SignUpRoute.name, initialChildren: children);

  static const String name = 'SignUpRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return const _i5.SignUpPage();
    },
  );
}
