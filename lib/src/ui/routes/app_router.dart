import 'package:flutter/material.dart';

import 'app_route_name.dart';

class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRouteNames.auth:
        return _buildMaterialPageRoute(
          const Placeholder(),
          name: AppRouteNames.auth,
        );
      case AppRouteNames.onboarding:
        return _buildMaterialPageRoute(
          const Placeholder(),
          name: AppRouteNames.onboarding,
        );

      case AppRouteNames.home:
        return _buildMaterialPageRoute(
          const Placeholder(),
          name: AppRouteNames.home,
        );

      default:
        return _buildMaterialPageRoute(const Scaffold());
    }
  }

  static Route<dynamic> _buildMaterialPageRoute(Widget widget, {String? name}) {
    return MaterialPageRoute(
      builder: (_) => widget,
      settings: RouteSettings(name: name),
    );
  }
}
