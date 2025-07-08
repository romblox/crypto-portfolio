part of 'details_bloc.dart';

class DetailsState extends Equatable {
  @override
  List<Object?> get props => [];
}

class DetailsInitial extends DetailsState {}

class DetailsLoading extends DetailsState {}

class DetailsLoaded extends DetailsState {
  final CryptoCoinDetails coinDetails;

  DetailsLoaded(this.coinDetails);

  @override
  List<Object?> get props => super.props..add(coinDetails);
}

class DetailsLoadingFailure extends DetailsState {
  final Object exception;

  DetailsLoadingFailure(this.exception);

  @override
  List<Object?> get props => super.props..add(exception);
}
