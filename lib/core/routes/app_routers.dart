import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sear_soqe/core/data/cached/cache_helper.dart';
import 'package:sear_soqe/core/routes/router_names.dart';

final GoRouter router = GoRouter(
  initialLocation: RouterNames.userType,
  redirect: (context, state) {
    final token = CacheHelper.getToken();
    final driverId = CacheHelper.getDriverId();

    if (driverId != null && driverId.isNotEmpty) {
      return RouterNames.appDelivery;
    } else if (token != null && token.isNotEmpty) {
      return RouterNames.app;
    }

    return null;
  },
  routes: [],
);
