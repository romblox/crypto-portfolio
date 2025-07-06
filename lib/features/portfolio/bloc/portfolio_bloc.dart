import 'package:flutter_bloc/flutter_bloc.dart';

part 'portfolio_event.dart';
part "portfolio_state.dart";

class PortfolioBloc extends Bloc<PortfolioEvent, PortfolioState> {
  PortfolioBloc() : super(PortfolioInitial()) {
    on<LoadPortfolio>((event, emit) {
      print('[Portfoli on BLOC triggered on LoadPortfolio event..');
    });
  }
}
