/// Represents a Magic: The Gathering card rarity.
enum Rarity {
  common,
  uncommon,
  rare,
  mythic,
  special,
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
