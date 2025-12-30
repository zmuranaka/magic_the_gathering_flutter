## 2.0.1 - December 30, 2025

* Make minimum supported [flutter_svg](https://pub.dev/packages/flutter_svg) version 2.2.3
* Make minimum supported SDK version Flutter 3.32/Dart 3.8 - in line with [flutter_svg](https://github.com/flutter/packages/blob/30dd810481e42642b8910503f4f45a4f81b5f31d/third_party/packages/flutter_svg/pubspec.yaml#L8-L9)
* Upgrade [flutter_lints](https://pub.dev/packages/flutter_lints) and [test](https://pub.dev/packages/test) dev dependency versions
* Update some of the android and ios files in the [example](https://github.com/zmuranaka/magic_the_gathering_flutter/tree/main/example)

## 2.0.0

* This package now depends on [mtg_symbology](https://pub.dev/packages/mtg_symbology)
    * **Breaking** - The SVG asset paths are `'packages/mtg_symbology/assets/ASSET_NAME.svg'` now instead of `'packages/magic_the_gathering_flutter/assets/ASSET_NAME.svg'`
    * This package re-exports [mtg_symbology](https://pub.dev/packages/mtg_symbology), so there should not be other breaking changes
* Renaming classes
    * **Breaking** - `MTGCard` renamed to `MtgCard`
    * **Breaking** - `MTGCardFace` renamed to `MtgCardFace`
* Bumps minimum [flutter_svg](https://pub.dev/packages/flutter_svg) version to `2.1.0`
* **Breaking** - Makes minimum Flutter version 3.27.0 - in line with [flutter_svg](https://github.com/flutter/packages/blob/c19f8399160d70cbcd874ec503aedc48aa9ce828/third_party/packages/flutter_svg/pubspec.yaml#L9)

## 1.0.5

* Add exports to `magic_the_gathering_flutter.dart` for simpler importing.
* Update the `README.md` with documentation for `mtgSymbology` and `MTGCardFace`
* Update the example project to import the library file directly and bump the example's version to 1.0.1

## 1.0.4

* Remove [equatable](https://pub.dev/packages/equatable) as a dependency. The `==` and `hashCode` for the relevant classes are now manually overridden, using [collection](https://pub.dev/packages/collection) when necessary.
* Add tests for this equality

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
