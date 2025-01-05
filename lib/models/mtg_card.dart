import 'package:magic_the_gathering_flutter/enums/rarity.dart';
import 'package:magic_the_gathering_flutter/models/mtg_card_face.dart';

/// Represents a full Magic: The Gathering card.
/// If the card has multiple faces, each of its faces is represented by an
/// [MTGCardFace] instance in [cardFaces].
class MTGCard extends MTGCardFace {
  final List<MTGCardFace>? cardFaces;
  final List<String> keywords;
  final String language;
  final Rarity rarity;
  final DateTime releasedAt;
  final bool reserved;
  final String setCode;
  final String setName;

  /// Convert a map to an [MTGCard] instance.
  /// The intended use case is to store or request JSON data and convert that
  /// to a Dart [Map], then pass that to this constructor.
  MTGCard.fromMap(Map m)
      : cardFaces = _cardFaces(m['card_faces']),
        keywords = ((m['keywords'] ?? []) as List).cast<String>(),
        language = m['lang'],
        rarity = Rarity.fromString(m['rarity']),
        releasedAt = DateTime.parse(m['released_at']),
        reserved = m['reserved'],
        setCode = m['set'],
        setName = m['set_name'],
        super.fromMap(m);

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

  /// Extension of [MTGCardFace.props].
  /// [setName] not included because [setCode] serves the same purpose.
  @override
  List<Object?> get props =>
      [
        cardFaces,
        keywords,
        language,
        rarity,
        releasedAt,
        reserved,
        setCode,
      ] +
      super.props;
}
