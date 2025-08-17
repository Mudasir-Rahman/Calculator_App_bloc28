
import 'package:calculator_app/core/constant/button/buttons.dart';
import 'package:calculator_app/core/constant/color.dart';
import 'package:calculator_app/features/presentation/bloc/calculator_bloc.dart';
import 'package:calculator_app/features/presentation/bloc/calculator_event.dart';
import 'package:calculator_app/features/presentation/bloc/calculator_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyHomeScreen extends StatelessWidget {
  const MyHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.appColor,
      body: Column(
        children: [
          Expanded(
            child: BlocBuilder<CalculatorBloc, CalculatorState>(
              builder: (context, state) {
                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        state.expression,
                        style: const TextStyle(color: Colors.white, fontSize: 28),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        state.result,
                        style: const TextStyle(color: Colors.white, fontSize: 38),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          _buildButtons(context),
        ],
      ),
    );
  }

  Widget _buildButtons(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            CalculatorButton(label: '7', onTap: () => _input(context, '7'), color: Colors.grey, textColor: Colors.white),
            CalculatorButton(label: '8', onTap: () => _input(context, '8'), color: Colors.grey, textColor: Colors.white),
            CalculatorButton(label: '9', onTap: () => _input(context, '9'), color: Colors.grey, textColor: Colors.white),
            CalculatorButton(label: '÷', onTap: () => _input(context, '÷'), color: Colors.orange, textColor: Colors.white),
          ],
        ),
        Row(
          children: [
            CalculatorButton(label: '4', onTap: () => _input(context, '4'), color: Colors.grey, textColor: Colors.white),
            CalculatorButton(label: '5', onTap: () => _input(context, '5'), color: Colors.grey, textColor: Colors.white),
            CalculatorButton(label: '6', onTap: () => _input(context, '6'), color: Colors.grey, textColor: Colors.white),
            CalculatorButton(label: '×', onTap: () => _input(context, '×'), color: Colors.orange, textColor: Colors.white),
          ],
        ),
        Row(
          children: [
            CalculatorButton(label: '1', onTap: () => _input(context, '1'), color: Colors.grey, textColor: Colors.white),
            CalculatorButton(label: '2', onTap: () => _input(context, '2'), color: Colors.grey, textColor: Colors.white),
            CalculatorButton(label: '3', onTap: () => _input(context, '3'), color: Colors.grey, textColor: Colors.white),
            CalculatorButton(label: '-', onTap: () => _input(context, '-'), color: Colors.orange, textColor: Colors.white),
          ],
        ),
        Row(
          children: [
            CalculatorButton(label: 'C', onTap: () => _clear(context), color: Colors.red, textColor: Colors.white),
            CalculatorButton(label: '0', onTap: () => _input(context, '0'), color: Colors.grey, textColor: Colors.white),
            CalculatorButton(label: '=', onTap: () => _evaluate(context), color: Colors.green, textColor: Colors.white),
            CalculatorButton(label: '+', onTap: () => _input(context, '+'), color: Colors.orange, textColor: Colors.white),
          ],
        ),
      ],
    );
  }

  void _input(BuildContext context, String value) {
    context.read<CalculatorBloc>().add(UserPressedValueEvent(value));
  }

  void _evaluate(BuildContext context) {
    context.read<CalculatorBloc>().add(const CalculatorExpressionEvent());
  }

  void _clear(BuildContext context) {
    context.read<CalculatorBloc>().add(const CalculatorClearEvent());
  }
}
