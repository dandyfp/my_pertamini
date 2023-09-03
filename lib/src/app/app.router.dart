// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedNavigatorGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/material.dart' as _i18;
import 'package:flutter/material.dart';
import 'package:my_pertamini/src/iu/views/cart/cart_view.dart' as _i9;
import 'package:my_pertamini/src/iu/views/detail_order/detail_order_view.dart'
    as _i3;
import 'package:my_pertamini/src/iu/views/home/home_view.dart' as _i2;
import 'package:my_pertamini/src/iu/views/login/login_view.dart' as _i6;
import 'package:my_pertamini/src/iu/views/main/main_view.dart' as _i8;
import 'package:my_pertamini/src/iu/views/order/fuel_order_view.dart' as _i16;
import 'package:my_pertamini/src/iu/views/order/transaction_order_view.dart'
    as _i17;
import 'package:my_pertamini/src/iu/views/order/user_order_view.dart' as _i15;
import 'package:my_pertamini/src/iu/views/pos/pos_view.dart' as _i10;
import 'package:my_pertamini/src/iu/views/pos_delivery/pos_delivery_view.dart'
    as _i12;
import 'package:my_pertamini/src/iu/views/pos_fuel/pos_fuel_view.dart' as _i14;
import 'package:my_pertamini/src/iu/views/pos_people/pos_people_view.dart'
    as _i11;
import 'package:my_pertamini/src/iu/views/pos_transaction/pos_transaction_view.dart'
    as _i13;
import 'package:my_pertamini/src/iu/views/register/regis_view.dart' as _i7;
import 'package:my_pertamini/src/iu/views/splash_screen/splash_screen_view.dart'
    as _i5;
import 'package:my_pertamini/src/iu/views/status_order/status_order_view.dart'
    as _i4;
import 'package:my_pertamini/src/models/fuel.dart' as _i19;
import 'package:my_pertamini/src/models/order.dart' as _i20;
import 'package:stacked/stacked.dart' as _i1;
import 'package:stacked_services/stacked_services.dart' as _i21;

class Routes {
  static const homeView = '/home-view';

  static const detailOrderView = '/detail-order-view';

  static const statusOrderView = '/status-order-view';

  static const splashScreenView = '/';

  static const loginView = '/login-view';

  static const regisView = '/regis-view';

  static const mainView = '/main-view';

  static const cartView = '/cart-view';

  static const posView = '/pos-view';

  static const posPeopleView = '/pos-people-view';

  static const posDeliveryView = '/pos-delivery-view';

  static const posTransactionView = '/pos-transaction-view';

  static const posFuelView = '/pos-fuel-view';

  static const userOrderView = '/user-order-view';

  static const fuelOrderView = '/fuel-order-view';

  static const transactionOrderView = '/transaction-order-view';

  static const all = <String>{
    homeView,
    detailOrderView,
    statusOrderView,
    splashScreenView,
    loginView,
    regisView,
    mainView,
    cartView,
    posView,
    posPeopleView,
    posDeliveryView,
    posTransactionView,
    posFuelView,
    userOrderView,
    fuelOrderView,
    transactionOrderView,
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
    _i1.RouteDef(
      Routes.cartView,
      page: _i9.CartView,
    ),
    _i1.RouteDef(
      Routes.posView,
      page: _i10.PosView,
    ),
    _i1.RouteDef(
      Routes.posPeopleView,
      page: _i11.PosPeopleView,
    ),
    _i1.RouteDef(
      Routes.posDeliveryView,
      page: _i12.PosDeliveryView,
    ),
    _i1.RouteDef(
      Routes.posTransactionView,
      page: _i13.PosTransactionView,
    ),
    _i1.RouteDef(
      Routes.posFuelView,
      page: _i14.PosFuelView,
    ),
    _i1.RouteDef(
      Routes.userOrderView,
      page: _i15.UserOrderView,
    ),
    _i1.RouteDef(
      Routes.fuelOrderView,
      page: _i16.FuelOrderView,
    ),
    _i1.RouteDef(
      Routes.transactionOrderView,
      page: _i17.TransactionOrderView,
    ),
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i2.HomeView: (data) {
      return _i18.MaterialPageRoute<dynamic>(
        builder: (context) => const _i2.HomeView(),
        settings: data,
      );
    },
    _i3.DetailOrderView: (data) {
      final args = data.getArgs<DetailOrderViewArguments>(nullOk: false);
      return _i18.MaterialPageRoute<dynamic>(
        builder: (context) => _i3.DetailOrderView(
            key: args.key, fuel: args.fuel, idUser: args.idUser),
        settings: data,
      );
    },
    _i4.StatusOrderView: (data) {
      final args = data.getArgs<StatusOrderViewArguments>(nullOk: false);
      return _i18.MaterialPageRoute<dynamic>(
        builder: (context) => _i4.StatusOrderView(
            key: args.key,
            nameFuel: args.nameFuel,
            numberOktan: args.numberOktan,
            dataOrder: args.dataOrder),
        settings: data,
      );
    },
    _i5.SplashScreenView: (data) {
      return _i18.MaterialPageRoute<dynamic>(
        builder: (context) => const _i5.SplashScreenView(),
        settings: data,
      );
    },
    _i6.LoginView: (data) {
      return _i18.MaterialPageRoute<dynamic>(
        builder: (context) => const _i6.LoginView(),
        settings: data,
      );
    },
    _i7.RegisView: (data) {
      return _i18.MaterialPageRoute<dynamic>(
        builder: (context) => const _i7.RegisView(),
        settings: data,
      );
    },
    _i8.MainView: (data) {
      final args = data.getArgs<MainViewArguments>(nullOk: false);
      return _i18.MaterialPageRoute<dynamic>(
        builder: (context) => _i8.MainView(key: args.key, admin: args.admin),
        settings: data,
      );
    },
    _i9.CartView: (data) {
      return _i18.MaterialPageRoute<dynamic>(
        builder: (context) => const _i9.CartView(),
        settings: data,
      );
    },
    _i10.PosView: (data) {
      return _i18.MaterialPageRoute<dynamic>(
        builder: (context) => const _i10.PosView(),
        settings: data,
      );
    },
    _i11.PosPeopleView: (data) {
      return _i18.MaterialPageRoute<dynamic>(
        builder: (context) => const _i11.PosPeopleView(),
        settings: data,
      );
    },
    _i12.PosDeliveryView: (data) {
      return _i18.MaterialPageRoute<dynamic>(
        builder: (context) => const _i12.PosDeliveryView(),
        settings: data,
      );
    },
    _i13.PosTransactionView: (data) {
      return _i18.MaterialPageRoute<dynamic>(
        builder: (context) => const _i13.PosTransactionView(),
        settings: data,
      );
    },
    _i14.PosFuelView: (data) {
      return _i18.MaterialPageRoute<dynamic>(
        builder: (context) => const _i14.PosFuelView(),
        settings: data,
      );
    },
    _i15.UserOrderView: (data) {
      return _i18.MaterialPageRoute<dynamic>(
        builder: (context) => const _i15.UserOrderView(),
        settings: data,
      );
    },
    _i16.FuelOrderView: (data) {
      return _i18.MaterialPageRoute<dynamic>(
        builder: (context) => const _i16.FuelOrderView(),
        settings: data,
      );
    },
    _i17.TransactionOrderView: (data) {
      return _i18.MaterialPageRoute<dynamic>(
        builder: (context) => const _i17.TransactionOrderView(),
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

  final _i18.Key? key;

  final _i19.Fuel fuel;

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

  final _i18.Key? key;

  final String nameFuel;

  final String numberOktan;

  final _i20.Order? dataOrder;

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

class MainViewArguments {
  const MainViewArguments({
    this.key,
    required this.admin,
  });

  final _i18.Key? key;

  final String admin;

  @override
  String toString() {
    return '{"key": "$key", "admin": "$admin"}';
  }

  @override
  bool operator ==(covariant MainViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.admin == admin;
  }

  @override
  int get hashCode {
    return key.hashCode ^ admin.hashCode;
  }
}

extension NavigatorStateExtension on _i21.NavigationService {
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
    _i18.Key? key,
    required _i19.Fuel fuel,
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
    _i18.Key? key,
    required String nameFuel,
    required String numberOktan,
    required _i20.Order? dataOrder,
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

  Future<dynamic> navigateToMainView({
    _i18.Key? key,
    required String admin,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.mainView,
        arguments: MainViewArguments(key: key, admin: admin),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToCartView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.cartView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToPosView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.posView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToPosPeopleView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.posPeopleView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToPosDeliveryView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.posDeliveryView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToPosTransactionView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.posTransactionView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToPosFuelView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.posFuelView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToUserOrderView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.userOrderView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToFuelOrderView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.fuelOrderView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToTransactionOrderView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.transactionOrderView,
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
    _i18.Key? key,
    required _i19.Fuel fuel,
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
    _i18.Key? key,
    required String nameFuel,
    required String numberOktan,
    required _i20.Order? dataOrder,
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

  Future<dynamic> replaceWithMainView({
    _i18.Key? key,
    required String admin,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.mainView,
        arguments: MainViewArguments(key: key, admin: admin),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithCartView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.cartView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithPosView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.posView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithPosPeopleView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.posPeopleView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithPosDeliveryView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.posDeliveryView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithPosTransactionView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.posTransactionView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithPosFuelView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.posFuelView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithUserOrderView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.userOrderView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithFuelOrderView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.fuelOrderView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithTransactionOrderView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.transactionOrderView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }
}
