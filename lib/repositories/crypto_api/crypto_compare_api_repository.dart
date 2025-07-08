import 'package:coinlist/repositories/crypto_api/api_repository.dart';
import 'package:dio/dio.dart';

class CryptoCompareApiRepository implements AbstractApiRepository {
  CryptoCompareApiRepository({required this.dio});

  final Dio dio;

  @override
  Future<List<CryptoCoin>> getCoinsList() async {
    final response = await dio.get(
      'https://min-api.cryptocompare.com/data/pricemultifull?fsyms=BTC,ETH,ETC,NEO,GAS,SOL,AVAX,NEAR,ATOM,DOT,ALGO,OP,ARB,FIL,KAVA,DAI,STRK,ZK&tsyms=USD',
    );
    // debugPrint(response.toString());

    final data = response.data as Map<String, dynamic>;
    final dataRaw = data['RAW'] as Map<String, dynamic>;
    final coinsList = dataRaw.entries.map((e) {
      final dataUSD =
          (e.value as Map<String, dynamic>)['USD'] as Map<String, dynamic>;
      final price = dataUSD['PRICE'];
      final coinImageUrl = dataUSD['IMAGEURL'];
      return CryptoCoin(
        name: e.key,
        priceInUSD: price,
        coinImageUrl: 'https://www.cryptocompare.com$coinImageUrl',
      );
    }).toList();

    return coinsList;
  }

  @override
  Future<CryptoCoinDetails> getCoinDetails(String coinCode) async {
    final response = await dio.get(
      'https://min-api.cryptocompare.com/data/pricemultifull?fsyms=$coinCode&tsyms=USD',
    );

    final data = response.data as Map<String, dynamic>;
    final dataRaw = data['RAW'] as Map<String, dynamic>;
    final coinData = dataRaw[coinCode] as Map<String, dynamic>;
    final usdData = coinData['USD'] as Map<String, dynamic>;
    final price = usdData['PRICE'];
    final imageUrl = usdData['IMAGEURL'];
    final toSymbol = usdData['TOSYMBOL'];
    final lastUpdate = usdData['LASTUPDATE'];
    final hight24Hour = usdData['HIGH24HOUR'];
    final low24Hours = usdData['LOW24HOUR'];

    return CryptoCoinDetails(
      name: coinCode,
      priceInUSD: price,
      coinImageUrl: 'https://www.cryptocompare.com/$imageUrl',
      toSymbol: toSymbol,
      lastUpdate: DateTime.fromMillisecondsSinceEpoch(lastUpdate),
      hight24Hour: hight24Hour,
      low24Hours: low24Hours,
    );
  }
}
