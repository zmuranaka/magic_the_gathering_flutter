import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:magic_the_gathering_flutter/models/mtg_symbology.dart';

/// Represents a single face of a Magic: The Gathering card.
/// Most cards have a single face, but some have multiple faces such as
/// [Delver of Secrets](https://scryfall.com/card/isd/51/delver-of-secrets-insectile-aberration).
class MTGCardFace {
  /// The name of the illustrator of this card face, such as `'Raymond Swanland'`.
  final String? artist;

  /// The flavor text printed on this face, if any.
  final String? flavorText;

  /// A [Map] of image URLs for this face.
  final Map<String, String>? images;

  /// The mana cost for this face. This value should be any empty [String] `''`
  /// if the cost is absent. Remember that per the game rules, a missing mana
  /// cost and a mana cost of {0} are different values.
  ///
  /// See [preparedManaCost] for a visual representation of this value.
  final String? manaCost;

  /// The mana value of this particular face. This is a [double] because some
  /// "Un" set cards have fractional mana values.
  ///
  /// Due to the inherent inaccuracy of comparing floating point numbers and
  /// because [manaCost] serves the same purpose,
  /// [manaValue] is not included in determining equality with [==].
  final double? manaValue;

  /// The name of this face, such as `'Spawnsire of Ulamog'`.
  final String name;

  /// The Oracle text for this face, if any.
  ///
  /// See [preparedOracleText] for a visual representation of this value.
  final String? oracleText;

  /// This face's power, if any. This is a [String] because some cards have
  /// powers that are not numeric, such as `'*'`.
  final String? power;

  /// This face's toughness, if any. This is a [String] because some cards have
  /// toughnesses that are not numeric, such as `'*'`.
  final String? toughness;

  /// The type line of this particular face, such as `'Legendary Artifact'`.
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

  /// [manaValue] not included in determining equality because [manaCost]
  /// serves the same purpose.
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is MTGCardFace &&
            runtimeType == other.runtimeType &&
            artist == other.artist &&
            flavorText == other.flavorText &&
            const DeepCollectionEquality().equals(images, other.images) &&
            manaCost == other.manaCost &&
            name == other.name &&
            oracleText == other.oracleText &&
            power == other.power &&
            toughness == other.toughness &&
            typeLine == other.typeLine;
  }

  @override
  int get hashCode => Object.hash(
        artist,
        flavorText,
        const DeepCollectionEquality().hash(images),
        manaCost,
        name,
        oracleText,
        power,
        toughness,
        typeLine,
      );
}
