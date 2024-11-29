part of 'utils.dart';

class StyleText {
  TextStyle openSansNormalBlack = GoogleFonts.openSans(color: PaletteColor().backgroundDark);
  TextStyle openSansNormalWhite = GoogleFonts.openSans(color: PaletteColor().backgroundLight);
  TextStyle openSansTitleBlack = GoogleFonts.openSans(color: PaletteColor().backgroundDark, fontSize: 16, fontWeight: FontWeight.w600);
  TextStyle openSansTitleWhite = GoogleFonts.openSans(color: PaletteColor().backgroundLight, fontSize: 16, fontWeight: FontWeight.w600);
  TextStyle openSansBigBlack = GoogleFonts.openSans(color: PaletteColor().backgroundDark, fontSize: 18, fontWeight: FontWeight.w700);
  TextStyle openSansBigWhite = GoogleFonts.openSans(color: PaletteColor().backgroundLight, fontSize: 18, fontWeight: FontWeight.w700);
}