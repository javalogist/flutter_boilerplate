import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppRouteObserverController extends GetxController {
  var isInitialRoute = true.obs;

  void setInitialRoute(bool isInitial) {
    isInitialRoute.value = isInitial;
  }
}

class AppNavigatorObserver extends NavigatorObserver {
  final AppRouteObserverController routeController = Get.put(AppRouteObserverController());

  @override
  void didPush(Route route, Route? previousRoute) {
    super.didPush(route, previousRoute);
    routeController.setInitialRoute(previousRoute == null);
  }

  @override
  void didPop(Route route, Route? previousRoute) {
    super.didPop(route, previousRoute);
    routeController.setInitialRoute(previousRoute == null || previousRoute.isFirst);

  }

  @override
  void didRemove(Route route, Route? previousRoute) {
    super.didRemove(route, previousRoute);
    routeController.setInitialRoute(previousRoute == null);
  }

  @override
  void didReplace({Route? newRoute, Route? oldRoute}) {
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
    routeController.setInitialRoute(newRoute == null || oldRoute == null);
  }
}