import 'package:flutter/material.dart';
import 'package:my_pertamini/src/app/app.locator.dart';
import 'package:my_pertamini/src/app/app.router.dart';
import 'package:my_pertamini/src/helpers/injector/injector.dart';
import 'package:my_pertamini/src/iu/shared/colors.dart';
import 'package:my_pertamini/src/iu/views/cart/cart_view.dart';
import 'package:my_pertamini/src/iu/views/login/login_view.dart';
import 'package:my_pertamini/src/iu/views/main/main_view.dart';
import 'package:my_pertamini/src/iu/views/profile/profile_view.dart';
import 'package:my_pertamini/src/iu/views/register/regis_view.dart';
import 'package:stacked_services/stacked_services.dart';
import 'src/helpers/setup_snackbar_ui.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupInjector();
  setupLocator();
  setupSnackbarUi();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Pertamini',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: BaseColors.primaryBlue),
        useMaterial3: true,
      ),
      // home: const LandingView(),
      routes: {
        LoginView.routeName: (context) => const LoginView(),
        MainView.routeName: (context) => const MainView(),
        CartView.routeName: (context) => const CartView(),
        RegisView.routeName: (context) => const RegisView(),
        ProfileView.routeName: (context) => const ProfileView(),
      },
      navigatorKey: StackedService.navigatorKey,
      onGenerateRoute: StackedRouter().onGenerateRoute,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
