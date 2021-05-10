part of 'counter_cubit.dart';

class CounterState extends Equatable {
  int counterValue;
  bool wasIncremented;

  CounterState({@required this.counterValue, this.wasIncremented = true});

  @override
  // TODO: implement props
  List<Object> get props => [this.counterValue, this.wasIncremented];
}
