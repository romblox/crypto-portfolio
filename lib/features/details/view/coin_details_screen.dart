// import 'dart:developer';

import 'package:coinlist/features/details/bloc/details_bloc.dart';
import 'package:coinlist/features/details/details.dart';
import 'package:coinlist/repositories/crypto_api/api_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class CoinDetailsScreen extends StatefulWidget {
  const CoinDetailsScreen({super.key});

  @override
  State<CoinDetailsScreen> createState() => _CoinDetailsScreenState();
}

class _CoinDetailsScreenState extends State<CoinDetailsScreen> {
  CryptoCoin? coin;

  final _detailsBloc = DetailsBloc(GetIt.I<AbstractApiRepository>());

  @override
  void didChangeDependencies() {
    final args = ModalRoute.of(context)?.settings.arguments;
    assert(
      args != null && args is CryptoCoin,
      'You must provide String to arguments in onTap routes',
    );

    // if (args == null) {
    //   log('You must provide args in route to CoinDetailsScreen');
    //   return;
    // }

    // if (args is! String) {
    //   log('YYou must provide args in route to CoinDetailsScreen as String');
    //   return;
    // }

    coin = args as CryptoCoin;
    _detailsBloc.add(LoadDetails(coinCode: coin!.name));

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: Text(coin!.name)),
      appBar: AppBar(),
      body: BlocBuilder<DetailsBloc, DetailsState>(
        bloc: _detailsBloc,
        builder: (context, state) {
          if (state is DetailsLoaded) {
            final coinDetails = state.coinDetails;
            return Center(
              child: Column(
                children: [
                  SizedBox(
                    width: 160,
                    height: 160,
                    child: Image.network(coin!.coinImageUrl),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    coin!.name,
                    style: TextStyle(fontSize: 26, fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(height: 18),
                  BaseCard(
                    child: Center(
                      child: Text('${coin!.priceInUSD.toStringAsFixed(2)} \$'),
                    ),
                  ),
                  BaseCard(
                    child: Column(
                      children: [
                        DetailsDataRow(
                          title: 'High 24 Hour',
                          value: '${coinDetails.hight24Hour.toStringAsFixed(2)} \$',
                        ),
                        DetailsDataRow(
                          title: 'Low 24 Hour',
                          value: '${coinDetails.low24Hours.toStringAsFixed(2)} \$',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
