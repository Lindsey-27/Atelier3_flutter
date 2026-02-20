import 'package:exercice_flutter/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'l10n/app_localizations.dart';
import 'router/app_router.dart';
import 'providers/cart_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider( create: (_) => CartProvider()),
          ChangeNotifierProvider(create: (_) => AuthProvider())
        ],
        child: Builder(
          builder: (context){
            final authProvider = context.watch<AuthProvider>();
            return MaterialApp.router(
              routerConfig: appRouter(authProvider),
              localizationsDelegates: const[
                AppLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: const[
                Locale('fr'),
                Locale('en'),
              ],
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                useMaterial3: true,
              ),
            );
          },
        )
    );
  }
}
