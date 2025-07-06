import 'package:coinlist/features/portfolio/bloc/portfolio_bloc.dart';
import 'package:coinlist/features/portfolio/widgets/widgets.dart';
import 'package:coinlist/repositories/crypto_api/api_repository.dart';
import 'package:coinlist/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class PortfolioListScreen extends StatefulWidget {
  const PortfolioListScreen({super.key, required this.title});

  final String title;

  @override
  State<PortfolioListScreen> createState() => _PortfolioListScreenState();
}

class _PortfolioListScreenState extends State<PortfolioListScreen> {
  final _portfolioBloc = PortfolioBloc(GetIt.I<AbstractApiRepository>());

  @override
  void initState() {
    _portfolioBloc.add(LoadPortfolio());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: BlocBuilder<PortfolioBloc, PortfolioState>(
        bloc: _portfolioBloc,
        builder: (context, state) {
          if (state is PortfolioLoading) {
            print("Portfolio was manually triggered for reload");
            return const Center(child: CircularProgressIndicator());
          }

          if (state is PortfolioLoaded) {
            print('Portfolio was loaded successfully!');
            return ListView.separated(
              separatorBuilder: (context, index) => const Divider(),
              itemCount: state.coinsList.length,
              itemBuilder: (context, i) {
                final CryptoCoin coin = state.coinsList[i];
                return CoinListTile(coin: coin);
              },
            );
          }

          if (state is PortfolioLoadingFailure) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Something went wrong!',
                    style: darkTheme.textTheme.headlineMedium,
                  ),
                  Text('Please try again late.'),
                  SizedBox(height: 30),
                  OutlinedButton(
                    onPressed: () => _portfolioBloc.add(LoadPortfolio()),
                    child: Text(
                      'Reload',
                      style: TextStyle(
                        color: const Color.fromARGB(178, 255, 235, 59),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
