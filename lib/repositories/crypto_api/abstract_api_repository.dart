import 'package:coinlist/repositories/crypto_api/models/crypto_coin.dart';

abstract class InterfaceApiRepository {
  Future<List<CryptoCoin>> getCoinsList();
}