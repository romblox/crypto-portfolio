import 'dart:developer';

import 'package:coinlist/repositories/crypto_api/api_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'details_event.dart';
part 'details_state.dart';


class DetailsBloc extends Bloc<DetailsEvent, DetailsState> {
  final AbstractApiRepository apiRepository;


  DetailsBloc(this.apiRepository) : super(DetailsInitial()) {
    on<LoadDetails>((event, emit) async {
      try {
        final coinDetails = await apiRepository.getCoinDetails(event.coinCode);
        log(coinDetails.toString());
        emit(DetailsLoaded(coinDetails: coinDetails));

      } catch (e) {
        emit(DetailsLoadingFailure(exception: e));
      }

    });
  }
}
