part of 'widgets.dart';

class PageBackground extends StatelessWidget {
  const PageBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(color: PaletteColor().backgroundLight),
    );
  }
}
