import 'package:bloc_test/bloc_test.dart';
import 'package:counter_bloc/bloc/counter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late CounterBloc bloc;

  setUp(() {
    bloc = CounterBloc();
  });

  group('CounterBloc', () {
    blocTest<CounterBloc, CounterState>(
      'Should emit IncrementState(1), when calls IncrementEvent',    
      build: () => bloc,
      act: (bloc) => bloc.add(const IncrementEvent()),
      expect: () => [
        const IncrementState(counter: 1),
      ],
    );

    blocTest<CounterBloc, CounterState>(
      'shoukd emits DecrementState(-1) when called event DecrementCounter',
      build: () => bloc,
      act: (bloc) => bloc.add(const DecrementEvent()),
      expect: () => const <CounterState>[DecrementState(counter: -1)],
    );
  });
}
