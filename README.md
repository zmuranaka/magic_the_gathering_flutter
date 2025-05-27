Develop Magic: The Gathering (MTG) Flutter apps with ease!

## Examples

Develop custom MTG Flutter widgets easily with full support for MTG mana and all other symbols:

![Image showing four example cards](https://raw.githubusercontent.com/zmuranaka/magic_the_gathering_flutter/refs/heads/main/screenshots/screenshot_1.jpg)

Full support for "Un" sets as well:

![Image showing four example "Un" set cards](https://raw.githubusercontent.com/zmuranaka/magic_the_gathering_flutter/refs/heads/main/screenshots/screenshot_2.jpg)

## Features

* Model representing an MTG card
* Double-faced card support
* Convert JSON to model instances using `fromMap` constructor
* SVGs for all MTG symbols provided by the [mtg_symbology](https://pub.dev/packages/mtg_symbology) package.
* Minimal external dependencies - only [flutter_svg](https://pub.dev/packages/flutter_svg), [collection](https://pub.dev/packages/collection), and [mtg_symbology](https://pub.dev/packages/mtg_symbology) are used
* Works on Android, iOS, Linux, MacOS, Web, and Windows

## Getting started

You will need to provide data for the MTG cards yourself. Consider downloading or requesting some using the [Scryfall API](https://scryfall.com/docs/api) (which this package is fully interoperable with)!

Then instantiate an MtgCard using the model's `fromMap` constructor.

```dart
final blackLotus = MtgCard.fromMap({
    "keywords": [],
    "lang": "en",
    "rarity": "bonus",
    "released_at": "2014-06-16",
    "reserved": true,
    "set": "vma",
    "set_name": "Vintage Masters",
    "artist": "Chris Rahn",
    "image_uris": {
    "art_crop":
        "https://cards.scryfall.io/art_crop/front/b/d/bd8fa327-dd41-4737-8f19-2cf5eb1f7cdd.jpg?1614638838",
    },
    "mana_cost": "{0}",
    "cmc": 0.0,
    "name": "Black Lotus",
    "oracle_text":
        "{T}, Sacrifice Black Lotus: Add three mana of any one color.",
    "type_line": "Artifact",
});
```

A default constructor is not currently supported for the `MtgCard` model. The recommended use case is to store or request the MTG card data as JSON and parse it into Dart `Map` objects.

## API

### MtgCard

#### Properties

| Property           | Description                                            | Return Type     |
| :----------------- | :----------------------------------------------------- | :-------------- |
| hasMultipleFaces   | Whether the card object has more than one face         | `bool`          |
| sizeRatio          | The ratio of an MTG card's height to its width         | `double`        |
| cornerRatio        | The ratio of an MTG card's height to its corner radius | `int`           |

### MtgCardFace

[MtgCard](https://pub.dev/documentation/magic_the_gathering_flutter/latest/models_mtg_card/MtgCard-class.html) extends [MtgCardFace](https://pub.dev/documentation/magic_the_gathering_flutter/latest/models_mtg_card_face/MtgCardFace-class.html), so all its methods are accessible from [MtgCard](https://pub.dev/documentation/magic_the_gathering_flutter/latest/models_mtg_card/MtgCard-class.html) instances as well.

#### Methods

| Method             | Description                                            | Return Type     |
| :----------------- | :----------------------------------------------------- | :-------------- |
| preparedManaCost   | Displays the card's mana cost using MTG symbol SVGs    | `List<Widget>?` |
| preparedOracleText | Displays the card's oracle text using MTG symbol SVGs  | `TextSpan?`     |

## Example

Below shows an example of how to display a simple widget. The example assumed you already have an `MtgCard` instance named `blackLotus`.

```dart
final cardImage = blackLotus.images?['art_crop'];
final child = Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    Row(
      children: [
        Text(blackLotus.name),
        const Spacer(),
        ...?blackLotus.preparedManaCost(),
      ],
    ),
    const SizedBox(height: 8.0),
    if (cardImage != null) Image.network(cardImage),
    const SizedBox(height: 8.0),
    Text(blackLotus.typeLine),
    Text.rich(blackLotus.preparedOracleText() ??
        TextSpan(text: blackLotus.oracleText)),
  ],
);
return Scaffold(
  appBar: AppBar(
    backgroundColor: Theme.of(context).colorScheme.inversePrimary,
    title: Text('Magic: the Gathering Flutter App'),
  ),
  body: SafeArea(
    child: Center(child: child),
  ),
);
```

For a more detailed example, look in the [example](https://github.com/zmuranaka/magic_the_gathering_flutter/tree/main/example) directory.

## Contributing

Contributions are welcome!

In order for a contribution to be considered, it must follow the linter rules in the [analysis_options](https://github.com/zmuranaka/scryfall_api_symbols/blob/master/analysis_options.yaml) file. Also, if new functionality is being added, tests should be added for that new functionality.

## Legal

As part of the [Wizards of the Coast Fan Content Policy](https://company.wizards.com/en/legal/fancontentpolicy),
this package is provided free of charge to view, access, share, and use without paying for anything, obtaining any approval, or giving anyone credit.

[magic_the_gathering_flutter](https://pub.dev/packages/magic_the_gathering_flutter) is unofficial Fan Content permitted under the Fan Content Policy. Not approved/endorsed by Wizards. Portions of the materials used are property of Wizards of the Coast. ©Wizards of the Coast LLC.
