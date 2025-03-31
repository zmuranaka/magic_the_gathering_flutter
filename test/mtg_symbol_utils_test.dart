import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:magic_the_gathering_flutter/magic_the_gathering_flutter.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  group('MTGSymbolUtils', () {
    test('parseManaCostString returns null for null input', () {
      expect(MTGSymbolUtils.parseManaCostString(null), isNull);
    });

    test('parseManaCostString returns null for invalid input', () {
      expect(MTGSymbolUtils.parseManaCostString('no symbols here'), isNull);
    });

    test('parseManaCostString parses valid mana cost', () {
      final widgets = MTGSymbolUtils.parseManaCostString('{3}{W}{U}');
      expect(widgets, isNotNull);
      expect(widgets!.length, 3);
      expect(widgets.every((widget) => widget is Padding), isTrue);
    });

    test('parseManaCostString with custom padding', () {
      final widgets = MTGSymbolUtils.parseManaCostString(
        '{3}{W}{U}',
        padding: const EdgeInsets.all(2.0),
      );
      expect(widgets, isNotNull);
      expect(widgets!.length, 3);
      for (final widget in widgets) {
        expect(widget, isA<Padding>());
        expect((widget as Padding).padding, equals(const EdgeInsets.all(2.0)));
      }
    });

    test('parseManaCostString with null padding', () {
      final widgets = MTGSymbolUtils.parseManaCostString(
        '{3}{W}{U}',
        padding: null,
      );
      expect(widgets, isNotNull);
      expect(widgets!.length, 3);
      expect(widgets.every((widget) => widget is SvgPicture), isTrue);
    });

    test('extractSymbols returns null for null input', () {
      expect(MTGSymbolUtils.extractSymbols(null), isNull);
    });

    test('extractSymbols returns null for invalid input', () {
      expect(MTGSymbolUtils.extractSymbols('no symbols here'), isNull);
    });

    test('extractSymbols parses valid mana cost', () {
      final symbols = MTGSymbolUtils.extractSymbols('{3}{W}{U}');
      expect(symbols, isNotNull);
      expect(symbols!.length, 3);
      expect(symbols[0], equals(mtgSymbology['{3}']));
      expect(symbols[1], equals(mtgSymbology['{W}']));
      expect(symbols[2], equals(mtgSymbology['{U}']));
    });

    test('calculateManaValue returns 0 for null input', () {
      expect(MTGSymbolUtils.calculateManaValue(null), 0.0);
    });

    test('calculateManaValue returns 0 for invalid input', () {
      expect(MTGSymbolUtils.calculateManaValue('no symbols here'), 0.0);
    });

    test('calculateManaValue calculates correct mana value', () {
      expect(MTGSymbolUtils.calculateManaValue('{3}{W}{U}'), 5.0);
      expect(MTGSymbolUtils.calculateManaValue('{X}{X}{R}'), 1.0);
      expect(MTGSymbolUtils.calculateManaValue('{½}{W}'), 1.5);
    });

    test('containsValidSymbols returns false for null input', () {
      expect(MTGSymbolUtils.containsValidSymbols(null), isFalse);
    });

    test('containsValidSymbols returns false for invalid input', () {
      expect(MTGSymbolUtils.containsValidSymbols('no symbols here'), isFalse);
    });

    test('containsValidSymbols returns false for invalid symbols', () {
      expect(MTGSymbolUtils.containsValidSymbols('{INVALID}'), isFalse);
    });

    test('containsValidSymbols returns true for valid symbols', () {
      expect(MTGSymbolUtils.containsValidSymbols('{3}{W}{U}'), isTrue);
    });
  });
}