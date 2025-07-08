part of 'details_bloc.dart';

class DetailsEvent extends Equatable {
  // const DetailsEvent();

  @override
  List<Object> get props => [];
}

class LoadDetails extends DetailsEvent {
  final String coinCode;

  LoadDetails({required this.coinCode});

  @override
  List<Object> get props => super.props..add(coinCode);
  // List<Object> get props => [coinCode];
}
