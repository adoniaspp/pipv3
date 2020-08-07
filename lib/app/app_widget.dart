import 'package:flutter/material.dart';
import 'package:pipv3/app/modules/auth_module/repositories/auth_login_repository.dart';
import 'package:pipv3/app/modules/auth_module/stores/auth_login_store.dart';
import 'package:pipv3/app/modules/auth_module/views/auth_home_page.dart';
import 'package:pipv3/app/modules/auth_module/views/auth_login_page.dart';
import 'package:pipv3/app/services/shared_preference_service.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class AppWidget extends StatefulWidget {
  @override
  _AppWidgetState createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {

  bool checkRefreshToken;

  @override
  void initState() {
    AuthLoginStore.start(SharedPreferenceService()).getRefreshToken().then((value) => {
      print(value)
    });
    super.initState();
  }
  
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
      ],
      child: MaterialApp(
        localizationsDelegates: localizations,
        supportedLocales: locales,
        title: 'PIP',
        //routes: routesApp,
        routes: {
          '/': (context) => AuthHomePage(),
          '/login': (context) => AuthLogin(),
          //'/login': (context) => Login(),
        },
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
