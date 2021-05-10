part of 'internet_cubit.dart';

@immutable
abstract class InternetState extends Equatable {}

class InternetLoading extends InternetState {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class InternetConnected extends InternetState {
  final ConnectionType connectionType;
  InternetConnected({@required this.connectionType});

  @override
  // TODO: implement props
  List<Object> get props => [this.connectionType];

  @override
  // TODO: implement stringify
  bool get stringify => true;
}

class InternetDisconnected extends InternetState {
  @override
  // TODO: implement props
  List<Object> get props => [];
}
