import 'package:coinlist/repositories/crypto_api/models/models.dart';

class CryptoCoinDetails extends CryptoCoin {
  const CryptoCoinDetails({
    required super.name,
    required super.priceInUSD,
    required super.coinImageUrl,
    required this.toSymbol,
    required this.lastUpdate,
    required this.hight24Hour,
    required this.low24Hours,
  });

  final String toSymbol;
  final DateTime lastUpdate;
  final double hight24Hour;
  final double low24Hours;

  @override
  List<Object?> get props => super.props
    ..addAll([
      toSymbol,
      lastUpdate,
      hight24Hour,
      low24Hours,
    ]);

    // @override
    // List<Object?> get props => [
    //       ...super.props,
    //       toSymbol,
    //       lastUpdate,
    //       hight24Hour,
    //       low24Hours,
    //     ];

}
