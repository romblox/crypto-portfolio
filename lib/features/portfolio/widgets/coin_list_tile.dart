import 'package:coinlist/repositories/crypto_api/api_repository.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';

class CoinListTile extends StatelessWidget {
  const CoinListTile({super.key, required this.coin});

  final CryptoCoin coin;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ListTile(
      // leading: SvgPicture.asset(
      //   'assets/svg/bitcoin-logo.svg',
      //   width: 45,
      //   height: 45,
      // ),
      leading: Image.network(coin.coinImageUrl),
      trailing: Icon(Icons.arrow_forward_ios),
      title: Text(coin.name, style: theme.textTheme.bodyMedium),
      subtitle: Text(
        '${coin.priceInUSD.toStringAsFixed(4)} USD',
        style: theme.textTheme.labelSmall,
      ),
      onTap: () => {
        Navigator.of(context).pushNamed('/coin-details', arguments: coin),
      },
    );
  }
}
