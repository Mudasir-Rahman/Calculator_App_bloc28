import 'package:calculator_app/core/constant/button/buttons.dart';
import 'package:calculator_app/core/constant/color.dart';
import 'package:calculator_app/features/presentation/bloc/calculator_bloc.dart';
import 'package:calculator_app/features/presentation/bloc/calculator_event.dart';
import 'package:calculator_app/features/presentation/bloc/calculator_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyHomeScreen extends StatefulWidget {
  const MyHomeScreen({super.key});

  @override
  State<MyHomeScreen> createState() => _MyHomeScreenState();
}

class _MyHomeScreenState extends State<MyHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.appColor,
      body: Column(
        children: [
          Expanded(
            child: BlocBuilder<CalculatorBloc, CalculatorState>(
              builder: (context, state) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      state.expression,
                      style: const TextStyle(color: Colors.white, fontSize: 28),
                    ),
                    Text(
                      state.result,
                      style: const TextStyle(color: Colors.white, fontSize: 38),
                    ),
                  ],
                );
              },
            ),
          ),

          Column(
            children: [
              Row(
                children: [
                  CalculatorButton(
                    label: '7',
                    onTap: () => context.read<CalculatorBloc>().add(
                      UserPressedValueEvent('7'),
                    ),
                    color: Colors.grey,
                    textColor: Colors.white,
                  ),
                  CalculatorButton(
                    label: '8',
                    onTap: () => context.read<CalculatorBloc>().add(
                      UserPressedValueEvent('8'),
                    ),
                    color: Colors.grey,
                    textColor: Colors.white,
                  ),
                  CalculatorButton(
                    label: '9',
                    onTap: () => context.read<CalculatorBloc>().add(
                      UserPressedValueEvent('9'),
                    ),
                    color: Colors.grey,
                    textColor: Colors.white,
                  ),
                  CalculatorButton(
                    label: '÷',
                    onTap: () => context.read<CalculatorBloc>().add(
                      UserPressedValueEvent('/'),
                    ),
                    color: Colors.orange,
                    textColor: Colors.white,
                  ),
                ],
              ),
              Row(
                children: [
                  CalculatorButton(
                    label: '4',
                    onTap: () => context.read<CalculatorBloc>().add(
                      UserPressedValueEvent('4'),
                    ),
                    color: Colors.grey,
                    textColor: Colors.white,
                  ),
                  CalculatorButton(
                    label: '5',
                    onTap: () => context.read<CalculatorBloc>().add(
                      UserPressedValueEvent('5'),
                    ),
                    color: Colors.grey,
                    textColor: Colors.white,
                  ),
                  CalculatorButton(
                    label: '6',
                    onTap: () => context.read<CalculatorBloc>().add(
                      UserPressedValueEvent('6'),
                    ),
                    color: Colors.grey,
                    textColor: Colors.white,
                  ),
                  CalculatorButton(
                    label: '×',
                    onTap: () => context.read<CalculatorBloc>().add(
                      UserPressedValueEvent('*'),
                    ),
                    color: Colors.orange,
                    textColor: Colors.white,
                  ),
                ],
              ),
              Row(
                children: [
                  CalculatorButton(
                    label: '1',
                    onTap: () => context.read<CalculatorBloc>().add(
                      UserPressedValueEvent('1'),
                    ),
                    color: Colors.grey,
                    textColor: Colors.white,
                  ),
                  CalculatorButton(
                    label: '2',
                    onTap: () => context.read<CalculatorBloc>().add(
                      UserPressedValueEvent('2'),
                    ),
                    color: Colors.grey,
                    textColor: Colors.white,
                  ),
                  CalculatorButton(
                    label: '3',
                    onTap: () => context.read<CalculatorBloc>().add(
                      UserPressedValueEvent('3'),
                    ),
                    color: Colors.grey,
                    textColor: Colors.white,
                  ),
                  CalculatorButton(
                    label: '-',
                    onTap: () => context.read<CalculatorBloc>().add(
                      UserPressedValueEvent('-'),
                    ),
                    color: Colors.orange,
                    textColor: Colors.white,
                  ),
                ],
              ),
              Row(
                children: [
                  CalculatorButton(
                    label: 'C',
                    onTap: () => context.read<CalculatorBloc>().add(
                      CalculatorClearEvent(),
                    ),
                    color: Colors.red,
                    textColor: Colors.white,
                  ),
                  CalculatorButton(
                    label: '0',
                    onTap: () => context.read<CalculatorBloc>().add(
                      UserPressedValueEvent('0'),
                    ),
                    color: Colors.grey,
                    textColor: Colors.white,
                  ),
                  CalculatorButton(
                    label: '=',
                    onTap: () => context.read<CalculatorBloc>().add(
                      CalculatorExpressionEvent(),
                    ),
                    color: Colors.green,
                    textColor: Colors.white,
                  ),
                  CalculatorButton(
                    label: '+',
                    onTap: () => context.read<CalculatorBloc>().add(
                      UserPressedValueEvent('+'),
                    ),
                    color: Colors.orange,
                    textColor: Colors.white,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
