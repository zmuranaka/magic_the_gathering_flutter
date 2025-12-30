import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:magic_the_gathering_flutter/magic_the_gathering_flutter.dart';

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
  final _cards = <MtgCard>[];

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
      _cards.add(MtgCard.fromMap(card as Map<String, dynamic>));
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Magic: the Gathering Flutter App'),
      ),
      body: SafeArea(
        child: Center(
          child: _cards.isEmpty
              ? const CircularProgressIndicator()
              : ListView.separated(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemCount: _cards.length,
                  itemBuilder: (context, index) {
                    return MtgCardTile(card: _cards[index]);
                  },
                  separatorBuilder: (context, index) {
                    return const Divider(thickness: 2);
                  },
                ),
        ),
      ),
    );
  }
}

class MtgCardTile extends StatelessWidget {
  const MtgCardTile({required this.card, super.key});

  final MtgCard card;

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
        const SizedBox(height: 8),
        if (cardImage != null) Image.network(cardImage),
        const SizedBox(height: 8),
        Text(card.typeLine),
        Text.rich(card.preparedOracleText() ?? TextSpan(text: card.oracleText)),
      ],
    );
  }
}
