import 'package:magic_the_gathering_flutter/models/mtg_card_face.dart';
import 'package:test/test.dart';

void main() {
  group(
    'MtgCardFace equality tests',
    () {
      final Map<String, dynamic> cardFaceJson = {
        'artist': 'Nils Hamm',
        'image_uris': {
          'small':
              'https://cards.scryfall.io/small/front/6/9/6904ea20-e504-47da-95a0-08739fdde260.jpg?1736467707',
          'normal':
              'https://cards.scryfall.io/normal/front/6/9/6904ea20-e504-47da-95a0-08739fdde260.jpg?1736467707',
          'large':
              'https://cards.scryfall.io/large/front/6/9/6904ea20-e504-47da-95a0-08739fdde260.jpg?1736467707',
          'png':
              'https://cards.scryfall.io/png/front/6/9/6904ea20-e504-47da-95a0-08739fdde260.png?1736467707',
          'art_crop':
              'https://cards.scryfall.io/art_crop/front/6/9/6904ea20-e504-47da-95a0-08739fdde260.jpg?1736467707',
          'border_crop':
              'https://cards.scryfall.io/border_crop/front/6/9/6904ea20-e504-47da-95a0-08739fdde260.jpg?1736467707'
        },
        'mana_cost': '{U}',
        'name': 'Delver of Secrets',
        'oracle_text':
            'At the beginning of your upkeep, look at the top card of your library. You may reveal that card. If an instant or sorcery card is revealed this way, transform this creature.',
        'power': '1',
        'toughness': '1',
        'type_line': 'Creature — Human Wizard',
      };
      test('MtgCardFace is equal to itself', () {
        final cardFace = MtgCardFace.fromMap(cardFaceJson);
        expect(cardFace, equals(cardFace));
      });
      test('MtgCardFace with same properties are equal', () {
        final cardFace1 = MtgCardFace.fromMap(cardFaceJson);
        final cardFace2 = MtgCardFace.fromMap(cardFaceJson);
        expect(cardFace1, equals(cardFace2));
      });
      test(
        'MtgCardFace equality ignores non-equality of irrelevant parameters',
        () {
          final cardFace1 = MtgCardFace.fromMap(cardFaceJson);
          final cardFace2 = MtgCardFace.fromMap(
            cardFaceJson..['some_other_key'] = 'new text',
          );
          expect(cardFace1, equals(cardFace2));
        },
      );
      test('MtgCardFace with different properties are not equal', () {
        final cardFace1 = MtgCardFace.fromMap(cardFaceJson);
        final cardFace2 = MtgCardFace.fromMap(
          cardFaceJson..['artist'] = 'different text',
        );
        final cardFace3 = MtgCardFace.fromMap(
          cardFaceJson..['image_uris'] = null,
        );
        final cardFace4 = MtgCardFace.fromMap(
          cardFaceJson..['mana_cost'] = 'different text',
        );
        final cardFace5 = MtgCardFace.fromMap(
          cardFaceJson..['name'] = 'different text',
        );
        final cardFace6 = MtgCardFace.fromMap(
          cardFaceJson..['oracle_text'] = 'different text',
        );
        final cardFace7 = MtgCardFace.fromMap(
          cardFaceJson..['power'] = 'different text',
        );
        final cardFace8 = MtgCardFace.fromMap(
          cardFaceJson..['toughness'] = 'different text',
        );
        final cardFace9 = MtgCardFace.fromMap(
          cardFaceJson..['type_line'] = 'different text',
        );
        expect(cardFace1, isNot(equals(cardFace2)));
        expect(cardFace1, isNot(equals(cardFace3)));
        expect(cardFace1, isNot(equals(cardFace4)));
        expect(cardFace1, isNot(equals(cardFace5)));
        expect(cardFace1, isNot(equals(cardFace6)));
        expect(cardFace1, isNot(equals(cardFace7)));
        expect(cardFace1, isNot(equals(cardFace8)));
        expect(cardFace1, isNot(equals(cardFace9)));
      });
    },
  );
}
