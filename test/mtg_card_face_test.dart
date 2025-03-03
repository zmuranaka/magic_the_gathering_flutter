import 'package:magic_the_gathering_flutter/models/mtg_card_face.dart';
import 'package:test/test.dart';

void main() {
  group(
    'MTGCardFace equality tests',
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
      test('MTGCardFace is equal to itself', () {
        final cardFace = MTGCardFace.fromMap(cardFaceJson);
        expect(cardFace, equals(cardFace));
      });
      test('MTGCardFace with same properties are equal', () {
        final cardFace1 = MTGCardFace.fromMap(cardFaceJson);
        final cardFace2 = MTGCardFace.fromMap(cardFaceJson);
        expect(cardFace1, equals(cardFace2));
      });
      test(
        'MTGCardFace equality ignores non-equality of irrelevant parameters',
        () {
          final cardFace1 = MTGCardFace.fromMap(cardFaceJson);
          final cardFace2 = MTGCardFace.fromMap(
            cardFaceJson..['some_other_key'] = 'new text',
          );
          expect(cardFace1, equals(cardFace2));
        },
      );
      test('MTGCardFace with different properties are not equal', () {
        final cardFace1 = MTGCardFace.fromMap(cardFaceJson);
        final cardFace2 = MTGCardFace.fromMap(
          cardFaceJson..['artist'] = 'different text',
        );
        final cardFace3 = MTGCardFace.fromMap(
          cardFaceJson..['image_uris'] = null,
        );
        final cardFace4 = MTGCardFace.fromMap(
          cardFaceJson..['mana_cost'] = 'different text',
        );
        final cardFace5 = MTGCardFace.fromMap(
          cardFaceJson..['name'] = 'different text',
        );
        final cardFace6 = MTGCardFace.fromMap(
          cardFaceJson..['oracle_text'] = 'different text',
        );
        final cardFace7 = MTGCardFace.fromMap(
          cardFaceJson..['power'] = 'different text',
        );
        final cardFace8 = MTGCardFace.fromMap(
          cardFaceJson..['toughness'] = 'different text',
        );
        final cardFace9 = MTGCardFace.fromMap(
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
