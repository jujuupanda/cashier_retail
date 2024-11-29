import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../core/utils/utils.dart';
import '../../../../core/widgets/widgets.dart';

class RecapScreen extends StatefulWidget {
  const RecapScreen({super.key});

  @override
  State<RecapScreen> createState() => _RecapScreenState();
}

class _RecapScreenState extends State<RecapScreen> {
  late TextEditingController selectedDateC;
  late TextEditingController searchC;
  late bool dateExpandC = true;

  @override
  void initState() {
    super.initState();
    selectedDateC = TextEditingController();
    searchC = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    selectedDateC.dispose();
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
                name: "Rekap Penjualan",
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Gap(10.h),
                        selectDateWidget(),
                        Gap(25.h),
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
                        Gap(10.h),
                        searchViewWidget(),

                        Gap(15.h),
                        selectedDateTitleWidget(),
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

  TextFormField selectDateWidget() {
    return TextFormField(
      controller: selectedDateC,
      readOnly: true,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        prefixIcon: const Icon(Icons.date_range),
        hintText: "Pilih tanggal....",
        hintStyle: StyleText().openSansNormalBlack,
      ),
    );
  }

  Row selectedDateTitleWidget() {
    return Row(
      children: [
        Text(
          "Tanggal Dipilih",
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
            dateExpandC ? Icons.arrow_drop_down : Icons.arrow_drop_up,
          ),
        )
      ],
    );
  }

  ListView paidListViewWidget() {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      itemCount: 10,
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
              child: const RecapCardView(),
            ),
          ),
        );
      },
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

class RecapCardView extends StatelessWidget {
  const RecapCardView({
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
                  "Status Pembayaran",
                  style: StyleText().openSansNormalBlack,
                ),
                Text(
                  "Sudah Bayar",
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Waktu Pesan",
                  style: StyleText().openSansNormalBlack,
                ),
                Text(
                  "09:00",
                  style: StyleText().openSansNormalBlack,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Waktu Bayar",
                  style: StyleText().openSansNormalBlack,
                ),
                Text(
                  "09:30",
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
