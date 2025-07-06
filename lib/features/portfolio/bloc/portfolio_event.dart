part of 'portfolio_bloc.dart';

class PortfolioEvent {}

class LoadPortfolio extends PortfolioEvent {
  LoadPortfolio({required this.completer});

  final Completer? completer;
}
