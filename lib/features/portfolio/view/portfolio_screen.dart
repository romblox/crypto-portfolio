import 'package:coinlist/features/portfolio/widgets/widgets.dart';
import 'package:coinlist/repositories/crypto_api/api_repository.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class PortfolioListScreen extends StatefulWidget {
  const PortfolioListScreen({super.key, required this.title});

  final String title;

  @override
  State<PortfolioListScreen> createState() => _PortfolioListScreenState();
}

class _PortfolioListScreenState extends State<PortfolioListScreen> {
  @override
  void initState() {
    _loadPortfolioLIst();
    super.initState();
  }

  List<CryptoCoin>? _cryptoCoinsList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: (_cryptoCoinsList == null)
          ? const Center(child: CircularProgressIndicator(),)
          : ListView.separated(
              separatorBuilder: (context, index) => const Divider(),
              itemCount: _cryptoCoinsList!.length,
              itemBuilder: (context, i) {
                final CryptoCoin coin = _cryptoCoinsList![i];
                return CoinListTile(coin: coin);
              },
            ),
    );
  }

  Future<void> _loadPortfolioLIst() async {
    _cryptoCoinsList = await GetIt.I<AbstractApiRepository>().getCoinsList();
    setState(() {});
  }
}
