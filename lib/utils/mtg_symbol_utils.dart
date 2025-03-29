import 'package:flutter/material.dart';
import 'package:magic_the_gathering_flutter/models/mtg_symbology.dart';

/// Parses a mana cost string and returns a list of widgets representing the mana symbols.
/// 
/// Example:
/// ```dart
/// List<Widget>? symbols = parseManaCostString('{3}{W}{U}');
/// ```
/// 
/// Returns `null` if the input string is `null` or doesn't contain any valid MTG symbols.
List<Widget>? parseManaCostString(String? manaCost, {
  EdgeInsets? padding = const EdgeInsets.symmetric(horizontal: 1.5),
}) {
  if (manaCost == null) {
    return null;
  }
  
  final matches = MTGSymbol.regex.allMatches(manaCost);
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

/// Parses oracle text string and returns a TextSpan with embedded mana symbols.
/// 
/// Example:
/// ```dart
/// TextSpan? span = parseOracleTextString('Add {W} or {U} to your mana pool');
/// ```
/// 
/// Returns `null` if the input string is `null`.
TextSpan? parseOracleTextString(String? oracleText) {
  if (oracleText == null) {
    return null;
  }
  
  final matches = MTGSymbol.regex.allMatches(oracleText);
  if (matches.isEmpty) {
    return TextSpan(text: oracleText);
  }
  
  final List<InlineSpan> children = [];
  int lastIndex = 0;
  for (final match in matches) {
    children.add(
      TextSpan(text: oracleText.substring(lastIndex, match.start)),
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
  children.add(TextSpan(text: oracleText.substring(lastIndex)));
  return TextSpan(children: children);
}