import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../core/utils/utils.dart';
import '../../../../core/widgets/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late TextEditingController searchC;
  bool unPaidExpandC = true;
  bool paidExpandC = true;

  @override
  void initState() {
    super.initState();
    searchC = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    searchC.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      body: Stack(
        children: [
          const PageBackground(),
          Column(
            children: [
              const PageHeader(
                name: "Aplikasi Kasir",
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Gap(10.h),
                        incomeTodayTitleWidget(),
                        Gap(10.h),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(width: 1),
                            borderRadius: BorderRadius.circular(15.r),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: 8.h,
                              horizontal: 8.w,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Pemasukan",
                                  style: StyleText().openSansBigBlack,
                                ),
                                Text(
                                  "Rp. 1.200.000",
                                  style: StyleText().openSansBigBlack,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Gap(10.h),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(width: 1),
                            borderRadius: BorderRadius.circular(15.r),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: 8.h,
                              horizontal: 8.w,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Pengeluaran",
                                  style: StyleText().openSansBigBlack,
                                ),
                                Text(
                                  "Rp. 200.000",
                                  style: StyleText().openSansBigBlack,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Gap(15.h),
                        searchViewWidget(),
                        Gap(15.h),
                        unPaidTitleWidget(),
                        unPaidListViewWidget(),
                        Gap(15.h),
                        paidTitleWidget(),
                        paidListViewWidget(),
                        Gap(30.h),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Row incomeTodayTitleWidget() {
    return Row(
      children: [
        Text(
          "Pendapatan Hari Ini",
          style: StyleText().openSansTitleBlack,
        ),
        const Spacer(),
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.arrow_drop_down,
            color: PaletteColor().backgroundDark,
          ),
        )
      ],
    );
  }

  ListView unPaidListViewWidget() {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      itemCount: 2,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 4.h),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              splashColor: PaletteColor().lightGrey,
              borderRadius: BorderRadius.circular(15.r),
              onTap: () {},
              onLongPress: () {},
              child: const UnPaidCardView(),
            ),
          ),
        );
      },
    );
  }

  ListView paidListViewWidget() {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      itemCount: 2,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 4.h),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              splashColor: PaletteColor().lightGrey,
              borderRadius: BorderRadius.circular(15.r),
              onTap: () {},
              onLongPress: () {},
              child: const PaidCardView(),
            ),
          ),
        );
      },
    );
  }

  Row paidTitleWidget() {
    return Row(
      children: [
        Text(
          "Sudah Bayar",
          style: StyleText().openSansBigBlack,
        ),
        const Spacer(),
        Text(
          "2",
          style: StyleText().openSansBigBlack,
        ),
        Gap(15.w),
        IconButton(
          onPressed: () {},
          icon: Icon(
            paidExpandC ? Icons.arrow_drop_down : Icons.arrow_drop_up,
          ),
        )
      ],
    );
  }

  Row unPaidTitleWidget() {
    return Row(
      children: [
        Text(
          "Belum Bayar",
          style: StyleText().openSansBigBlack,
        ),
        const Spacer(),
        Text(
          "2",
          style: StyleText().openSansBigBlack,
        ),
        Gap(15.w),
        IconButton(
          onPressed: () {},
          icon: Icon(
            unPaidExpandC ? Icons.arrow_drop_down : Icons.arrow_drop_up,
          ),
        )
      ],
    );
  }

  TextFormField searchViewWidget() {
    return TextFormField(
      controller: searchC,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        prefixIcon: const Icon(Icons.search),
        hintText: "Cari nama....",
        hintStyle: StyleText().openSansNormalBlack,
      ),
    );
  }
}

class PaidCardView extends StatelessWidget {
  const PaidCardView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.r),
          border: Border.all(
            width: 1,
            color: PaletteColor().backgroundDark,
          )),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Nama",
                  style: StyleText().openSansTitleBlack,
                ),
                Text(
                  "Julio",
                  style: StyleText().openSansTitleBlack,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Toping",
                  style: StyleText().openSansNormalBlack,
                ),
                Text(
                  "20k",
                  style: StyleText().openSansNormalBlack,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Tambahan",
                  style: StyleText().openSansNormalBlack,
                ),
                Text(
                  "10k",
                  style: StyleText().openSansNormalBlack,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Rasa",
                  style: StyleText().openSansNormalBlack,
                ),
                Text(
                  "Sedang/Pedas/Tidak Pedas",
                  style: StyleText().openSansNormalBlack,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Metode Pembayaran",
                  style: StyleText().openSansNormalBlack,
                ),
                Text(
                  "Cash/Transfer",
                  style: StyleText().openSansNormalBlack,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Keterangan",
                  style: StyleText().openSansNormalBlack,
                ),
                Text(
                  "Teajus Melati",
                  style: StyleText().openSansNormalBlack,
                ),
              ],
            ),
            Gap(8.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Total",
                  style: StyleText().openSansBigBlack,
                ),
                Text(
                  "30k",
                  style: StyleText().openSansBigBlack,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class UnPaidCardView extends StatelessWidget {
  const UnPaidCardView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.r),
          border: Border.all(
            width: 1,
            color: PaletteColor().backgroundDark,
          )),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Nama",
                  style: StyleText().openSansTitleBlack,
                ),
                Text(
                  "Julio",
                  style: StyleText().openSansTitleBlack,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Toping",
                  style: StyleText().openSansNormalBlack,
                ),
                Text(
                  "20k",
                  style: StyleText().openSansNormalBlack,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Level Rasa",
                  style: StyleText().openSansNormalBlack,
                ),
                Text(
                  "Sedang/Pedas/Tidak Pedas",
                  style: StyleText().openSansNormalBlack,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Status Pembayaran",
                  style: StyleText().openSansNormalBlack,
                ),
                Text(
                  "Bayar/Belum Bayar",
                  style: StyleText().openSansNormalBlack,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Keterangan",
                  style: StyleText().openSansNormalBlack,
                ),
                Text(
                  "Teajus Melati",
                  style: StyleText().openSansNormalBlack,
                ),
              ],
            ),
            Gap(8.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Total",
                  style: StyleText().openSansBigBlack,
                ),
                Text(
                  "20k",
                  style: StyleText().openSansBigBlack,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
