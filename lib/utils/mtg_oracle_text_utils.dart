import 'package:flutter/material.dart';
import 'package:magic_the_gathering_flutter/models/mtg_symbology.dart';

/// Utility class for parsing and analyzing Oracle text from Magic: The Gathering cards.
///
/// Provides static methods for converting Oracle text into rich visual representations,
/// extracting rules, identifying keywords, and performing other text analysis operations.
class MTGOracleTextUtils {
  /// Common Magic: The Gathering keywords
  static const Set<String> commonKeywords = {
    'Flying', 'First strike', 'Double strike', 'Deathtouch', 'Hexproof',
    'Indestructible', 'Lifelink', 'Menace', 'Reach', 'Trample', 'Vigilance',
    'Flash', 'Defender', 'Haste', 'Protection', 'Shroud', 'Ward',
    'Equip', 'Bestow', 'Cascade', 'Prowess', 'Convoke', 'Delve', 'Surge',
    'Affinity', 'Partner', 'Phasing', 'Changeling', 'Morph', 'Megamorph',
    'Foretell', 'Mutate', 'Flashback', 'Disturb', 'Emerge', 'Entwine',
    'Miracle', 'Kicker', 'Multikicker', 'Replicate', 'Suspend', 'Cycling',
    'Evoke', 'Dash', 'Aftermath', 'Split second', 'Madness', 'Prowl',
    'Extort', 'Cipher', 'Exploit', 'Improvise', 'Devoid', 'Amplify',
    'Vanishing', 'Soulshift', 'Bushido', 'Graft', 'Exalted', 'Tribute',
    'Annihilator', 'Fading', 'Cumulative upkeep', 'Persist', 'Undying',
    'Infect', 'Wither', 'Modular', 'Bloodthirst', 'Haunt', 'Landwalk',
    'Epic', 'Storm', 'Ripple', 'Scry', 'Fabricate', 'Bolster',
    'Threshold', 'Boast', 'Daybound', 'Nightbound', 'Perpetual', 'Seek',
    'Conjure', 'Cleave', 'Training', 'Blend', 'Connive', 'Backup', 'Transmute',
    'Proliferate', 'Populate', 'Monstrosity', 'Adapt', 'Ascend', 'Explore',
    'Amass', 'Totem armor', 'Jump-start', 'Riot', 'Spectacle', 'Unleash',
    'Afterlife', 'Undergrowth', 'Surveil',
  };

  /// Common types of abilities in Magic: The Gathering
  static const Set<String> abilityTypes = {
    'activated', 'triggered', 'static', 'mana', 'loyalty', 'spell', 
    'evasion', 'replacement', 'characteristic-defining'
  };

  /// Parses Oracle text and returns a visual representation with symbols replaced.
  ///
  /// Example:
  /// ```dart
  /// TextSpan? richText = MTGOracleTextUtils.parseOracleText("Add {W} or {U} to your mana pool.");
  /// ```
  ///
  /// Returns a TextSpan with embedded SVG widgets for mana symbols, or null if the input is null.
  static TextSpan? parseOracleText(String? oracleText) {
    if (oracleText == null) {
      return null;
    }
    
    Iterable<RegExpMatch> matches = MTGSymbol.regex.allMatches(oracleText);
    if (matches.isEmpty) {
      return TextSpan(text: oracleText);
    }
    
    final List<InlineSpan> children = [];
    int lastIndex = 0;
    
    for (RegExpMatch match in matches) {
      // Add text before the symbol
      children.add(
        TextSpan(text: oracleText.substring(lastIndex, match.start)),
      );
      
      // Add the symbol as a widget
      String? matchedSymbol = match.group(0);
      final MTGSymbol? mtgSymbol = mtgSymbology[matchedSymbol];
      if (mtgSymbol == null) {
        throw ArgumentError.value(
          matchedSymbol,
          'matchedSymbol',
          'Unexpected MTG symbol',
        );
      }
      
      children.add(WidgetSpan(child: mtgSymbol.toSvg()));
      lastIndex = match.end;
    }
    
    // Add remaining text after the last symbol
    children.add(TextSpan(text: oracleText.substring(lastIndex)));
    
    return TextSpan(children: children);
  }

  /// Splits Oracle text into individual rules/abilities sections
  ///
  /// Example:
  /// ```dart
  /// List<String> rules = MTGOracleTextUtils.splitIntoRules(
  ///   "Flying\nWhen this creature enters the battlefield, draw a card."
  /// );
  /// // Returns ["Flying", "When this creature enters the battlefield, draw a card."]
  /// ```
  static List<String> splitIntoRules(String? oracleText) {
    if (oracleText == null || oracleText.isEmpty) {
      return [];
    }
    
    // Split on newlines and remove empty strings
    return oracleText
        .split('\n')
        .map((s) => s.trim())
        .where((s) => s.isNotEmpty)
        .toList();
  }

  /// Extracts all keywords from Oracle text
  ///
  /// Example:
  /// ```dart
  /// Set<String> keywords = MTGOracleTextUtils.extractKeywords(
  ///   "Flying, first strike\nWhen this creature enters the battlefield, draw a card."
  /// );
  /// // Returns {"Flying", "First strike"}
  /// ```
  static Set<String> extractKeywords(String? oracleText) {
    if (oracleText == null || oracleText.isEmpty) {
      return {};
    }
    
    final Set<String> foundKeywords = {};
    final rules = splitIntoRules(oracleText);
    
    for (final rule in rules) {
      // Check for rules that are purely keywords or comma-separated keyword lists
      if (!rule.contains('.') && !rule.contains(':')) {
        final keywordCandidates = rule.split(',').map((s) => s.trim());
        
        for (final candidate in keywordCandidates) {
          // Try to match the full keyword
          if (commonKeywords.contains(candidate)) {
            foundKeywords.add(candidate);
            continue;
          }
          
          // Try to match keywords with parameters like "Protection from black"
          for (final keyword in commonKeywords) {
            if (candidate.startsWith('$keyword ')) {
              foundKeywords.add(candidate);
              break;
            }
          }
        }
      }
    }
    
    return foundKeywords;
  }

  /// Categorizes abilities in Oracle text by type (activated, triggered, static, etc.)
  ///
  /// Example:
  /// ```dart
  /// Map<String, List<String>> abilities = MTGOracleTextUtils.categorizeAbilities(
  ///   "{T}: Add {W}.\nWhenever you gain life, put a +1/+1 counter on this creature."
  /// );
  /// // Returns {
  /// //   "activated": ["{T}: Add {W}."],
  /// //   "triggered": ["Whenever you gain life, put a +1/+1 counter on this creature."]
  /// // }
  /// ```
  static Map<String, List<String>> categorizeAbilities(String? oracleText) {
    final Map<String, List<String>> categorizedAbilities = {};
    
    for (final type in abilityTypes) {
      categorizedAbilities[type] = [];
    }
    
    if (oracleText == null || oracleText.isEmpty) {
      return categorizedAbilities;
    }
    
    final rules = splitIntoRules(oracleText);
    
    for (final rule in rules) {
      // Check for activated abilities (contain a colon)
      if (rule.contains(':')) {
        categorizedAbilities['activated']!.add(rule);
      } 
      // Check for triggered abilities (start with "When", "Whenever", "At", etc.)
      else if (RegExp(r'^(When|Whenever|At|If)').hasMatch(rule)) {
        categorizedAbilities['triggered']!.add(rule);
      }
      // Check for static abilities (not triggered or activated)
      else if (!rule.contains(':') && 
              !RegExp(r'^(When|Whenever|At|If)').hasMatch(rule) &&
              !rule.contains('.')) {
        categorizedAbilities['static']!.add(rule);
      }
      // Check for potential mana abilities
      if (rule.contains('Add') && 
          RegExp(r'Add (\{[WUBRGC\d]/[WUBRGC\d]\}|\{[WUBRGC\d]\})').hasMatch(rule)) {
        categorizedAbilities['mana']!.add(rule);
      }
    }
    
    // Remove empty categories
    categorizedAbilities.removeWhere((key, value) => value.isEmpty);
    
    return categorizedAbilities;
  }

  /// Calculates the approximate complexity of the Oracle text
  /// Returns a score from 0-10 where higher values indicate more complex text
  ///
  /// Example:
  /// ```dart
  /// double complexity = MTGOracleTextUtils.calculateComplexity(
  ///   "Flying, vigilance\n{T}: Add {G}."
  /// );
  /// // Returns a complexity score based on text length, number of abilities, etc.
  /// ```
  static double calculateComplexity(String? oracleText) {
    if (oracleText == null || oracleText.isEmpty) {
      return 0.0;
    }
    
    // Factors that influence complexity:
    // 1. Text length
    // 2. Number of different abilities
    // 3. Number of symbols
    // 4. Number of choice words ("may", "choose", "either/or")
    // 5. Number of conditional clauses
    
    double score = 0.0;
    
    // 1. Text length (0-3 points)
    final length = oracleText.length;
    if (length > 500) score += 3.0;
    else if (length > 300) score += 2.0;
    else if (length > 150) score += 1.0;
    else score += length / 150.0;
    
    // 2. Number of different abilities (0-3 points)
    final abilities = categorizeAbilities(oracleText);
    score += abilities.length * 0.75;
    
    // 3. Number of symbols (0-1 points)
    final symbolCount = MTGSymbol.regex.allMatches(oracleText).length;
    score += symbolCount > 10 ? 1.0 : symbolCount / 10.0;
    
    // 4. Choice complexity (0-2 points)
    final choiceMatches = RegExp(r'may|choose|either|or |target |modal').allMatches(oracleText);
    score += choiceMatches.length > 8 ? 2.0 : choiceMatches.length / 4.0;
    
    // 5. Conditional complexity (0-1 points)
    final conditionalMatches = RegExp(r'if|when|whenever|unless|until|while').allMatches(oracleText);
    score += conditionalMatches.length > 5 ? 1.0 : conditionalMatches.length / 5.0;
    
    // Cap at 10
    return score > 10.0 ? 10.0 : score;
  }

  /// Detects if the card has any ETB (Enter-The-Battlefield) effects
  ///
  /// Example:
  /// ```dart
  /// bool hasEtb = MTGOracleTextUtils.hasETBEffect(
  ///   "When this creature enters the battlefield, draw a card."
  /// );
  /// // Returns true
  /// ```
  static bool hasETBEffect(String? oracleText) {
    if (oracleText == null || oracleText.isEmpty) {
      return false;
    }
    
    return oracleText.toLowerCase().contains('enters the battlefield') ||
           RegExp(r'when ~.+?enters the battlefield', caseSensitive: false).hasMatch(oracleText);
  }

  /// Detects if the card is a mana producer
  ///
  /// Example:
  /// ```dart
  /// bool producesMana = MTGOracleTextUtils.isManaProducer(
  ///   "{T}: Add {G}."
  /// );
  /// // Returns true
  /// ```
  static bool isManaProducer(String? oracleText) {
    if (oracleText == null || oracleText.isEmpty) {
      return false;
    }
    
    return RegExp(r'Add (\{[WUBRGC\d]/[WUBRGC\d]\}|\{[WUBRGC\d]\})').hasMatch(oracleText);
  }

  /// Returns a RichText widget for displaying Oracle text
  ///
  /// Example:
  /// ```dart
  /// RichText richText = MTGOracleTextUtils.buildRichText(
  ///   "Add {W} or {U} to your mana pool.",
  ///   style: TextStyle(fontSize: 14.0),
  /// );
  /// ```
  static RichText buildRichText(String? oracleText, {TextStyle? style}) {
    return RichText(
      text: parseOracleText(oracleText) ?? const TextSpan(text: ''),
      textAlign: TextAlign.center,
      textScaleFactor: 1.0,
      softWrap: true,
      overflow: TextOverflow.clip,
      textDirection: TextDirection.ltr,
      maxLines: null,
      locale: const Locale('en', 'US'),
      strutStyle: StrutStyle.fromTextStyle(
        style ?? const TextStyle(),
        forceStrutHeight: false,
      ),
      textWidthBasis: TextWidthBasis.parent,
      textHeightBehavior: const TextHeightBehavior(),
    );
  }
}