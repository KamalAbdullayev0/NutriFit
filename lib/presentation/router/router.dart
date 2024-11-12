import 'package:auto_route/auto_route.dart';
import 'package:nutri_fit/presentation/router/router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: SplashRoute.page, path: '/', initial: true),
        AutoRoute(page: GetStartedRoute.page, path: '/get-started'),
        AutoRoute(page: LoginRoute.page, path: '/get-started/login'),
        AutoRoute(page: RegisterRoute.page, path: '/get-started/register'),

        // After Register
        AutoRoute(
            page: IWantToRoute.page, path: '/get-started/register/iwantto'),
        AutoRoute(
            page: WhatIsAgeRoute.page,
            path: '/get-started/register/iwantto/IsAge'),
        AutoRoute(
            page: WhatIsAgeHeightRoute.page,
            path: '/get-started/register/iwantto/IsAge/IsHeight'),
        AutoRoute(
            page: WhatIsAgeWeightRoute.page,
            path: '/get-started/register/iwantto/IsAge/IsHeight/IsWeight'),
        AutoRoute(
            page: WhatIsGenderRoute.page,
            path:
                '/get-started/register/iwantto/IsAge/IsHeight/IsWeight/IsGender'),

        AutoRoute(
          page: HomeRoute.page,
          path: '/home',
          children: [
            AutoRoute(page: DietRouteWidget.page, path: 'diet'),
            AutoRoute(page: SportRouteWidget.page, path: 'sport'),
            AutoRoute(page: LocationRouteWidget.page, path: 'location'),
            AutoRoute(page: ProfilRouteWidget.page, path: 'profile'),
          ],
        ),
      ];
}
