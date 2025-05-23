import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'src/shared/blocs/auth/auth_bloc.dart';
import 'src/config/router/app_router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final authBloc = AuthBloc();

    return BlocProvider(
      create: (_) => authBloc,
      child: Sizer(
        builder: (context, orientation, deviceType) {
          return MaterialApp.router(
            title: 'Cofiex',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              scaffoldBackgroundColor: Colors.white,
              // Configuración responsiva para web
              useMaterial3: true,
              // Ajustar el tamaño de fuente base según el dispositivo
              textTheme: Theme.of(context).textTheme.apply(
                fontSizeFactor: deviceType == DeviceType.web ? 1.2 : 1.0,
              ),
            ),
            builder: (context, child) {
              // Ajustar el padding máximo para pantallas grandes
              return MediaQuery(
                data: MediaQuery.of(context).copyWith(
                  textScaleFactor: deviceType == DeviceType.web ? 1.2 : 1.0,
                ),
                child: child!,
              );
            },
            routerConfig: AppRouter.router(authBloc),
          );
        },
      ),
    );
  }
}
