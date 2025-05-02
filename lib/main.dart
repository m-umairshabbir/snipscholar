import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snipscholar/core/bloc/auth/auth_bloc.dart';
import 'package:snipscholar/core/bloc/visibility/visibility_bloc.dart';
import 'core/Config/route/route_names.dart';
import 'core/Config/route/routes.dart';
import 'core/repositories/authRepo/auth_repository.dart';

void main()async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    final AuthRepository authRepo=AuthRepository();
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=>AuthBloc(authRepository: authRepo)),
        BlocProvider(create: (context)=>VisibilityBloc()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'SnipScholar',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        initialRoute: RouteNames.splashScreen,
        onGenerateRoute: Routes.onGenerateRoute,
      ),
    );
  }
}

