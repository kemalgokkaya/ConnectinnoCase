import 'package:auto_route/auto_route.dart';
import 'package:connectinno_case/core/router/auto_route.gr.dart';

@AutoRouterConfig(replaceInRouteName: "Page,Route")
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: SignInRoute.page),
    AutoRoute(page: HomeRoute.page, initial: true),
    AutoRoute(page: NoteRoute.page),
    AutoRoute(page: SignUpRoute.page),
    AutoRoute(page: DetailRoute.page),
  ];
}
