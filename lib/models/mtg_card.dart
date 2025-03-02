import 'package:collection/collection.dart';
import 'package:magic_the_gathering_flutter/enums/rarity.dart';
import 'package:magic_the_gathering_flutter/models/mtg_card_face.dart';

/// Represents a full Magic: The Gathering card.
/// If the card has multiple faces, each of its faces is represented by an
/// [MTGCardFace] instance in [cardFaces].
class MTGCard extends MTGCardFace {
  /// All of the card's faces as a [List] of [MTGCardFace] instances.
  /// This will be `null` if the card does not have any faces
  /// (it will never be an empty [List]).
  final List<MTGCardFace>? cardFaces;

  /// A [List] of keywords that this card uses, such as `'Flying'` and
  /// `'Cumulative upkeep'`.
  final List<String> keywords;

  /// A language code for this printing.
  final String language;

  /// This card's rarity as a [Rarity].
  final Rarity rarity;

  /// The date this card was first released.
  final DateTime releasedAt;

  /// Whether this card is on the Reserved List.
  final bool reserved;

  /// This card's set code, such as `'blb'` for Bloomburrow.
  final String setCode;

  /// This card's full set name, such as `'Bloomburrow'`.
  final String setName;

  /// Convert a map to an [MTGCard] instance.
  /// The intended use case is to store or request JSON data and convert that
  /// to a Dart [Map], then pass that to this constructor.
  MTGCard.fromMap(super.m)
      : cardFaces = _cardFaces(m['card_faces']),
        keywords = ((m['keywords'] ?? []) as List).cast<String>(),
        language = m['lang'],
        rarity = Rarity.fromString(m['rarity']),
        releasedAt = DateTime.parse(m['released_at']),
        reserved = m['reserved'],
        setCode = m['set'],
        setName = m['set_name'],
        super.fromMap();

  /// Method used to parse [cardFaces]. Not intended for external use.
  static List<MTGCardFace>? _cardFaces(dynamic value) {
    if (value == null) {
      return null;
    }
    if (value is! List) {
      throw ArgumentError.value(value, 'value', 'Expected type List');
    }
    if (value.isEmpty) {
      return null;
    }
    return [for (final cardFace in value) MTGCardFace.fromMap(cardFace)];
  }

  /// Returns true if the card has multiple faces
  bool get hasMultipleFaces => cardFaces?.isNotEmpty == true;

  /// Ratio of card height / width : 3.5 inches / 2.5 inches
  ///
  /// See https://draftsim.com/mtg-card-size/
  static const sizeRatio = 1.4;

  /// Ratio of card height / corner radius: 3.5 inches / (1/8 inch)
  ///
  /// See https://draftsim.com/mtg-card-size/
  static const cornerRatio = 28;

  /// Allows two instances of [MTGCard] to be considered equal if the relevant
  /// properties are equal.
  ///
  /// [setName] not included because [setCode] serves the same purpose.
  /// [manaValue] not included in determining equality because [manaCost]
  /// serves the same purpose.
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    const deepEquality = DeepCollectionEquality();
    return other is MTGCard &&
        runtimeType == other.runtimeType &&
        deepEquality.equals(cardFaces, other.cardFaces) &&
        deepEquality.equals(keywords, other.keywords) &&
        language == other.language &&
        rarity == other.rarity &&
        releasedAt == other.releasedAt &&
        reserved == other.reserved &&
        setCode == other.setCode &&
        artist == other.artist &&
        flavorText == other.flavorText &&
        deepEquality.equals(images, other.images) &&
        manaCost == other.manaCost &&
        name == other.name &&
        oracleText == other.oracleText &&
        power == other.power &&
        toughness == other.toughness &&
        typeLine == other.typeLine;
  }

  /// Necessary for [==] to work properly.
  @override
  int get hashCode {
    const deepEquality = DeepCollectionEquality();
    return Object.hash(
      deepEquality.hash(cardFaces),
      deepEquality.hash(keywords),
      language,
      rarity,
      releasedAt,
      reserved,
      setCode,
      artist,
      flavorText,
      deepEquality.hash(images),
      manaCost,
      name,
      oracleText,
      power,
      toughness,
      typeLine,
    );
  }
}
