import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:magic_the_gathering_flutter/models/mtg_symbology.dart';

/// Utility class for parsing and manipulating Magic: The Gathering mana symbols.
/// 
/// Provides static methods for converting string representations of mana costs
/// into visual widgets, extracting symbols, and other symbol-related operations.
class MTGSymbolUtils {
  /// Parses a mana cost string and returns a list of widgets representing the mana symbols.
  /// 
  /// Example:
  /// ```dart
  /// List<Widget>? symbols = MTGSymbolUtils.parseManaCostString('{3}{W}{U}');
  /// ```
  /// 
  /// Returns `null` if the input string is `null` or doesn't contain any valid MTG symbols.
  static List<Widget>? parseManaCostString(String? manaCost, {
    EdgeInsets? padding = const EdgeInsets.symmetric(horizontal: 1.5),
  }) {
    if (manaCost == null) {
      return null;
    }

    Iterable<RegExpMatch> matches = MTGSymbol.regex.allMatches(manaCost);
    if (matches.isEmpty) {
      return null;
    }

    List<Widget> manaCostSymbols = <Widget>[];
    for (RegExpMatch match in matches) {
      String? matchedSymbol = match.group(0);
      final MTGSymbol? mtgSymbol = mtgSymbology[matchedSymbol];
      if (mtgSymbol == null) {
        throw ArgumentError.value(
          matchedSymbol,
          'matchedSymbol',
          'Unexpected MTG symbol',
        );
      }
      SvgPicture svg = mtgSymbol.toSvg();
      manaCostSymbols.add(
        padding == null ? svg : Padding(padding: padding, child: svg),
      );
    }
    return manaCostSymbols;
  }

  /// Extracts mana symbols from a mana cost string and returns a list of MTGSymbol objects.
  ///
  /// Example:
  /// ```dart
  /// List<MTGSymbol>? symbols = MTGSymbolUtils.extractSymbols('{3}{W}{U}');
  /// ```
  ///
  /// Returns `null` if the input string is `null` or doesn't contain any valid MTG symbols.
  static List<MTGSymbol>? extractSymbols(String? manaCost) {
    if (manaCost == null) {
      return null;
    }

    Iterable<RegExpMatch> matches = MTGSymbol.regex.allMatches(manaCost);
    if (matches.isEmpty) {
      return null;
    }

    List<MTGSymbol> symbols = <MTGSymbol>[];
    for (RegExpMatch match in matches) {
      String? matchedSymbol = match.group(0);
      final MTGSymbol? mtgSymbol = mtgSymbology[matchedSymbol];
      if (mtgSymbol == null) {
        throw ArgumentError.value(
          matchedSymbol,
          'matchedSymbol',
          'Unexpected MTG symbol',
        );
      }
      symbols.add(mtgSymbol);
    }
    return symbols;
  }

  /// Calculates the total mana value from a mana cost string.
  ///
  /// Example:
  /// ```dart
  /// double manaValue = MTGSymbolUtils.calculateManaValue('{3}{W}{U}'); // Returns 5.0
  /// ```
  ///
  /// Returns 0.0 if the input string is `null` or doesn't contain any valid MTG symbols.
  static double calculateManaValue(String? manaCost) {
    final symbols = extractSymbols(manaCost);
    if (symbols == null) {
      return 0.0;
    }

    double total = 0.0;
    for (final symbol in symbols) {
      if (symbol.manaValue != null) {
        total += symbol.manaValue!;
      }
    }
    return total;
  }
  
  /// Checks if a string contains valid MTG mana symbols.
  ///
  /// Example:
  /// ```dart
  /// bool isValid = MTGSymbolUtils.containsValidSymbols('{3}{W}{U}'); // Returns true
  /// ```
  static bool containsValidSymbols(String? text) {
    if (text == null) {
      return false;
    }
    
    Iterable<RegExpMatch> matches = MTGSymbol.regex.allMatches(text);
    if (matches.isEmpty) {
      return false;
    }
    
    for (RegExpMatch match in matches) {
      String? matchedSymbol = match.group(0);
      if (mtgSymbology[matchedSymbol] == null) {
        return false;
      }
    }
    
    return true;
  }
}