import 'dart:async';
import 'package:cofiex/src/modules/auth/screens/login.dart';
import 'package:cofiex/src/modules/auth/screens/recovery_password/recovery_new_password/recovery_new_password.dart';
import 'package:cofiex/src/modules/auth/screens/recovery_password/recovery_password/recovery_password.dart';
import 'package:cofiex/src/modules/auth/screens/recovery_password/recovery_set_code/recovery_set_code.dart';
import 'package:cofiex/src/modules/base/base.dart';
import 'package:cofiex/src/modules/company/company.dart';
import 'package:cofiex/src/modules/notification/notification.dart';
import 'package:cofiex/src/modules/request/request.dart';
import 'package:cofiex/src/modules/upload_doc/upload_doc_.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:cofiex/src/shared/blocs/auth/auth_bloc.dart';

class AppRouter {
  static GoRouter router(AuthBloc authBloc) {
    return GoRouter(
      initialLocation: '/',
      refreshListenable: GoRouterRefreshStream(authBloc.stream),
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => const Login(),
        ),
        GoRoute(
          path: '/recovery_password',
          builder: (context, state) => const RecoveryPassword(),
          routes: [
            GoRoute(
              path: 'set-code',
              builder: (context, state) => const RecoverySetCode(),
            ),
            GoRoute(
              path: 'new-password',
              builder: (context, state) => const RecoveryNewPassword(),
            ),
          ],
        ),
        // GoRoute(
        //   path: '/login',
        //   builder: (context, state) => const LoginScreen(),
        // ),
        // GoRoute(
        //   path: '/register',
        //   builder: (context, state) => const RegisterScreen(),
        // ),
        GoRoute(
          path: '/home',
          builder: (context, state) => const BaseScreen(),
        ),
        GoRoute(
          path: '/upload-doc',
          builder: (context, state) => const UploadDocScreen(),
        ),
        GoRoute(
          path: '/request',
          builder: (context, state) => const RequestScreen(),
        ),
        GoRoute(
          path: '/notification',
          builder: (context, state) => const NotificationScreen(),
        ),
        GoRoute(
          path: '/company',
          builder: (context, state) => const CompanyScreen(),
        ),
        // GoRoute(
        //   path: '/base',
        //   builder: (context, state) => const BaseScreen(),
        // ),
        // GoRoute(
        //   path: '/recovery_password',
        //   builder: (context, state) => const RecoveryPasswordScreen(),
        // ),
        // GoRoute(
        //   path: '/recovery_password/go-email',
        //   builder: (context, state) => const RecoveryPasswordEmailScreen(),
        // ),
        // GoRoute(
        //   path: '/recovery_password/new-password',
        //   builder: (context, state) => const NewPasswordScreen(),
        // ),
        // GoRoute(
        //   path: '/recovery_password/success',
        //   builder: (context, state) => const RecoveryPasswordSuccessScreen(),
        // ),
        // GoRoute(
        //   path: '/password/reset/:token',
        //   builder: (context, state) => ResetPasswordScreen(
        //     token: state.pathParameters['token']!,
        //   ),
        // ),
      ],
      redirect: (context, state) {
        final isGoingTo = state.uri.path;
        final authStatus = authBloc.state.status;
        debugPrint('isGoingTo: $isGoingTo');
        if (authStatus == AuthStatus.notAuthenticated) {
          if (
            isGoingTo == '/login' || 
            isGoingTo == '/reset' || 
            isGoingTo == '/register' || 
            isGoingTo == '/company' ||
            isGoingTo == '/home' || 
            isGoingTo == '/notification' ||
            isGoingTo == '/upload-doc' ||
            isGoingTo == '/request' ||
            isGoingTo == '/recovery_password' || 
            isGoingTo.contains('/recovery_password') || 
            isGoingTo == '/recovery_password/go-email' || 
            isGoingTo == '/recovery_password/new-password' || 
            isGoingTo == '/recovery_password/success' || 
            isGoingTo == '/'
          ) {
            return null;
          }
          return '/home';
        }

        if (authStatus == AuthStatus.authenticated) {
          if (
            isGoingTo == '/login' || 
            isGoingTo == '/register' ||
            isGoingTo == '/home' 
          ) {
            return '/base';
          }
          return null;
        }
        
        return null;
      },
    );
  }
}

class GoRouterRefreshStream extends ChangeNotifier {
  GoRouterRefreshStream(Stream<dynamic> stream) {
    notifyListeners();
    _subscription = stream.asBroadcastStream().listen(
      (dynamic _) => notifyListeners(),
    );
  }

  late final StreamSubscription<dynamic> _subscription;

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
} 