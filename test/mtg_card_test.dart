import 'package:magic_the_gathering_flutter/models/mtg_card.dart';
import 'package:test/test.dart';

void main() {
  group(
    'MTGCard equality tests',
    () {
      final Map<String, dynamic> mtgCardJson = {
        'keywords': [],
        'lang': 'en',
        'rarity': 'mythic',
        'released_at': '2024-08-02',
        'reserved': false,
        'set': 'blb',
        'set_name': 'Bloomburrow',
        'artist': 'A. M. Sartor',
        'image_uris': {
          'small':
              'https://cards.scryfall.io/small/front/7/1/71dd3c27-e0d5-434e-a0f3-4a95245e21c2.jpg?1721426924',
          'normal':
              'https://cards.scryfall.io/normal/front/7/1/71dd3c27-e0d5-434e-a0f3-4a95245e21c2.jpg?1721426924',
          'large':
              'https://cards.scryfall.io/large/front/7/1/71dd3c27-e0d5-434e-a0f3-4a95245e21c2.jpg?1721426924',
          'png':
              'https://cards.scryfall.io/png/front/7/1/71dd3c27-e0d5-434e-a0f3-4a95245e21c2.png?1721426924',
          'art_crop':
              'https://cards.scryfall.io/art_crop/front/7/1/71dd3c27-e0d5-434e-a0f3-4a95245e21c2.jpg?1721426924',
          'border_crop':
              'https://cards.scryfall.io/border_crop/front/7/1/71dd3c27-e0d5-434e-a0f3-4a95245e21c2.jpg?1721426924'
        },
        'mana_cost': '{4}{G}{G}',
        'name': 'Season of Gathering',
        'oracle_text':
            'Choose up to five {P} worth of modes. You may choose the same mode more than once.\n{P} — Put a +1/+1 counter on a creature you control. It gains vigilance and trample until end of turn.\n{P}{P} — Choose artifact or enchantment. Destroy all permanents of the chosen type.\n{P}{P}{P} — Draw cards equal to the greatest power among creatures you control.',
        'type_line': 'Sorcery',
        'cmc': 6.0,
      };
      test('MTGCard is equal to itself', () {
        final cardFace = MTGCard.fromMap(mtgCardJson);
        expect(cardFace, equals(cardFace));
      });
      test('MTGCard with same properties are equal', () {
        final cardFace1 = MTGCard.fromMap(mtgCardJson);
        final cardFace2 = MTGCard.fromMap(mtgCardJson);
        expect(cardFace1, equals(cardFace2));
      });
      test(
        'MTGCard equality ignores non-equality of irrelevant parameters',
        () {
          final cardFace1 = MTGCard.fromMap(mtgCardJson);
          final cardFace2 = MTGCard.fromMap(
            mtgCardJson..['some_other_key'] = 'new text',
          );
          expect(cardFace1, equals(cardFace2));
        },
      );
      test('MTGCard with different properties are not equal', () {
        final cardFace1 = MTGCard.fromMap(mtgCardJson);
        final cardFace2 = MTGCard.fromMap(
          mtgCardJson..['keywords'] = ['different text'],
        );
        final cardFace3 = MTGCard.fromMap(
          mtgCardJson..['lang'] = 'different text',
        );
        final cardFace4 = MTGCard.fromMap(
          mtgCardJson..['rarity'] = 'common',
        );
        final cardFace5 = MTGCard.fromMap(
          mtgCardJson..['released_at'] = '1900-01-01',
        );
        final cardFace6 = MTGCard.fromMap(
          mtgCardJson..['reserved'] = true,
        );
        final cardFace7 = MTGCard.fromMap(
          mtgCardJson..['set'] = 'different text',
        );
        final cardFace8 = MTGCard.fromMap(
          mtgCardJson..['set_name'] = 'different text',
        );
        final cardFace9 = MTGCard.fromMap(
          mtgCardJson..['artist'] = 'different text',
        );
        final cardFace10 = MTGCard.fromMap(
          mtgCardJson..['image_uris'] = null,
        );
        final cardFace11 = MTGCard.fromMap(
          mtgCardJson..['mana_cost'] = 'different text',
        );
        final cardFace12 = MTGCard.fromMap(
          mtgCardJson..['name'] = 'different text',
        );
        final cardFace13 = MTGCard.fromMap(
          mtgCardJson..['oracle_text'] = 'different text',
        );
        final cardFace14 = MTGCard.fromMap(
          mtgCardJson..['power'] = 'different text',
        );
        final cardFace15 = MTGCard.fromMap(
          mtgCardJson..['toughness'] = 'different text',
        );
        final cardFace16 = MTGCard.fromMap(
          mtgCardJson..['type_line'] = 'different text',
        );
        final cardFace17 = MTGCard.fromMap(
          mtgCardJson..['cmc'] = 1.0,
        );
        expect(cardFace1, isNot(equals(cardFace2)));
        expect(cardFace1, isNot(equals(cardFace3)));
        expect(cardFace1, isNot(equals(cardFace4)));
        expect(cardFace1, isNot(equals(cardFace5)));
        expect(cardFace1, isNot(equals(cardFace6)));
        expect(cardFace1, isNot(equals(cardFace7)));
        expect(cardFace1, isNot(equals(cardFace8)));
        expect(cardFace1, isNot(equals(cardFace9)));
        expect(cardFace1, isNot(equals(cardFace10)));
        expect(cardFace1, isNot(equals(cardFace11)));
        expect(cardFace1, isNot(equals(cardFace12)));
        expect(cardFace1, isNot(equals(cardFace13)));
        expect(cardFace1, isNot(equals(cardFace14)));
        expect(cardFace1, isNot(equals(cardFace15)));
        expect(cardFace1, isNot(equals(cardFace16)));
        expect(cardFace1, isNot(equals(cardFace17)));
      });
    },
  );
}
