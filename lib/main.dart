import 'package:ader/application/bussiness_logic/cubit/initial_cubit.dart';
import 'package:ader/application/presentation/routes/routes.dart';
import 'package:ader/application/presentation/routes/routes_generator.dart';
import 'package:ader/data/config/config_injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureInjection();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<InitialCubit>(),
        ),
      ],
      child: MaterialApp(
        title: 'Ader',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        initialRoute: Routes.initial,
        onGenerateRoute: RoutesGenerator.onRouteGenerator,
      ),
    );
  }
}
