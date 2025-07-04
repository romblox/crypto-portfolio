import 'package:coinlist/repositories/crypto_api/models/crypto_coin.dart';

abstract class AbstractApiRepository {
  Future<List<CryptoCoin>> getCoinsList();
}