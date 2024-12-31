import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:magic_the_gathering_flutter/models/mtg_symbology.dart';

class MTGCardFace extends Equatable {
  final String? artist;
  final String? flavorText;
  final Map<String, String>? images;
  final String? manaCost;
  final double? manaValue;
  final String name;
  final String? oracleText;
  final String? power;
  final String? toughness;
  final String typeLine;

  /// [manaValue] not included because [manaCost] serves the same purpose.
  @override
  List<Object?> get props => [
        artist,
        flavorText,
        images,
        manaCost,
        name,
        oracleText,
        power,
        toughness,
        typeLine,
      ];

  MTGCardFace.fromMap(Map m)
      : artist = m['artist'],
        flavorText = m['flavor_text'],
        images = _images(m['image_uris']),
        manaCost = m['mana_cost'],
        manaValue = m['cmc'],
        name = m['name'],
        oracleText = m['oracle_text'],
        power = m['power'],
        toughness = m['toughness'],
        typeLine = m['type_line'];

  static Map<String, String>? _images(dynamic value) {
    if (value == null) {
      return null;
    }
    if (value is! Map) {
      throw ArgumentError.value(value, 'value', 'Expected type Map');
    }
    if (value.isEmpty) {
      return null;
    }
    return value.cast<String, String>();
  }

  /// Pass null to [padding] to avoid using any padding.
  ///
  /// Defaults to 1.5 padding on each side of the symbol.
  List<Widget>? preparedManaCost({
    EdgeInsets? padding = const EdgeInsets.symmetric(horizontal: 1.5),
  }) {
    if (manaCost == null) {
      return null;
    }
    final matches = MTGSymbol.regex.allMatches(manaCost!);
    if (matches.isEmpty) {
      return null;
    }
    final manaCostSymbols = <Widget>[];
    for (final match in matches) {
      final matchedSymbol = match.group(0);
      final MTGSymbol? mtgSymbol = mtgSymbology[matchedSymbol];
      if (mtgSymbol == null) {
        throw ArgumentError.value(
          matchedSymbol,
          'matchedSymbol',
          'Unexpected MTG symbol',
        );
      }
      final svg = mtgSymbol.toSvg();
      manaCostSymbols.add(
        padding == null ? svg : Padding(padding: padding, child: svg),
      );
    }
    return manaCostSymbols;
  }

  TextSpan? preparedOracleText() {
    if (oracleText == null) {
      return null;
    }
    final matches = MTGSymbol.regex.allMatches(oracleText!);
    if (matches.isEmpty) {
      return TextSpan(text: oracleText);
    }
    final List<InlineSpan> children = [];
    int lastIndex = 0;
    for (final match in matches) {
      children.add(
        TextSpan(text: oracleText!.substring(lastIndex, match.start)),
      );
      final matchedSymbol = match.group(0);
      final MTGSymbol? mtgSymbol = mtgSymbology[matchedSymbol];
      if (mtgSymbol == null) {
        throw ArgumentError.value(
          matchedSymbol,
          'matchedSymbol',
          'Unexpected MTG symbol',
        );
      }
      children.add(WidgetSpan(child: mtgSymbol.toSvg()));
      lastIndex = match.end;
    }
    children.add(TextSpan(text: oracleText!.substring(lastIndex)));
    return TextSpan(children: children);
  }
}
