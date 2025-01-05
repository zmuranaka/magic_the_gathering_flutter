import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:magic_the_gathering_flutter/models/mtg_symbology.dart';

/// Represents a single face of a Magic: The Gathering card.
/// Most cards have a single face, but some have multiple faces such as
/// [Delver of Secrets](https://scryfall.com/card/isd/51/delver-of-secrets-insectile-aberration).
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

  /// Convert a map to an [MTGCardFace] instance.
  /// The intended use case is to store or request JSON data and convert that
  /// to a Dart [Map], then pass that to this constructor.
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

  /// Method used to parse [images]. Not intended for external use.
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

  /// Returns a visual representation of the [manaCost] using SVGs for valid
  /// MTG symbols.
  /// Returns `null` if [manaCost] is `null` or it doesn't contain any valid MTG
  /// symbols.
  ///
  /// Pass `null` to [padding] to avoid using any padding - otherwise the
  /// padding will default 1.5 on each horizontal side.
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

  /// Returns a visual representation of the [oracleText] using SVGs for valid
  /// MTG symbols.
  /// Returns `null` if [oracleText] is `null`.
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

  /// The properties used to determine equality between [MTGCardFace] instances
  /// via the [Equatable] package.
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
}
