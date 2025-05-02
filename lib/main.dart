import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snipscholar/core/bloc/auth/auth_bloc.dart';
import 'package:snipscholar/core/bloc/visibility/visibility_bloc.dart';
import 'package:snipscholar/firebase_options.dart';
import 'core/Config/route/route_names.dart';
import 'core/Config/route/routes.dart';
import 'core/bloc/snippetCard/snippet_card_bloc.dart';
import 'core/repositories/authRepo/auth_repository.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthRepository authRepo = AuthRepository();
    final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthBloc(authRepository: authRepo)),
        BlocProvider(create: (context) => VisibilityBloc()),
        BlocProvider<SnippetBloc>(create: (_) => SnippetBloc()),
      ],
      child: BlocListener<AuthBloc, AuthState>(
        listenWhen: (previous, current) =>
        previous.authState != current.authState && current.authState == true,
        listener: (context, state) {
          navigatorKey.currentState!.pushReplacementNamed(
            RouteNames.landingScreen,
          );
        },
        child: MaterialApp(
          navigatorKey: navigatorKey,
          debugShowCheckedModeBanner: false,
          title: 'SnipScholar',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          initialRoute: RouteNames.splashScreen,
          onGenerateRoute: Routes.onGenerateRoute,
        ),
      ),
    );
  }
}

