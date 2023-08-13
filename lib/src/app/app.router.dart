// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedNavigatorGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/material.dart' as _i9;
import 'package:flutter/material.dart';
import 'package:my_pertamini/src/iu/views/detail_order/detail_order_view.dart'
    as _i3;
import 'package:my_pertamini/src/iu/views/home/home_view.dart' as _i2;
import 'package:my_pertamini/src/iu/views/login/login_view.dart' as _i6;
import 'package:my_pertamini/src/iu/views/main/main_view.dart' as _i8;
import 'package:my_pertamini/src/iu/views/register/regis_view.dart' as _i7;
import 'package:my_pertamini/src/iu/views/splash_screen/splash_screen_view.dart'
    as _i5;
import 'package:my_pertamini/src/iu/views/status_order/status_order_view.dart'
    as _i4;
import 'package:my_pertamini/src/models/fuel.dart' as _i10;
import 'package:my_pertamini/src/models/order.dart' as _i11;
import 'package:stacked/stacked.dart' as _i1;
import 'package:stacked_services/stacked_services.dart' as _i12;

class Routes {
  static const homeView = '/home-view';

  static const detailOrderView = '/detail-order-view';

  static const statusOrderView = '/status-order-view';

  static const splashScreenView = '/';

  static const loginView = '/login-view';

  static const regisView = '/regis-view';

  static const mainView = '/main-view';

  static const all = <String>{
    homeView,
    detailOrderView,
    statusOrderView,
    splashScreenView,
    loginView,
    regisView,
    mainView,
  };
}

class StackedRouter extends _i1.RouterBase {
  final _routes = <_i1.RouteDef>[
    _i1.RouteDef(
      Routes.homeView,
      page: _i2.HomeView,
    ),
    _i1.RouteDef(
      Routes.detailOrderView,
      page: _i3.DetailOrderView,
    ),
    _i1.RouteDef(
      Routes.statusOrderView,
      page: _i4.StatusOrderView,
    ),
    _i1.RouteDef(
      Routes.splashScreenView,
      page: _i5.SplashScreenView,
    ),
    _i1.RouteDef(
      Routes.loginView,
      page: _i6.LoginView,
    ),
    _i1.RouteDef(
      Routes.regisView,
      page: _i7.RegisView,
    ),
    _i1.RouteDef(
      Routes.mainView,
      page: _i8.MainView,
    ),
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i2.HomeView: (data) {
      return _i9.MaterialPageRoute<dynamic>(
        builder: (context) => const _i2.HomeView(),
        settings: data,
      );
    },
    _i3.DetailOrderView: (data) {
      final args = data.getArgs<DetailOrderViewArguments>(nullOk: false);
      return _i9.MaterialPageRoute<dynamic>(
        builder: (context) => _i3.DetailOrderView(
            key: args.key, fuel: args.fuel, idUser: args.idUser),
        settings: data,
      );
    },
    _i4.StatusOrderView: (data) {
      final args = data.getArgs<StatusOrderViewArguments>(nullOk: false);
      return _i9.MaterialPageRoute<dynamic>(
        builder: (context) => _i4.StatusOrderView(
            key: args.key,
            nameFuel: args.nameFuel,
            numberOktan: args.numberOktan,
            dataOrder: args.dataOrder),
        settings: data,
      );
    },
    _i5.SplashScreenView: (data) {
      return _i9.MaterialPageRoute<dynamic>(
        builder: (context) => const _i5.SplashScreenView(),
        settings: data,
      );
    },
    _i6.LoginView: (data) {
      return _i9.MaterialPageRoute<dynamic>(
        builder: (context) => const _i6.LoginView(),
        settings: data,
      );
    },
    _i7.RegisView: (data) {
      return _i9.MaterialPageRoute<dynamic>(
        builder: (context) => const _i7.RegisView(),
        settings: data,
      );
    },
    _i8.MainView: (data) {
      return _i9.MaterialPageRoute<dynamic>(
        builder: (context) => const _i8.MainView(),
        settings: data,
      );
    },
  };

  @override
  List<_i1.RouteDef> get routes => _routes;
  @override
  Map<Type, _i1.StackedRouteFactory> get pagesMap => _pagesMap;
}

class DetailOrderViewArguments {
  const DetailOrderViewArguments({
    this.key,
    required this.fuel,
    required this.idUser,
  });

  final _i9.Key? key;

  final _i10.Fuel fuel;

  final String idUser;

  @override
  String toString() {
    return '{"key": "$key", "fuel": "$fuel", "idUser": "$idUser"}';
  }

  @override
  bool operator ==(covariant DetailOrderViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.fuel == fuel && other.idUser == idUser;
  }

  @override
  int get hashCode {
    return key.hashCode ^ fuel.hashCode ^ idUser.hashCode;
  }
}

class StatusOrderViewArguments {
  const StatusOrderViewArguments({
    this.key,
    required this.nameFuel,
    required this.numberOktan,
    required this.dataOrder,
  });

  final _i9.Key? key;

  final String nameFuel;

  final String numberOktan;

  final _i11.Order? dataOrder;

  @override
  String toString() {
    return '{"key": "$key", "nameFuel": "$nameFuel", "numberOktan": "$numberOktan", "dataOrder": "$dataOrder"}';
  }

  @override
  bool operator ==(covariant StatusOrderViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key &&
        other.nameFuel == nameFuel &&
        other.numberOktan == numberOktan &&
        other.dataOrder == dataOrder;
  }

  @override
  int get hashCode {
    return key.hashCode ^
        nameFuel.hashCode ^
        numberOktan.hashCode ^
        dataOrder.hashCode;
  }
}

extension NavigatorStateExtension on _i12.NavigationService {
  Future<dynamic> navigateToHomeView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.homeView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToDetailOrderView({
    _i9.Key? key,
    required _i10.Fuel fuel,
    required String idUser,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.detailOrderView,
        arguments:
            DetailOrderViewArguments(key: key, fuel: fuel, idUser: idUser),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToStatusOrderView({
    _i9.Key? key,
    required String nameFuel,
    required String numberOktan,
    required _i11.Order? dataOrder,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.statusOrderView,
        arguments: StatusOrderViewArguments(
            key: key,
            nameFuel: nameFuel,
            numberOktan: numberOktan,
            dataOrder: dataOrder),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToSplashScreenView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.splashScreenView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToLoginView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.loginView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToRegisView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.regisView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToMainView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.mainView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithHomeView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.homeView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithDetailOrderView({
    _i9.Key? key,
    required _i10.Fuel fuel,
    required String idUser,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.detailOrderView,
        arguments:
            DetailOrderViewArguments(key: key, fuel: fuel, idUser: idUser),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithStatusOrderView({
    _i9.Key? key,
    required String nameFuel,
    required String numberOktan,
    required _i11.Order? dataOrder,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.statusOrderView,
        arguments: StatusOrderViewArguments(
            key: key,
            nameFuel: nameFuel,
            numberOktan: numberOktan,
            dataOrder: dataOrder),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithSplashScreenView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.splashScreenView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithLoginView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.loginView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithRegisView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.regisView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithMainView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.mainView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }
}
