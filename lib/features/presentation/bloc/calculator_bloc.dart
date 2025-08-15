// import 'package:bloc/bloc.dart';
// import 'package:calculator_app/features/presentation/bloc/calculator_event.dart';
// import 'package:calculator_app/features/presentation/bloc/calculator_state.dart';

// class CalculatorBloc extends Bloc<CalculatorEvent, CalculatorState> {
//   // Correctly type the function so it must take a String and return a double
//   final double Function(String) calculatorExpression;

//   CalculatorBloc(this.calculatorExpression) : super(const CalculatorState()) {
//     // When user presses a value
//     on<UserPressedValueEvent>((event, emit) {
//       emit(state.copyWith(expression: state.expression + event.value));
//     });

//     // When expression is evaluated
//     on<CalculatorExpressionEvent>((event, emit) {
//       final res = calculatorExpression(state.expression);
//       emit(state.copyWith(result: res.toString())); // Convert double to String for UI
//     });

//     // When calculator is cleared
//     on<CalculatorClearEvent>((event, emit) {
//       emit(const CalculatorState());
//     });
//   }
// }
// lib/features/presentation/bloc/calculator_bloc.dart
import 'package:bloc/bloc.dart';
import 'package:calculator_app/features/presentation/bloc/calculator_event.dart';
import 'package:calculator_app/features/presentation/bloc/calculator_state.dart';

class CalculatorBloc extends Bloc<CalculatorEvent, CalculatorState> {
  /// Function to evaluate an expression
  final double Function(String) calculatorExpression;

  CalculatorBloc(this.calculatorExpression) : super(const CalculatorState()) {
    // Append user input
    on<UserPressedValueEvent>((event, emit) {
      emit(state.copyWith(expression: state.expression + event.value));
    });

    // Evaluate expression
    on<CalculatorExpressionEvent>((event, emit) {
      final resultValue = calculatorExpression(state.expression);
      emit(state.copyWith(result: resultValue.toString()));
    });

    // Clear everything
    on<CalculatorClearEvent>((event, emit) {
      emit(const CalculatorState());
    });
  }
}
