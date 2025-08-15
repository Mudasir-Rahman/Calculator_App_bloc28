// // lib/main.dart
import 'package:calculator_app/core/function/expression.dart';
import 'package:calculator_app/features/presentation/bloc/calculator_bloc.dart';
import 'package:calculator_app/features/presentation/home_ui/my_home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (_) => CalculatorBloc(calculatorEvaluation),
        child: const MyHomeScreen(),
      ),
    );
  }
}
