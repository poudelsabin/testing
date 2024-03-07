import 'package:event_buddy/network/locator.dart';
import 'package:event_buddy/presentation/login/cubit/login_cubit.dart';
import 'package:event_buddy/presentation/login/login_page.dart';
import 'package:event_buddy/presentation/profile/cubit/profile_cubit.dart';
import 'package:event_buddy/presentation/register/cubit/register_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  initLocator();
  runApp(const MyApp());
}

final _navigatorKey = GlobalKey<NavigatorState>();
NavigatorState get navigator => _navigatorKey.currentState!;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginCubit>(create: (_) => LoginCubit()),
        BlocProvider<RegisterCubit>(create: (_) => RegisterCubit()),
        BlocProvider<ProfileCubit>(create: (_) => ProfileCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Event Buddy',
        navigatorKey: _navigatorKey,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const LoginWidget(),
      ),
    );
  }
}
