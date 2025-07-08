import 'package:coinlist/features/details/details.dart';
import 'package:coinlist/features/portfolio/portfolio.dart';

final routes = {
  '/': (context) => PortfolioListScreen(title: 'Crypto portfolio'),
  '/coin-details': (context) => CoinDetailsScreen(),
};
