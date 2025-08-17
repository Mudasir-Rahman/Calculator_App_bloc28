
import 'package:equatable/equatable.dart';

class CalculatorState extends Equatable {
  final String result;
  final String expression;

  const CalculatorState({this.result = '', this.expression = ''});

  CalculatorState copyWith({String? result, String? expression}) {
    return CalculatorState(
      result: result ?? this.result,
      expression: expression ?? this.expression,
    );
  }

  @override
  List<Object?> get props => [result, expression];
}
