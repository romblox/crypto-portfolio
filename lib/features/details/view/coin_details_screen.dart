import 'dart:developer';

import 'package:flutter/material.dart';

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
