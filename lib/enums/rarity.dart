import 'package:magic_the_gathering_flutter/errors_and_exceptions.dart';

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
      _ => throw BadDataError('unrecognized rarity $rarity'),
    };
  }
}
