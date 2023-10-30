import 'package:equatable/equatable.dart';
import 'package:flutter_svg/flutter_svg.dart' show SvgPicture;

const Map<String, MTGSymbol> mtgSymbology = {
  '{T}': MTGSymbol(
    image: 'assets/T.svg',
    looseVariant: null,
    english: 'tap this permanent',
    manaValue: 0,
  ),
  '{Q}': MTGSymbol(
    image: 'assets/Q.svg',
    looseVariant: null,
    english: 'untap this permanent',
    manaValue: 0,
  ),
  '{E}': MTGSymbol(
    image: 'assets/E.svg',
    looseVariant: null,
    english: 'an energy counter',
    manaValue: 0,
  ),
  '{PW}': MTGSymbol(
    image: 'assets/PW.svg',
    looseVariant: null,
    english: 'planeswalker',
    manaValue: 0,
  ),
  '{CHAOS}': MTGSymbol(
    image: 'assets/CHAOS.svg',
    looseVariant: null,
    english: 'chaos',
    manaValue: 0,
  ),
  '{A}': MTGSymbol(
    image: 'assets/A.svg',
    looseVariant: null,
    english: 'an acorn counter',
    manaValue: 0,
  ),
  '{TK}': MTGSymbol(
    image: 'assets/TK.svg',
    looseVariant: null,
    english: 'a ticket counter',
    manaValue: 0,
  ),
  '{X}': MTGSymbol(
    image: 'assets/X.svg',
    looseVariant: 'X',
    english: 'X generic mana',
    manaValue: 0,
  ),
  '{Y}': MTGSymbol(
    image: 'assets/Y.svg',
    looseVariant: 'Y',
    english: 'Y generic mana',
    manaValue: 0,
  ),
  '{Z}': MTGSymbol(
    image: 'assets/Z.svg',
    looseVariant: 'Z',
    english: 'Z generic mana',
    manaValue: 0,
  ),
  '{0}': MTGSymbol(
    image: 'assets/0.svg',
    looseVariant: '0',
    english: 'zero mana',
    manaValue: 0,
  ),
  '{½}': MTGSymbol(
    image: 'assets/HALF.svg',
    looseVariant: '½',
    english: 'one-half generic mana',
    manaValue: 0.5,
  ),
  '{1}': MTGSymbol(
    image: 'assets/1.svg',
    looseVariant: '1',
    english: 'one generic mana',
    manaValue: 1,
  ),
  '{2}': MTGSymbol(
    image: 'assets/2.svg',
    looseVariant: '2',
    english: 'two generic mana',
    manaValue: 2,
  ),
  '{3}': MTGSymbol(
    image: 'assets/3.svg',
    looseVariant: '3',
    english: 'three generic mana',
    manaValue: 3,
  ),
  '{4}': MTGSymbol(
    image: 'assets/4.svg',
    looseVariant: '4',
    english: 'four generic mana',
    manaValue: 4,
  ),
  '{5}': MTGSymbol(
    image: 'assets/5.svg',
    looseVariant: '5',
    english: 'five generic mana',
    manaValue: 5,
  ),
  '{6}': MTGSymbol(
    image: 'assets/6.svg',
    looseVariant: '6',
    english: 'six generic mana',
    manaValue: 6,
  ),
  '{7}': MTGSymbol(
    image: 'assets/7.svg',
    looseVariant: '7',
    english: 'seven generic mana',
    manaValue: 7,
  ),
  '{8}': MTGSymbol(
    image: 'assets/8.svg',
    looseVariant: '8',
    english: 'eight generic mana',
    manaValue: 8,
  ),
  '{9}': MTGSymbol(
    image: 'assets/9.svg',
    looseVariant: '9',
    english: 'nine generic mana',
    manaValue: 9,
  ),
  '{10}': MTGSymbol(
    image: 'assets/10.svg',
    looseVariant: '10',
    english: 'ten generic mana',
    manaValue: 10,
  ),
  '{11}': MTGSymbol(
    image: 'assets/11.svg',
    looseVariant: '11',
    english: 'eleven generic mana',
    manaValue: 11,
  ),
  '{12}': MTGSymbol(
    image: 'assets/12.svg',
    looseVariant: '12',
    english: 'twelve generic mana',
    manaValue: 12,
  ),
  '{13}': MTGSymbol(
    image: 'assets/13.svg',
    looseVariant: '13',
    english: 'thirteen generic mana',
    manaValue: 13,
  ),
  '{14}': MTGSymbol(
    image: 'assets/14.svg',
    looseVariant: '14',
    english: 'fourteen generic mana',
    manaValue: 14,
  ),
  '{15}': MTGSymbol(
    image: 'assets/15.svg',
    looseVariant: '15',
    english: 'fifteen generic mana',
    manaValue: 15,
  ),
  '{16}': MTGSymbol(
    image: 'assets/16.svg',
    looseVariant: '16',
    english: 'sixteen generic mana',
    manaValue: 16,
  ),
  '{17}': MTGSymbol(
    image: 'assets/17.svg',
    looseVariant: '17',
    english: 'seventeen generic mana',
    manaValue: 17,
  ),
  '{18}': MTGSymbol(
    image: 'assets/18.svg',
    looseVariant: '18',
    english: 'eighteen generic mana',
    manaValue: 18,
  ),
  '{19}': MTGSymbol(
    image: 'assets/19.svg',
    looseVariant: '19',
    english: 'nineteen generic mana',
    manaValue: 19,
  ),
  '{20}': MTGSymbol(
    image: 'assets/20.svg',
    looseVariant: '20',
    english: 'twenty generic mana',
    manaValue: 20,
  ),
  '{100}': MTGSymbol(
    image: 'assets/100.svg',
    looseVariant: '100',
    english: 'one hundred generic mana',
    manaValue: 100,
  ),
  '{1000000}': MTGSymbol(
    image: 'assets/1000000.svg',
    looseVariant: '1000000',
    english: 'one million generic mana',
    manaValue: 1000000,
  ),
  '{∞}': MTGSymbol(
    image: 'assets/INFINITY.svg',
    looseVariant: '∞',
    english: 'infinite generic mana',
    manaValue: null,
  ),
  '{W/U}': MTGSymbol(
    image: 'assets/WU.svg',
    looseVariant: null,
    english: 'one white or blue mana',
    manaValue: 1,
  ),
  '{W/B}': MTGSymbol(
    image: 'assets/WB.svg',
    looseVariant: null,
    english: 'one white or black mana',
    manaValue: 1,
  ),
  '{B/R}': MTGSymbol(
    image: 'assets/BR.svg',
    looseVariant: null,
    english: 'one black or red mana',
    manaValue: 1,
  ),
  '{B/G}': MTGSymbol(
    image: 'assets/BG.svg',
    looseVariant: null,
    english: 'one black or green mana',
    manaValue: 1,
  ),
  '{U/B}': MTGSymbol(
    image: 'assets/UB.svg',
    looseVariant: null,
    english: 'one blue or black mana',
    manaValue: 1,
  ),
  '{U/R}': MTGSymbol(
    image: 'assets/UR.svg',
    looseVariant: null,
    english: 'one blue or red mana',
    manaValue: 1,
  ),
  '{R/G}': MTGSymbol(
    image: 'assets/RG.svg',
    looseVariant: null,
    english: 'one red or green mana',
    manaValue: 1,
  ),
  '{R/W}': MTGSymbol(
    image: 'assets/RW.svg',
    looseVariant: null,
    english: 'one red or white mana',
    manaValue: 1,
  ),
  '{G/W}': MTGSymbol(
    image: 'assets/GW.svg',
    looseVariant: null,
    english: 'one green or white mana',
    manaValue: 1,
  ),
  '{G/U}': MTGSymbol(
    image: 'assets/GU.svg',
    looseVariant: null,
    english: 'one green or blue mana',
    manaValue: 1,
  ),
  '{B/G/P}': MTGSymbol(
    image: 'assets/BGP.svg',
    looseVariant: null,
    english: 'one black mana, one green mana, or 2 life',
    manaValue: 1,
  ),
  '{B/R/P}': MTGSymbol(
    image: 'assets/BRP.svg',
    looseVariant: null,
    english: 'one black mana, one red mana, or 2 life',
    manaValue: 1,
  ),
  '{G/U/P}': MTGSymbol(
    image: 'assets/GUP.svg',
    looseVariant: null,
    english: 'one green mana, one blue mana, or 2 life',
    manaValue: 1,
  ),
  '{G/W/P}': MTGSymbol(
    image: 'assets/GWP.svg',
    looseVariant: null,
    english: 'one green mana, one white mana, or 2 life',
    manaValue: 1,
  ),
  '{R/G/P}': MTGSymbol(
    image: 'assets/RGP.svg',
    looseVariant: null,
    english: 'one red mana, one green mana, or 2 life',
    manaValue: 1,
  ),
  '{R/W/P}': MTGSymbol(
    image: 'assets/RWP.svg',
    looseVariant: null,
    english: 'one red mana, one white mana, or 2 life',
    manaValue: 1,
  ),
  '{U/B/P}': MTGSymbol(
    image: 'assets/UBP.svg',
    looseVariant: null,
    english: 'one blue mana, one black mana, or 2 life',
    manaValue: 1,
  ),
  '{U/R/P}': MTGSymbol(
    image: 'assets/URP.svg',
    looseVariant: null,
    english: 'one blue mana, one red mana, or 2 life',
    manaValue: 1,
  ),
  '{W/B/P}': MTGSymbol(
    image: 'assets/WBP.svg',
    looseVariant: null,
    english: 'one white mana, one black mana, or 2 life',
    manaValue: 1,
  ),
  '{W/U/P}': MTGSymbol(
    image: 'assets/WUP.svg',
    looseVariant: null,
    english: 'one white mana, one blue mana, or 2 life',
    manaValue: 1,
  ),
  '{2/W}': MTGSymbol(
    image: 'assets/2W.svg',
    looseVariant: null,
    english: 'two generic mana or one white mana',
    manaValue: 2,
  ),
  '{2/U}': MTGSymbol(
    image: 'assets/2U.svg',
    looseVariant: null,
    english: 'two generic mana or one blue mana',
    manaValue: 2,
  ),
  '{2/B}': MTGSymbol(
    image: 'assets/2B.svg',
    looseVariant: null,
    english: 'two generic mana or one black mana',
    manaValue: 2,
  ),
  '{2/R}': MTGSymbol(
    image: 'assets/2R.svg',
    looseVariant: null,
    english: 'two generic mana or one red mana',
    manaValue: 2,
  ),
  '{2/G}': MTGSymbol(
    image: 'assets/2G.svg',
    looseVariant: null,
    english: 'two generic mana or one green mana',
    manaValue: 2,
  ),
  '{P}': MTGSymbol(
    image: 'assets/P.svg',
    looseVariant: null,
    english: 'one colored mana or two life',
    manaValue: 1,
  ),
  '{W/P}': MTGSymbol(
    image: 'assets/WP.svg',
    looseVariant: null,
    english: 'one white mana or two life',
    manaValue: 1,
  ),
  '{U/P}': MTGSymbol(
    image: 'assets/UP.svg',
    looseVariant: null,
    english: 'one blue mana or two life',
    manaValue: 1,
  ),
  '{B/P}': MTGSymbol(
    image: 'assets/BP.svg',
    looseVariant: null,
    english: 'one black mana or two life',
    manaValue: 1,
  ),
  '{R/P}': MTGSymbol(
    image: 'assets/RP.svg',
    looseVariant: null,
    english: 'one red mana or two life',
    manaValue: 1,
  ),
  '{G/P}': MTGSymbol(
    image: 'assets/GP.svg',
    looseVariant: null,
    english: 'one green mana or two life',
    manaValue: 1,
  ),
  '{HW}': MTGSymbol(
    image: 'assets/HW.svg',
    looseVariant: null,
    english: 'one-half white mana',
    manaValue: 0.5,
  ),
  '{HR}': MTGSymbol(
    image: 'assets/HR.svg',
    looseVariant: null,
    english: 'one-half red mana',
    manaValue: 0.5,
  ),
  '{W}': MTGSymbol(
    image: 'assets/W.svg',
    looseVariant: 'W',
    english: 'one white mana',
    manaValue: 1,
  ),
  '{U}': MTGSymbol(
    image: 'assets/U.svg',
    looseVariant: 'U',
    english: 'one blue mana',
    manaValue: 1,
  ),
  '{B}': MTGSymbol(
    image: 'assets/B.svg',
    looseVariant: 'B',
    english: 'one black mana',
    manaValue: 1,
  ),
  '{R}': MTGSymbol(
    image: 'assets/R.svg',
    looseVariant: 'R',
    english: 'one red mana',
    manaValue: 1,
  ),
  '{G}': MTGSymbol(
    image: 'assets/G.svg',
    looseVariant: 'G',
    english: 'one green mana',
    manaValue: 1,
  ),
  '{C}': MTGSymbol(
    image: 'assets/C.svg',
    looseVariant: 'C',
    english: 'one colorless mana',
    manaValue: 1,
  ),
  '{S}': MTGSymbol(
    image: 'assets/S.svg',
    looseVariant: 'S',
    english: 'one snow mana',
    manaValue: 1,
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
