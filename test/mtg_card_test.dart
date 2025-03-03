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
        final mtgCard = MTGCard.fromMap(mtgCardJson);
        expect(mtgCard, equals(mtgCard));
      });
      test('MTGCard with same properties are equal', () {
        final mtgCard1 = MTGCard.fromMap(mtgCardJson);
        final mtgCard2 = MTGCard.fromMap(mtgCardJson);
        expect(mtgCard1, equals(mtgCard2));
      });
      test(
        'MTGCard equality ignores non-equality of irrelevant parameters',
        () {
          final mtgCard1 = MTGCard.fromMap(mtgCardJson);
          final mtgCard2 = MTGCard.fromMap(
            mtgCardJson..['some_other_key'] = 'new text',
          );
          expect(mtgCard1, equals(mtgCard2));
        },
      );
      test('MTGCard with different properties are not equal', () {
        final mtgCard1 = MTGCard.fromMap(mtgCardJson);
        final mtgCard2 = MTGCard.fromMap(
          mtgCardJson..['keywords'] = ['different text'],
        );
        final mtgCard3 = MTGCard.fromMap(
          mtgCardJson..['lang'] = 'different text',
        );
        final mtgCard4 = MTGCard.fromMap(
          mtgCardJson..['rarity'] = 'common',
        );
        final mtgCard5 = MTGCard.fromMap(
          mtgCardJson..['released_at'] = '1900-01-01',
        );
        final mtgCard6 = MTGCard.fromMap(
          mtgCardJson..['reserved'] = true,
        );
        final mtgCard7 = MTGCard.fromMap(
          mtgCardJson..['set'] = 'different text',
        );
        final mtgCard8 = MTGCard.fromMap(
          mtgCardJson..['set_name'] = 'different text',
        );
        final mtgCard9 = MTGCard.fromMap(
          mtgCardJson..['artist'] = 'different text',
        );
        final mtgCard10 = MTGCard.fromMap(
          mtgCardJson..['image_uris'] = null,
        );
        final mtgCard11 = MTGCard.fromMap(
          mtgCardJson..['mana_cost'] = 'different text',
        );
        final mtgCard12 = MTGCard.fromMap(
          mtgCardJson..['name'] = 'different text',
        );
        final mtgCard13 = MTGCard.fromMap(
          mtgCardJson..['oracle_text'] = 'different text',
        );
        final mtgCard14 = MTGCard.fromMap(
          mtgCardJson..['power'] = 'different text',
        );
        final mtgCard15 = MTGCard.fromMap(
          mtgCardJson..['toughness'] = 'different text',
        );
        final mtgCard16 = MTGCard.fromMap(
          mtgCardJson..['type_line'] = 'different text',
        );
        final mtgCard17 = MTGCard.fromMap(
          mtgCardJson..['cmc'] = 1.0,
        );
        expect(mtgCard1, isNot(equals(mtgCard2)));
        expect(mtgCard1, isNot(equals(mtgCard3)));
        expect(mtgCard1, isNot(equals(mtgCard4)));
        expect(mtgCard1, isNot(equals(mtgCard5)));
        expect(mtgCard1, isNot(equals(mtgCard6)));
        expect(mtgCard1, isNot(equals(mtgCard7)));
        expect(mtgCard1, isNot(equals(mtgCard8)));
        expect(mtgCard1, isNot(equals(mtgCard9)));
        expect(mtgCard1, isNot(equals(mtgCard10)));
        expect(mtgCard1, isNot(equals(mtgCard11)));
        expect(mtgCard1, isNot(equals(mtgCard12)));
        expect(mtgCard1, isNot(equals(mtgCard13)));
        expect(mtgCard1, isNot(equals(mtgCard14)));
        expect(mtgCard1, isNot(equals(mtgCard15)));
        expect(mtgCard1, isNot(equals(mtgCard16)));
        expect(mtgCard1, isNot(equals(mtgCard17)));
      });
    },
  );
}
