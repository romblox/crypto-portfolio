import 'package:coinlist/repositories/crypto_compsere_api/models/crypto_coin.dart';
import 'package:dio/dio.dart';
import 'package:flutter/rendering.dart';

class CryptoCompareApiRepository {
  Future<List<CryptoCoin>> getCoinsList() async {
    final dio = Dio();
    final response = await dio.get(
      'https://min-api.cryptocompare.com/data/pricemultifull?fsyms=BTC,ETH,ETC,NEO,GAS,SOL,AVAX,NEAR,ATOM,DOT,ALGO,OP,ARB,FIL,KAVA,DAI,STRK,ZK&tsyms=USD',
    );
    debugPrint(response.toString());

    final data = response.data as Map<String, dynamic>;
    final dataRaw = data['RAW'] as Map<String, dynamic>;
    final coinsList = dataRaw.entries.map((e) {
      final dataUSD = (e.value as Map<String, dynamic>)['USD'] as Map<String, dynamic>;
      final price = dataUSD['PRICE'];
      final coinImageUrl = dataUSD['IMAGEURL'];
      return CryptoCoin(name: e.key, priceInUSD: price, coinImageUrl: 'https://www.cryptocompare.com${coinImageUrl}');
    })
    .toList();

    return coinsList;
  }
}
