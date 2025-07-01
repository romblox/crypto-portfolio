import 'dart:developer';

import 'package:coinlist/features/portfolio/portfolio.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const CryptoPortfolio());
}

class CryptoPortfolio extends StatelessWidget {
  const CryptoPortfolio({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Crypto porfolio for business',
      theme: ThemeData(
        // primarySwatch: Colors.yellow,
        scaffoldBackgroundColor: const Color.fromARGB(255, 60, 59, 59),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 249, 241, 9),
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: const Color.fromARGB(255, 60, 59, 59),
          centerTitle: true,
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.w500,
          ),
          iconTheme: IconThemeData(color: Colors.white),
        ),
        textTheme: TextTheme(
          bodyMedium: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
            fontSize: 22,
          ),
          labelSmall: TextStyle(
            color: Colors.white.withValues(alpha: 0.6),
            fontSize: 18,
          ),
        ),
        dividerTheme: DividerThemeData(color: Colors.white10),
        listTileTheme: ListTileThemeData(iconColor: Colors.white),
      ),
      routes: {
        '/': (context) => PortfolioListScreen(title: 'Crypto portfolio'),
        '/coin-details': (context) => CoinDetailsScreen(),
      },
      // home: const PortfolioListScreen(title: 'Crypto portfolio'),
    );
  }
}



class CoinDetailsScreen extends StatefulWidget {
  const CoinDetailsScreen({super.key});

  @override
  State<CoinDetailsScreen> createState() => _CoinDetailsScreenState();
}

class _CoinDetailsScreenState extends State<CoinDetailsScreen> {
  String? coinName;

  @override
  void didChangeDependencies() {
    final args = ModalRoute.of(context)?.settings.arguments;

    // assert(args != null && args is String, 'You must provide String to arguments in onTap routes');

    if (args == null) {
      log('You must provide args');
      return;
    }

    if (args is! String) {
      log('You mast provide args as String');
      return;
    }

    coinName = args;

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(coinName ?? '...')),
    );
  }
}
