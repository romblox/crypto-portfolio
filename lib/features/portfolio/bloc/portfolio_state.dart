part of 'portfolio_bloc.dart';

abstract class PortfolioState extends Equatable {}

class PortfolioInitial extends PortfolioState {
  @override
  List<Object?> get props => [];
}

class PortfolioLoading extends PortfolioState {
  @override
  List<Object?> get props => [];
}

class PortfolioLoaded extends PortfolioState {
  PortfolioLoaded({required this.coinsList});

  final List<CryptoCoin> coinsList;

  @override
  List<Object?> get props => [coinsList];
}

class PortfolioLoadingFailure extends PortfolioState {
  PortfolioLoadingFailure({required this.exception});

  final Object? exception;

  @override
  List<Object?> get props => [exception];
}
