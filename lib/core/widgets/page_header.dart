part of 'widgets.dart';

class PageHeader extends StatelessWidget {
  const PageHeader({super.key, this.name});

  final String? name;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110.h,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(color: PaletteColor().backgroundDark),
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: 8.h,
          horizontal: 12.w,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              name ?? "",
              style: StyleText().openSansBigWhite,
            )
          ],
        ),
      ),
    );
  }
}
