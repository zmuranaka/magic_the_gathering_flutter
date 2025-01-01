import 'package:equatable/equatable.dart';
import 'package:flutter_svg/flutter_svg.dart' show SvgPicture;

const Map<String, MTGSymbol> mtgSymbology = {
  '{T}': MTGSymbol(
    image: 'packages/magic_the_gathering_flutter/assets/T.svg',
    looseVariant: null,
    english: 'tap this permanent',
    manaValue: 0,
  ),
  '{Q}': MTGSymbol(
    image: 'packages/magic_the_gathering_flutter/assets/Q.svg',
    looseVariant: null,
    english: 'untap this permanent',
    manaValue: 0,
  ),
  '{E}': MTGSymbol(
    image: 'packages/magic_the_gathering_flutter/assets/E.svg',
    looseVariant: null,
    english: 'an energy counter',
    manaValue: 0,
  ),
  '{P}': MTGSymbol(
    image: 'packages/magic_the_gathering_flutter/assets/P.svg',
    looseVariant: null,
    english: 'modal budget pawprint',
    manaValue: 0,
  ),
  '{PW}': MTGSymbol(
    image: 'packages/magic_the_gathering_flutter/assets/PW.svg',
    looseVariant: null,
    english: 'planeswalker',
    manaValue: 0,
  ),
  '{CHAOS}': MTGSymbol(
    image: 'packages/magic_the_gathering_flutter/assets/CHAOS.svg',
    looseVariant: null,
    english: 'chaos',
    manaValue: 0,
  ),
  '{A}': MTGSymbol(
    image: 'packages/magic_the_gathering_flutter/assets/A.svg',
    looseVariant: null,
    english: 'an acorn counter',
    manaValue: 0,
  ),
  '{TK}': MTGSymbol(
    image: 'packages/magic_the_gathering_flutter/assets/TK.svg',
    looseVariant: null,
    english: 'a ticket counter',
    manaValue: 0,
  ),
  '{X}': MTGSymbol(
    image: 'packages/magic_the_gathering_flutter/assets/X.svg',
    looseVariant: 'X',
    english: 'X generic mana',
    manaValue: 0,
  ),
  '{Y}': MTGSymbol(
    image: 'packages/magic_the_gathering_flutter/assets/Y.svg',
    looseVariant: 'Y',
    english: 'Y generic mana',
    manaValue: 0,
  ),
  '{Z}': MTGSymbol(
    image: 'packages/magic_the_gathering_flutter/assets/Z.svg',
    looseVariant: 'Z',
    english: 'Z generic mana',
    manaValue: 0,
  ),
  '{0}': MTGSymbol(
    image: 'packages/magic_the_gathering_flutter/assets/0.svg',
    looseVariant: '0',
    english: 'zero mana',
    manaValue: 0,
  ),
  '{½}': MTGSymbol(
    image: 'packages/magic_the_gathering_flutter/assets/HALF.svg',
    looseVariant: '½',
    english: 'one-half generic mana',
    manaValue: 0.5,
  ),
  '{1}': MTGSymbol(
    image: 'packages/magic_the_gathering_flutter/assets/1.svg',
    looseVariant: '1',
    english: 'one generic mana',
    manaValue: 1,
  ),
  '{2}': MTGSymbol(
    image: 'packages/magic_the_gathering_flutter/assets/2.svg',
    looseVariant: '2',
    english: 'two generic mana',
    manaValue: 2,
  ),
  '{3}': MTGSymbol(
    image: 'packages/magic_the_gathering_flutter/assets/3.svg',
    looseVariant: '3',
    english: 'three generic mana',
    manaValue: 3,
  ),
  '{4}': MTGSymbol(
    image: 'packages/magic_the_gathering_flutter/assets/4.svg',
    looseVariant: '4',
    english: 'four generic mana',
    manaValue: 4,
  ),
  '{5}': MTGSymbol(
    image: 'packages/magic_the_gathering_flutter/assets/5.svg',
    looseVariant: '5',
    english: 'five generic mana',
    manaValue: 5,
  ),
  '{6}': MTGSymbol(
    image: 'packages/magic_the_gathering_flutter/assets/6.svg',
    looseVariant: '6',
    english: 'six generic mana',
    manaValue: 6,
  ),
  '{7}': MTGSymbol(
    image: 'packages/magic_the_gathering_flutter/assets/7.svg',
    looseVariant: '7',
    english: 'seven generic mana',
    manaValue: 7,
  ),
  '{8}': MTGSymbol(
    image: 'packages/magic_the_gathering_flutter/assets/8.svg',
    looseVariant: '8',
    english: 'eight generic mana',
    manaValue: 8,
  ),
  '{9}': MTGSymbol(
    image: 'packages/magic_the_gathering_flutter/assets/9.svg',
    looseVariant: '9',
    english: 'nine generic mana',
    manaValue: 9,
  ),
  '{10}': MTGSymbol(
    image: 'packages/magic_the_gathering_flutter/assets/10.svg',
    looseVariant: '10',
    english: 'ten generic mana',
    manaValue: 10,
  ),
  '{11}': MTGSymbol(
    image: 'packages/magic_the_gathering_flutter/assets/11.svg',
    looseVariant: '11',
    english: 'eleven generic mana',
    manaValue: 11,
  ),
  '{12}': MTGSymbol(
    image: 'packages/magic_the_gathering_flutter/assets/12.svg',
    looseVariant: '12',
    english: 'twelve generic mana',
    manaValue: 12,
  ),
  '{13}': MTGSymbol(
    image: 'packages/magic_the_gathering_flutter/assets/13.svg',
    looseVariant: '13',
    english: 'thirteen generic mana',
    manaValue: 13,
  ),
  '{14}': MTGSymbol(
    image: 'packages/magic_the_gathering_flutter/assets/14.svg',
    looseVariant: '14',
    english: 'fourteen generic mana',
    manaValue: 14,
  ),
  '{15}': MTGSymbol(
    image: 'packages/magic_the_gathering_flutter/assets/15.svg',
    looseVariant: '15',
    english: 'fifteen generic mana',
    manaValue: 15,
  ),
  '{16}': MTGSymbol(
    image: 'packages/magic_the_gathering_flutter/assets/16.svg',
    looseVariant: '16',
    english: 'sixteen generic mana',
    manaValue: 16,
  ),
  '{17}': MTGSymbol(
    image: 'packages/magic_the_gathering_flutter/assets/17.svg',
    looseVariant: '17',
    english: 'seventeen generic mana',
    manaValue: 17,
  ),
  '{18}': MTGSymbol(
    image: 'packages/magic_the_gathering_flutter/assets/18.svg',
    looseVariant: '18',
    english: 'eighteen generic mana',
    manaValue: 18,
  ),
  '{19}': MTGSymbol(
    image: 'packages/magic_the_gathering_flutter/assets/19.svg',
    looseVariant: '19',
    english: 'nineteen generic mana',
    manaValue: 19,
  ),
  '{20}': MTGSymbol(
    image: 'packages/magic_the_gathering_flutter/assets/20.svg',
    looseVariant: '20',
    english: 'twenty generic mana',
    manaValue: 20,
  ),
  '{100}': MTGSymbol(
    image: 'packages/magic_the_gathering_flutter/assets/100.svg',
    looseVariant: '100',
    english: 'one hundred generic mana',
    manaValue: 100,
  ),
  '{1000000}': MTGSymbol(
    image: 'packages/magic_the_gathering_flutter/assets/1000000.svg',
    looseVariant: '1000000',
    english: 'one million generic mana',
    manaValue: 1000000,
  ),
  '{∞}': MTGSymbol(
    image: 'packages/magic_the_gathering_flutter/assets/INFINITY.svg',
    looseVariant: '∞',
    english: 'infinite generic mana',
    manaValue: null,
  ),
  '{W/U}': MTGSymbol(
    image: 'packages/magic_the_gathering_flutter/assets/WU.svg',
    looseVariant: null,
    english: 'one white or blue mana',
    manaValue: 1,
  ),
  '{W/B}': MTGSymbol(
    image: 'packages/magic_the_gathering_flutter/assets/WB.svg',
    looseVariant: null,
    english: 'one white or black mana',
    manaValue: 1,
  ),
  '{B/R}': MTGSymbol(
    image: 'packages/magic_the_gathering_flutter/assets/BR.svg',
    looseVariant: null,
    english: 'one black or red mana',
    manaValue: 1,
  ),
  '{B/G}': MTGSymbol(
    image: 'packages/magic_the_gathering_flutter/assets/BG.svg',
    looseVariant: null,
    english: 'one black or green mana',
    manaValue: 1,
  ),
  '{U/B}': MTGSymbol(
    image: 'packages/magic_the_gathering_flutter/assets/UB.svg',
    looseVariant: null,
    english: 'one blue or black mana',
    manaValue: 1,
  ),
  '{U/R}': MTGSymbol(
    image: 'packages/magic_the_gathering_flutter/assets/UR.svg',
    looseVariant: null,
    english: 'one blue or red mana',
    manaValue: 1,
  ),
  '{R/G}': MTGSymbol(
    image: 'packages/magic_the_gathering_flutter/assets/RG.svg',
    looseVariant: null,
    english: 'one red or green mana',
    manaValue: 1,
  ),
  '{R/W}': MTGSymbol(
    image: 'packages/magic_the_gathering_flutter/assets/RW.svg',
    looseVariant: null,
    english: 'one red or white mana',
    manaValue: 1,
  ),
  '{G/W}': MTGSymbol(
    image: 'packages/magic_the_gathering_flutter/assets/GW.svg',
    looseVariant: null,
    english: 'one green or white mana',
    manaValue: 1,
  ),
  '{G/U}': MTGSymbol(
    image: 'packages/magic_the_gathering_flutter/assets/GU.svg',
    looseVariant: null,
    english: 'one green or blue mana',
    manaValue: 1,
  ),
  '{B/G/P}': MTGSymbol(
    image: 'packages/magic_the_gathering_flutter/assets/BGP.svg',
    looseVariant: null,
    english: 'one black mana, one green mana, or 2 life',
    manaValue: 1,
  ),
  '{B/R/P}': MTGSymbol(
    image: 'packages/magic_the_gathering_flutter/assets/BRP.svg',
    looseVariant: null,
    english: 'one black mana, one red mana, or 2 life',
    manaValue: 1,
  ),
  '{G/U/P}': MTGSymbol(
    image: 'packages/magic_the_gathering_flutter/assets/GUP.svg',
    looseVariant: null,
    english: 'one green mana, one blue mana, or 2 life',
    manaValue: 1,
  ),
  '{G/W/P}': MTGSymbol(
    image: 'packages/magic_the_gathering_flutter/assets/GWP.svg',
    looseVariant: null,
    english: 'one green mana, one white mana, or 2 life',
    manaValue: 1,
  ),
  '{R/G/P}': MTGSymbol(
    image: 'packages/magic_the_gathering_flutter/assets/RGP.svg',
    looseVariant: null,
    english: 'one red mana, one green mana, or 2 life',
    manaValue: 1,
  ),
  '{R/W/P}': MTGSymbol(
    image: 'packages/magic_the_gathering_flutter/assets/RWP.svg',
    looseVariant: null,
    english: 'one red mana, one white mana, or 2 life',
    manaValue: 1,
  ),
  '{U/B/P}': MTGSymbol(
    image: 'packages/magic_the_gathering_flutter/assets/UBP.svg',
    looseVariant: null,
    english: 'one blue mana, one black mana, or 2 life',
    manaValue: 1,
  ),
  '{U/R/P}': MTGSymbol(
    image: 'packages/magic_the_gathering_flutter/assets/URP.svg',
    looseVariant: null,
    english: 'one blue mana, one red mana, or 2 life',
    manaValue: 1,
  ),
  '{W/B/P}': MTGSymbol(
    image: 'packages/magic_the_gathering_flutter/assets/WBP.svg',
    looseVariant: null,
    english: 'one white mana, one black mana, or 2 life',
    manaValue: 1,
  ),
  '{W/U/P}': MTGSymbol(
    image: 'packages/magic_the_gathering_flutter/assets/WUP.svg',
    looseVariant: null,
    english: 'one white mana, one blue mana, or 2 life',
    manaValue: 1,
  ),
  '{C/W}': MTGSymbol(
    image: 'packages/magic_the_gathering_flutter/assets/CW.svg',
    looseVariant: null,
    english: 'one colorless mana or one white mana',
    manaValue: 1,
  ),
  '{C/U}': MTGSymbol(
    image: 'packages/magic_the_gathering_flutter/assets/CU.svg',
    looseVariant: null,
    english: 'one colorless mana or one blue mana',
    manaValue: 1,
  ),
  '{C/B}': MTGSymbol(
    image: 'packages/magic_the_gathering_flutter/assets/CB.svg',
    looseVariant: null,
    english: 'one colorless mana or one black mana',
    manaValue: 1,
  ),
  '{C/R}': MTGSymbol(
    image: 'packages/magic_the_gathering_flutter/assets/CR.svg',
    looseVariant: null,
    english: 'one colorless mana or one red mana',
    manaValue: 1,
  ),
  '{C/G}': MTGSymbol(
    image: 'packages/magic_the_gathering_flutter/assets/CG.svg',
    looseVariant: null,
    english: 'one colorless mana or one green mana',
    manaValue: 1,
  ),
  '{2/W}': MTGSymbol(
    image: 'packages/magic_the_gathering_flutter/assets/2W.svg',
    looseVariant: null,
    english: 'two generic mana or one white mana',
    manaValue: 2,
  ),
  '{2/U}': MTGSymbol(
    image: 'packages/magic_the_gathering_flutter/assets/2U.svg',
    looseVariant: null,
    english: 'two generic mana or one blue mana',
    manaValue: 2,
  ),
  '{2/B}': MTGSymbol(
    image: 'packages/magic_the_gathering_flutter/assets/2B.svg',
    looseVariant: null,
    english: 'two generic mana or one black mana',
    manaValue: 2,
  ),
  '{2/R}': MTGSymbol(
    image: 'packages/magic_the_gathering_flutter/assets/2R.svg',
    looseVariant: null,
    english: 'two generic mana or one red mana',
    manaValue: 2,
  ),
  '{2/G}': MTGSymbol(
    image: 'packages/magic_the_gathering_flutter/assets/2G.svg',
    looseVariant: null,
    english: 'two generic mana or one green mana',
    manaValue: 2,
  ),
  '{H}': MTGSymbol(
    image: 'packages/magic_the_gathering_flutter/assets/H.svg',
    looseVariant: null,
    english: 'one colored mana or two life',
    manaValue: 1,
  ),
  '{W/P}': MTGSymbol(
    image: 'packages/magic_the_gathering_flutter/assets/WP.svg',
    looseVariant: null,
    english: 'one white mana or two life',
    manaValue: 1,
  ),
  '{U/P}': MTGSymbol(
    image: 'packages/magic_the_gathering_flutter/assets/UP.svg',
    looseVariant: null,
    english: 'one blue mana or two life',
    manaValue: 1,
  ),
  '{B/P}': MTGSymbol(
    image: 'packages/magic_the_gathering_flutter/assets/BP.svg',
    looseVariant: null,
    english: 'one black mana or two life',
    manaValue: 1,
  ),
  '{R/P}': MTGSymbol(
    image: 'packages/magic_the_gathering_flutter/assets/RP.svg',
    looseVariant: null,
    english: 'one red mana or two life',
    manaValue: 1,
  ),
  '{G/P}': MTGSymbol(
    image: 'packages/magic_the_gathering_flutter/assets/GP.svg',
    looseVariant: null,
    english: 'one green mana or two life',
    manaValue: 1,
  ),
  '{C/P}': MTGSymbol(
    image: 'packages/magic_the_gathering_flutter/assets/CP.svg',
    looseVariant: null,
    english: 'one colorless mana or two life',
    manaValue: 1,
  ),
  '{HW}': MTGSymbol(
    image: 'packages/magic_the_gathering_flutter/assets/HW.svg',
    looseVariant: null,
    english: 'one-half white mana',
    manaValue: 0.5,
  ),
  '{HR}': MTGSymbol(
    image: 'packages/magic_the_gathering_flutter/assets/HR.svg',
    looseVariant: null,
    english: 'one-half red mana',
    manaValue: 0.5,
  ),
  '{W}': MTGSymbol(
    image: 'packages/magic_the_gathering_flutter/assets/W.svg',
    looseVariant: 'W',
    english: 'one white mana',
    manaValue: 1,
  ),
  '{U}': MTGSymbol(
    image: 'packages/magic_the_gathering_flutter/assets/U.svg',
    looseVariant: 'U',
    english: 'one blue mana',
    manaValue: 1,
  ),
  '{B}': MTGSymbol(
    image: 'packages/magic_the_gathering_flutter/assets/B.svg',
    looseVariant: 'B',
    english: 'one black mana',
    manaValue: 1,
  ),
  '{R}': MTGSymbol(
    image: 'packages/magic_the_gathering_flutter/assets/R.svg',
    looseVariant: 'R',
    english: 'one red mana',
    manaValue: 1,
  ),
  '{G}': MTGSymbol(
    image: 'packages/magic_the_gathering_flutter/assets/G.svg',
    looseVariant: 'G',
    english: 'one green mana',
    manaValue: 1,
  ),
  '{C}': MTGSymbol(
    image: 'packages/magic_the_gathering_flutter/assets/C.svg',
    looseVariant: 'C',
    english: 'one colorless mana',
    manaValue: 1,
  ),
  '{S}': MTGSymbol(
    image: 'packages/magic_the_gathering_flutter/assets/S.svg',
    looseVariant: 'S',
    english: 'one snow mana',
    manaValue: 1,
  ),
  '{L}': MTGSymbol(
    image: 'packages/magic_the_gathering_flutter/assets/L.svg',
    looseVariant: 'L',
    english: 'one mana from a legendary source',
    manaValue: 1,
  ),
  '{D}': MTGSymbol(
    image: 'packages/magic_the_gathering_flutter/assets/D.svg',
    looseVariant: 'D',
    english: 'one potential land drop',
    manaValue: 0,
  ),
};

class MTGSymbol extends Equatable {
  final String english;
  final String image;
  final String? looseVariant;
  final double? manaValue;

  static RegExp get regex => RegExp(r'{[½∞\w\/]+}');

  @override
  List<Object?> get props => [english, image, looseVariant, manaValue];

  SvgPicture toSvg({double height = 16.0}) => SvgPicture.asset(
        image,
        height: height,
        semanticsLabel: english,
      );

  const MTGSymbol({
    required this.english,
    required this.image,
    this.looseVariant,
    this.manaValue,
  });
}
