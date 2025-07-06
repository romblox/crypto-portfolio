import 'dart:async';

import 'package:coinlist/repositories/crypto_api/api_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'portfolio_event.dart';
part "portfolio_state.dart";

class PortfolioBloc extends Bloc<PortfolioEvent, PortfolioState> {
  final AbstractApiRepository apiRepository;

  PortfolioBloc(this.apiRepository) : super(PortfolioInitial()) {
    on<LoadPortfolio>((event, emit) async {
      try {
        if (state is! PortfolioLoaded) {
          emit(PortfolioLoading());
        }
        
        final coinsList = await apiRepository.getCoinsList();
        emit(PortfolioLoaded(coinsList: coinsList));
      } catch (e) {
        emit(PortfolioLoadingFailure(exception: e));
      } finally {
        event.completer?.complete();
      }
    });
  }
}
