import 'package:flutter/material.dart';
import 'package:pipv3/app/modules/auth_module/repositories/auth_login_repository.dart';
import 'package:pipv3/app/modules/auth_module/stores/auth_login_store.dart';
import 'package:pipv3/app/modules/auth_module/views/auth_home_page.dart';
import 'package:pipv3/app/modules/auth_module/views/auth_signin_page.dart';
import 'package:pipv3/app/modules/anuncio_module/views/cad_anuncio_main_page.dart';
import 'package:pipv3/app/services/shared_preference_service.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'modules/anuncio_module/repositories/address_repository.dart';
import 'modules/anuncio_module/stores/anuncio_store.dart';
import 'modules/auth_module/views/auth_signup_page.dart';

class AppWidget extends StatefulWidget {
  @override
  _AppWidgetState createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {

  bool checkRefreshToken;
  
  final localizations = [
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
  ];

  final locales = [const Locale('pt', 'BR')];

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthLoginStore>(
          create: (_) =>
              AuthLoginStore(AuthLoginRepository(), SharedPreferenceService()),
        ),
        Provider<AnuncioStore>(
          create: (_) =>
              AnuncioStore(AddressRepository()),
        ),
      ],
      child: MaterialApp(
        localizationsDelegates: localizations,
        supportedLocales: locales,
        title: 'PIP',
        //routes: routesApp,
        routes: {
          '/': (context) => CadAnuncioMain(),
          //'/': (context) => AuthHomePage(),
          '/signin': (context) => AuthSignin(),
          '/signup': (context) => AuthSignup(),
        },
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
