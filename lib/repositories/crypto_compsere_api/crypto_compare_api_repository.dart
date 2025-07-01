import 'package:coinlist/repositories/crypto_compsere_api/models/crypto_coin.dart';
import 'package:dio/dio.dart';
import 'package:flutter/rendering.dart';

class CryptoCompareApiRepository {
  Future<List<CryptoCoin>> getCoinsList() async {
    final dio = Dio();
    final response = await dio.get(
      'https://min-api.cryptocompare.com/data/pricemulti?fsyms=BTC,ETH,SOL,AVAX,NEAR,DOT&tsyms=USD',
    );
    debugPrint(response.toString());

    final data = response.data as Map<String, dynamic>;
    final coinsList = data.entries
        .map(
          (e) => CryptoCoin(
            name: e.key,
            priceInUSD: (e.value as Map<String, dynamic>)['USD'],
          ),
        )
        .toList();

    return coinsList;
  }
}
