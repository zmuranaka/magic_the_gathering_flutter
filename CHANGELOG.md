## 1.0.3

* Add [Legal](https://pub.dev/packages/magic_the_gathering_flutter#legal) section to the README

## 1.0.2

* Add `MTGCardFace` fields dartdoc comments
* Add `MTGCard` fields dartdoc comments
* Add `MTGSymbol` fields dartdoc comments
* Bump `flutter_lints: ^5.0.0` and address two new lints
* Bump `sdk: ^3.6.0`
* Remove the (currently unused) `flutter_test` as a dev dependency

## 1.0.1

* Add `rarity` & `releasedAt` to `MTGCard.props`
    * One could reasonably expect that if the set is expected to change equality that the `rarity` & `releasedAt` should as well
* Add `MTGCard` dartdoc comments and move a few things around
* Add `mtg_card_face.dart` dartdoc comments and move a few of the things around (but no functional changes)
* Add `mtg_symbology.dart` dartdoc comments and move a few of the things around (but no functional changes)
* Add `Rarity` dartdoc comments
* Improve `pubspec.yaml` description to avoid pub reporting "The package description is too short."

## 1.0.0

Initial stable release.
