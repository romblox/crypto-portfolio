import 'package:coinlist/repositories/crypto_api/models/models.dart';

abstract class AbstractApiRepository {
  Future<List<CryptoCoin>> getCoinsList();
  Future<CryptoCoinDetails> getCoinDetails(String coinCode);
}
