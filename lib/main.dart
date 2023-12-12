import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_news/injection_container.dart';
import 'package:flutter_news/src/app.dart';
import 'package:flutter_news/src/features/presentation/bloc/category_cubit.dart';
import 'package:flutter_news/src/features/presentation/bloc/news_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((value) => runApp(const MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(create: (context) => locator<NewsCubit>()),
      BlocProvider(create: (context) => locator<CategoryCubit>())
    ], child: const MyApp());
  }
}
