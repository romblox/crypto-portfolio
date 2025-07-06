part of 'portfolio_bloc.dart';

abstract class PortfolioEvent extends Equatable {}

class LoadPortfolio extends PortfolioEvent {
  LoadPortfolio({required this.completer});

  final Completer? completer;

  @override
  List<Object?> get props => [completer];
}
