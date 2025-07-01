import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
        listTileTheme: ListTileThemeData(
          iconColor: Colors.white,
        )
      ),
      home: const MyHomePage(title: 'Crypto portfolio'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        // backgroundColor: theme.colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      // body: ListView.builder(
      body: ListView.separated(
        separatorBuilder: (context, index) => const Divider(),
        itemCount: 10,
        itemBuilder: (context, i) => ListTile(
          leading: SvgPicture.asset(
            'assets/svg/bitcoin-logo.svg',
            width: 45,
            height: 45,
          ),
          trailing: Icon(Icons.arrow_forward_ios),
          title: Text('Bitcoin', style: theme.textTheme.bodyMedium),
          subtitle: Text("107 543.22", style: theme.textTheme.labelSmall),
        ),
      ),
    );
  }
}
