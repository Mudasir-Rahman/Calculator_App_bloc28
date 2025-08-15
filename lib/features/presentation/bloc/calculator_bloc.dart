import 'package:bloc/bloc.dart';
import 'package:calculator_app/features/presentation/bloc/calculator_event.dart';
import 'package:calculator_app/features/presentation/bloc/calculator_state.dart';

class CalculatorBloc extends Bloc<CalculatorEvent, CalculatorState> {
  final Function caclculatorExperation;

  CalculatorBloc(this.caclculatorExperation) : super(const CalculatorState()) {
    // When user presses a value
    on<UserPressedValueEvent>((event, emit) {
      emit(state.copyWith(expression: state.expression + event.value));
    });

    // When expression is evaluated
    on<CalculatorExpressionEvent>((event, emit) {
      final res = caclculatorExperation(state.expression);
      emit(state.copyWith(result: res.toString()));
    });

    // When calculator is cleared
    on<CalculatorClearEvent>((event, emit) {
      emit(const CalculatorState());
    });
  }
}
