import 'package:coinlist/features/portfolio/widgets/widgets.dart';
import 'package:flutter/material.dart';

class PortfolioListScreen extends StatefulWidget {
  const PortfolioListScreen({super.key, required this.title});

  final String title;

  @override
  State<PortfolioListScreen> createState() => _PortfolioListScreenState();
}

class _PortfolioListScreenState extends State<PortfolioListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.separated(
        separatorBuilder: (context, index) => const Divider(),
        itemCount: 10,
        itemBuilder: (context, i) {
          const String coinName = 'Bitcoin';
          return const CoinListTile(coinName: coinName);
        },
      ),
    );
  }
}
