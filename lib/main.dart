import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment_app/bloc_observer.dart';
import 'package:payment_app/core/constants/styles/color_app.dart';
import 'package:payment_app/core/cubit/payment_cubit/cubit.dart';
import 'package:payment_app/core/cubit/payment_cubit/states.dart';
import 'package:payment_app/data/network/dio_helper.dart';
import 'package:payment_app/view/screens/auth/register_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DioHelper.init();
  BlocOverrides.runZoned(
    () {},
    blocObserver: MyBlocObserver(),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: deepPurple),
        useMaterial3: true,
      ),
      home: RegisterScreen(),
    );
  }
}
