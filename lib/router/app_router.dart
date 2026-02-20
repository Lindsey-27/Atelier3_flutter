import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../pages/accueil.dart';
import '../pages/liste.dart';
import '../pages/auth.dart';
import '../menu.dart';
import '../providers/auth_provider.dart';

GoRouter appRouter(AuthProvider authProvider){
  return GoRouter(
    initialLocation: '/',
    refreshListenable: authProvider,
    routes: [
      ShellRoute(
        builder: (context, state, child){
          return MenuPage(child: child);
        },
        routes: [
          GoRoute(
            path: '/',
            builder: (context, state) => const AccueilPage(),
          ),
          GoRoute(
            path: '/liste',
            builder: (context, state) => const ListePage(),
            redirect: (context, state){
              if(!authProvider.isLoggedIn) return  '/auth';
              return null;
            },
          ),
          GoRoute(
            path: '/auth',
            builder: (context, state) => const AuthPage(),
          ),
        ],
      ),
    ],
    );
  }

