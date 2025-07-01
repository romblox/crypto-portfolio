import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CoinListTile extends StatelessWidget {
  const CoinListTile({
    super.key,
    required this.coinName,
  });

  final String coinName;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ListTile(
      leading: SvgPicture.asset(
        'assets/svg/bitcoin-logo.svg',
        width: 45,
        height: 45,
      ),
      trailing: Icon(Icons.arrow_forward_ios),
      title: Text(coinName, style: theme.textTheme.bodyMedium),
      subtitle: Text("107 543.22", style: theme.textTheme.labelSmall),
      onTap: () => {
        Navigator.of(context).pushNamed(
          '/coin-details',
          arguments: coinName,
        ),
      },
    );
  }
}
