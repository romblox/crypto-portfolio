part of 'portfolio_bloc.dart';

class PortfolioState {}

class PortfolioInitial extends PortfolioState {}

class PortfolioLoading extends PortfolioState {}

class PortfolioLoaded extends PortfolioState {
  final List<CryptoCoin> coinsList;

  PortfolioLoaded({required this.coinsList});
}

class PortfolioLoadingFailure extends PortfolioState {
  PortfolioLoadingFailure({required this.exception});

  final Object? exception;
}
