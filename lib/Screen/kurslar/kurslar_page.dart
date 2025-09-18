import 'package:course/library.dart';

class KurslarPage extends StatefulWidget {
  KurslarPage({super.key});
  @override
  State<KurslarPage> createState() => _KurslarPageState();
}

class _KurslarPageState extends State<KurslarPage> {
  int selectedFilter = 0;
  final buttons = ["Barchasi", "Dasturlash", "Matematika", "Fizika", "Kimyo"];
  final narxlar = [
    "1 200 000",
    "500 000",
    "2 000 000",
    "3 500 000",
    "1 000 000",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 80.h,
        elevation: 0,
        backgroundColor: Colors.white,
        titleSpacing: 16.w,
        centerTitle: false,
        title: Text(
          ' Kurslar',
          style: TextStyle(
            color: kText,
            fontSize: 20.sp,
            fontWeight: FontWeight.w800,
            letterSpacing: .2.w,
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () => Get.to(FilterPage()),
            child: Image.asset(
              "assets/icons/filtr.png",
              width: 22.w,
              height: 22.w,
            ),
          ),
          SizedBox(width: 26.w),
          GestureDetector(
            onTap: () {},
            child: Image.asset(
              "assets/icons/search.png",
              width: 22.w,
              height: 22.w,
            ),
          ),
          SizedBox(width: 16.w),
        ],
      ),

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 44.h,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              itemCount: buttons.length,
              separatorBuilder: (context, index) => SizedBox(width: 14.w),
              itemBuilder: (context, i) {
                final isSelected = selectedFilter == i;
                return GestureDetector(
                  onTap: () => setState(() => selectedFilter = i),
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20.w,
                      vertical: 12.h,
                    ),
                    decoration: BoxDecoration(
                      color:
                          isSelected
                              ? Color.fromRGBO(53, 114, 237, 1)
                              : Color.fromRGBO(238, 240, 245, 1),
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: Text(
                      buttons[i],
                      overflow: TextOverflow.ellipsis, // uzun matnlar uchun
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16.sp,
                        fontFamily: 'Regular',
                        color: isSelected ? Colors.white : Colors.black87,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 6.h),
          Expanded(child: KursBannerClass().kursGrid(narxlar[selectedFilter])),
        ],
      ),
    );
  }
}
