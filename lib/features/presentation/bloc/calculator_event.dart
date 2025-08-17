
import 'package:equatable/equatable.dart';

abstract class CalculatorEvent extends Equatable {
  const CalculatorEvent();
  @override
  List<Object?> get props => [];
}

class UserPressedValueEvent extends CalculatorEvent {
  final String value;
  const UserPressedValueEvent(this.value);

  @override
  List<Object?> get props => [value];
}

class CalculatorExpressionEvent extends CalculatorEvent {
  const CalculatorExpressionEvent();
}

class CalculatorClearEvent extends CalculatorEvent {
  const CalculatorClearEvent();
}
