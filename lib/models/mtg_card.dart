import 'package:magic_the_gathering_flutter/enums/rarity.dart';
import 'package:magic_the_gathering_flutter/errors_and_exceptions.dart';
import 'package:magic_the_gathering_flutter/models/mtg_card_face.dart';

class MTGCard extends MTGCardFace {
  final List<MTGCardFace>? cardFaces;
  final List<String> keywords;
  final String language;
  final Rarity rarity;
  final DateTime releasedAt;
  final bool reserved;
  final String setCode;
  final String setName;

  /// [rarity] and [releasedAt] not included because they are subject to change
  /// without the actual card changing.
  ///
  /// [setName] not included because [setCode] serves the same purpose.
  @override
  List<Object?> get props =>
      [
        cardFaces,
        keywords,
        language,
        setCode,
        reserved,
      ] +
      super.props;

  bool get hasMultipleFaces => cardFaces?.isNotEmpty == true;

  /// Ratio of card height / width : 3.5 inches / 2.5 inches
  ///
  /// See https://draftsim.com/mtg-card-size/
  static const sizeRatio = 1.4;

  /// Ratio of card height / corner radius: 3.5 inches / (1/8 inch)
  ///
  /// See https://draftsim.com/mtg-card-size/
  static const cornerRatio = 28;

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

  static List<MTGCardFace>? _cardFaces(dynamic value) {
    if (value == null) {
      return null;
    }
    if (value is! List) {
      throw BadDataError('card faces $value was unexpected');
    }
    if (value.isEmpty) {
      return null;
    }
    return [for (final cardFace in value) MTGCardFace.fromMap(cardFace)];
  }
}
