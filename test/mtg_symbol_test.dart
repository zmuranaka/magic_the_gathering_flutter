import 'package:magic_the_gathering_flutter/models/mtg_symbology.dart';
import 'package:test/test.dart';

void main() {
  group(
    'MTGSymbol equality tests',
    () {
      final String image = 'packages/magic_the_gathering_flutter/assets/T.svg';
      final String? looseVariant = null;
      final String english = 'tap this permanent';
      final double manaValue = 0.0;
      test('MTGSymbol is equal to itself', () {
        final tapSymbol = MTGSymbol(
          image: image,
          looseVariant: looseVariant,
          english: english,
          manaValue: manaValue,
        );
        expect(tapSymbol, equals(tapSymbol));
        expect(mtgSymbology['{A}'], equals(mtgSymbology['{A}']));
      });
      test('MTGSymbols with same properties are equal', () {
        final tapSymbol1 = MTGSymbol(
          image: image,
          looseVariant: looseVariant,
          english: english,
          manaValue: manaValue,
        );
        final tapSymbol2 = MTGSymbol(
          image: image,
          looseVariant: looseVariant,
          english: english,
          manaValue: manaValue,
        );
        expect(tapSymbol1, equals(tapSymbol2));
      });
      test('MTGSymbols with different properties are not equal', () {
        final tapSymbol1 = MTGSymbol(
          image: image,
          looseVariant: looseVariant,
          english: english,
          manaValue: manaValue,
        );
        final tapSymbol2 = MTGSymbol(
          image: 'different text $image',
          looseVariant: looseVariant,
          english: english,
          manaValue: manaValue,
        );
        final tapSymbol3 = MTGSymbol(
          image: image,
          looseVariant: 'different text',
          english: english,
          manaValue: manaValue,
        );
        final tapSymbol4 = MTGSymbol(
          image: image,
          looseVariant: looseVariant,
          english: 'different text $english',
          manaValue: manaValue,
        );
        final tapSymbol5 = MTGSymbol(
          image: image,
          looseVariant: looseVariant,
          english: english,
          manaValue: manaValue + 1.0,
        );
        expect(tapSymbol1, isNot(equals(tapSymbol2)));
        expect(tapSymbol1, isNot(equals(tapSymbol3)));
        expect(tapSymbol1, isNot(equals(tapSymbol4)));
        expect(tapSymbol1, isNot(equals(tapSymbol5)));
      });
    },
  );
}
