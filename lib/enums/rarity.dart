enum Rarity {
  common,
  uncommon,
  rare,
  mythic,
  special,
  bonus;

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
