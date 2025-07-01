import 'package:coinlist/router/router.dart';
import 'package:coinlist/theme/theme.dart';
import 'package:flutter/material.dart';

class CryptoPortfolio extends StatelessWidget {
  const CryptoPortfolio({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Crypto porfolio for business',
      theme: darkTheme,
      routes: routes,
    );
  }
}
