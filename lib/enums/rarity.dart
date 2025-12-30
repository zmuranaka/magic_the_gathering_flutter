/// Represents a Magic: The Gathering card rarity.
enum Rarity {
  /// Rarity for a [common](https://mtg.fandom.com/wiki/Common) card
  common,

  /// Rarity for an [uncommon](https://mtg.fandom.com/wiki/Uncommon) card
  uncommon,

  /// Rarity for a [rare](https://mtg.fandom.com/wiki/Rare) card
  rare,

  /// Rarity for a [mythic](https://mtg.fandom.com/wiki/Mythic) card
  mythic,

  /// Rarity for a [special](https://mtg.fandom.com/wiki/Special) card, such as
  /// [Faceless One](https://scryfall.com/card/clb/1/faceless-one)
  special,

  /// Rarity for a bonus card, such as
  /// [Black Lotus](https://scryfall.com/card/vma/4/black-lotus) in Vintage
  /// Masters
  bonus;

  /// Convert a [String] to a [Rarity]. If the [String] does not match a valid
  /// [Rarity], an [ArgumentError] is thrown.
  static Rarity fromString(String rarity) {
    return switch (rarity.toLowerCase()) {
      'common' => common,
      'uncommon' => uncommon,
      'rare' => rare,
      'mythic' => mythic,
      'special' => special,
      'bonus' => bonus,
      _ => throw ArgumentError.value(rarity, 'rarity', 'Unexpected rarity'),
    };
  }
}
