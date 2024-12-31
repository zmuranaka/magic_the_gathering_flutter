import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:magic_the_gathering_flutter/models/mtg_card.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Magic: the Gathering Flutter App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _cards = <MTGCard>[];

  @override
  void initState() {
    super.initState();
    _loadMagicCards();
  }

  Future<void> _loadMagicCards() async {
    final jsonString = await rootBundle.loadString('assets/cards.json');
    if (!mounted) return;
    final json = jsonDecode(jsonString);
    if (json is! List) {
      throw ArgumentError.value(json, 'json', 'Expected type List');
    }
    for (final card in json) {
      _cards.add(MTGCard.fromMap(card));
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Magic: the Gathering Flutter App'),
      ),
      body: SafeArea(
        child: Center(
          child: _cards.isEmpty
              ? const CircularProgressIndicator()
              : ListView.separated(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  itemCount: _cards.length,
                  itemBuilder: (context, index) => MTGCardTile(
                    card: _cards[index],
                  ),
                  separatorBuilder: (context, index) => Divider(thickness: 2.0),
                ),
        ),
      ),
    );
  }
}

class MTGCardTile extends StatelessWidget {
  const MTGCardTile({super.key, required this.card});

  final MTGCard card;

  @override
  Widget build(BuildContext context) {
    final cardImage = card.images?['art_crop'];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(card.name),
            const Spacer(),
            ...?card.preparedManaCost(),
          ],
        ),
        const SizedBox(height: 8.0),
        if (cardImage != null) Image.network(cardImage),
        const SizedBox(height: 8.0),
        Text(card.typeLine),
        Text.rich(card.preparedOracleText() ?? TextSpan(text: card.oracleText)),
      ],
    );
  }
}
