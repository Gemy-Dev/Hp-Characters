import 'package:characters_view/config/routing.dart';
import 'package:characters_view/features/cahracters/presentation/blocs/characters_cubit/charcters.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/utils/bloc_observer.dart';
import 'injection.dart'as di;

void main()async {
  await di.init();
    Bloc.observer = MyBlocObserver();

  runApp(BlocProvider(
    create: (context) =>di.sl<CharactersCubit>(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hp Characters',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      onGenerateRoute: AppRoute.onGenerateRoute,
    );
  }
}
