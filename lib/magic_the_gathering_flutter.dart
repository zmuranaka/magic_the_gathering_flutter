/// Magic The Gathering Flutter Package
/// 
/// A Flutter package for rendering Magic: The Gathering cards and symbols.
/// 
/// This package provides the following main components:
/// 
/// - [MTGCard] - A class representing a Magic: The Gathering card
/// - [MTGCardFace] - A class representing a single face of a card
///   - [MTGCardFace.preparedManaCost] - A method that returns a visual representation of mana cost
///   - [MTGCardFace.preparedOracleText] - A method that returns a visual representation of oracle text
/// - [MTGSymbol] - A class representing a Magic: The Gathering symbol
/// - [mtgSymbology] - A map of all Magic: The Gathering symbols
/// - [Rarity] - An enum representing card rarities
/// 
/// Utility functions for direct string handling:
/// - [parseManaCostString] - Parse a mana cost string (e.g., "{3}{W}") directly to widgets
/// - [parseOracleTextString] - Parse oracle text with mana symbols directly to a TextSpan
/// 
/// Example usage:
/// ```dart
/// import 'package:magic_the_gathering_flutter/magic_the_gathering_flutter.dart';
///
/// // Using with a card instance
/// final cardFace = MTGCardFace.fromMap(cardData);
/// final manaCostWidgets = cardFace.preparedManaCost();
/// final oracleTextSpan = cardFace.preparedOracleText();
///
/// // Using directly with strings
/// final manaCostWidgets = parseManaCostString('{3}{W}{U}');
/// final oracleTextSpan = parseOracleTextString('Add {W} or {U} to your mana pool');
/// ```
library magic_the_gathering_flutter;

// Enums
export 'enums/rarity.dart';

// Models - full exports for all classes and their methods
export 'models/mtg_card.dart';
export 'models/mtg_card_face.dart';
export 'models/mtg_symbology.dart';

// Utility functions for direct string handling
export 'utils/mtg_symbol_utils.dart';