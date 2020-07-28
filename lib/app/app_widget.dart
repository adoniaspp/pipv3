import 'package:flutter/material.dart';
import 'package:pipv3/app/modules/auth_module/repositories/auth_login_repositorie.dart';
import 'package:pipv3/app/modules/auth_module/stores/auth_login_store.dart';
import 'package:pipv3/app/modules/auth_module/views/auth_home_page.dart';
import 'package:pipv3/app/modules/auth_module/views/auth_login_page.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class AppWidget extends StatelessWidget {
  final localizations = [
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
  ];
  final locales = [const Locale('pt', 'BR')];
  final routesApp = {
    '/': (context) => AuthHomePage(),
    '/login': (context) => AuthLogin(),
    //'/login': (context) => Login(),
  };

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthLoginStore>(
          create: (_) => AuthLoginStore(AuthLoginRepository()),
        ),
      ],
      child: 
      MaterialApp(
        localizationsDelegates: localizations,
        supportedLocales: locales,
        title: 'PIP',
        routes: routesApp,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
