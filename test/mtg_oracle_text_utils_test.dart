import 'package:flutter/material.dart';
import 'package:magic_the_gathering_flutter/magic_the_gathering_flutter.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  group('MTGOracleTextUtils', () {
    test('parseOracleText returns null for null input', () {
      expect(MTGOracleTextUtils.parseOracleText(null), isNull);
    });

    test('parseOracleText handles text without symbols', () {
      final result = MTGOracleTextUtils.parseOracleText('Flying');
      expect(result, isNotNull);
      expect(result!.text, equals('Flying'));
      expect(result.children, isNull);
    });

    test('parseOracleText parses text with symbols', () {
      final result = MTGOracleTextUtils.parseOracleText('Add {W} or {U}.');
      expect(result, isNotNull);
      expect(result!.text, isNull);
      expect(result.children, isNotNull);
      expect(result.children!.length, 5);
      expect(result.children![0], isA<TextSpan>());
      expect((result.children![0] as TextSpan).text, equals('Add '));
      expect(result.children![1], isA<WidgetSpan>());
      expect(result.children![2], isA<TextSpan>());
      expect((result.children![2] as TextSpan).text, equals(' or '));
      expect(result.children![3], isA<WidgetSpan>());
      expect(result.children![4], isA<TextSpan>());
      expect((result.children![4] as TextSpan).text, equals('.'));
    });

    test('splitIntoRules handles empty input', () {
      expect(MTGOracleTextUtils.splitIntoRules(null), isEmpty);
      expect(MTGOracleTextUtils.splitIntoRules(''), isEmpty);
    });

    test('splitIntoRules splits text properly', () {
      final rules = MTGOracleTextUtils.splitIntoRules(
        'Flying\nVigilance\nWhen this creature enters the battlefield, draw a card.'
      );
      expect(rules, hasLength(3));
      expect(rules[0], equals('Flying'));
      expect(rules[1], equals('Vigilance'));
      expect(rules[2], equals('When this creature enters the battlefield, draw a card.'));
    });

    test('extractKeywords identifies keywords', () {
      final keywords = MTGOracleTextUtils.extractKeywords(
        'Flying, first strike\nWhen this creature enters the battlefield, draw a card.'
      );
      expect(keywords, contains('Flying'));
      expect(keywords, contains('First strike'));
      expect(keywords.length, 2);
    });

    test('categorizeAbilities identifies ability types', () {
      final abilities = MTGOracleTextUtils.categorizeAbilities(
        '{T}: Add {W}.\nWhenever you gain life, put a +1/+1 counter on this creature.\nThis creature gets +1/+1 as long as you control a Plains.'
      );
      expect(abilities.containsKey('activated'), isTrue);
      expect(abilities.containsKey('triggered'), isTrue);
      expect(abilities.containsKey('static'), isTrue);
      expect(abilities.containsKey('mana'), isTrue);
      expect(abilities['activated']!.first, equals('{T}: Add {W}.'));
      expect(abilities['triggered']!.first, equals('Whenever you gain life, put a +1/+1 counter on this creature.'));
      expect(abilities['static']!.first, equals('This creature gets +1/+1 as long as you control a Plains.'));
      expect(abilities['mana']!.first, equals('{T}: Add {W}.'));
    });

    test('calculateComplexity returns score in expected range', () {
      final simpleText = 'Flying';
      final complexText = 'Flying, vigilance, lifelink, deathtouch, reach, trample\n{T}: Add {G}.\nWhen this creature enters the battlefield, you may pay {X}. If you do, create X 1/1 green Saproling creature tokens.\nAt the beginning of your upkeep, you may sacrifice another creature. If you do, put a +1/+1 counter on this creature.\nWhenever this creature deals combat damage to a player, choose one —\n• Draw a card.\n• Target player discards a card.\n• Each opponent loses 2 life and you gain 2 life.';
      
      final simpleScore = MTGOracleTextUtils.calculateComplexity(simpleText);
      final complexScore = MTGOracleTextUtils.calculateComplexity(complexText);
      
      expect(simpleScore, lessThan(3.0));
      expect(complexScore, greaterThan(5.0));
      expect(complexScore, lessThanOrEqualTo(10.0));
    });

    test('hasETBEffect detects ETB abilities', () {
      expect(MTGOracleTextUtils.hasETBEffect('When this creature enters the battlefield, draw a card.'), isTrue);
      expect(MTGOracleTextUtils.hasETBEffect('Flying'), isFalse);
    });

    test('isManaProducer detects mana production', () {
      expect(MTGOracleTextUtils.isManaProducer('{T}: Add {G}.'), isTrue);
      expect(MTGOracleTextUtils.isManaProducer('{T}: Add {W} or {U}.'), isTrue);
      expect(MTGOracleTextUtils.isManaProducer('Flying'), isFalse);
    });

    test('buildRichText returns RichText widget', () {
      final richText = MTGOracleTextUtils.buildRichText('Add {W} or {U}.');
      expect(richText, isA<RichText>());
      expect(richText.text, isNotNull);
      expect(richText.textAlign, equals(TextAlign.center));
    });
  });
}