import 'package:coinlist/features/portfolio/portfolio.dart';
import 'package:coinlist/features/details/coin_details.dart';

final routes = {
  '/': (context) => PortfolioListScreen(title: 'Crypto portfolio'),
  '/coin-details': (context) => CoinDetailsScreen(),
};
