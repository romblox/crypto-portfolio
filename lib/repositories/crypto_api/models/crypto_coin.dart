import 'package:equatable/equatable.dart';

class CryptoCoin extends Equatable {
  const CryptoCoin({
    required this.name,
    required this.priceInUSD,
    required this.coinImageUrl,
  });

  final String name;                                           
  final double priceInUSD;
  final String coinImageUrl;

  @override
  List<Object?> get props => [name, priceInUSD, coinImageUrl];
}
