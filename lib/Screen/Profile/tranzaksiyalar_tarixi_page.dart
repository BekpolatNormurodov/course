import 'package:course/library.dart';

class Transaction {
  final String title;
  final DateTime date;
  final int amount; // manfiy = chiqim, musbat = kirim
  final String provider; // masalan: Payme, Click

  Transaction({
    required this.title,
    required this.date,
    required this.amount,
    required this.provider,
  });
}

class TransactionHistoryApp extends StatelessWidget {
  TransactionHistoryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812), // iPhone 11 Pro Max kabi (9:19.5)
      minTextAdapt: true,
      splitScreenMode: true,
      builder:
          (_, __) => MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(useMaterial3: true),
            home: TransactionHistoryPage(),
          ),
    );
  }
}

class TransactionHistoryPage extends StatelessWidget {
  TransactionHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70.h,
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        leadingWidth: 64.w,
        centerTitle: true,
        leading: GestureDetector(
          onTap: () => Get.back(),
          child: Container(
            alignment: Alignment.center,
            child: Container(
              width: 34.w,
              height: 34.w,
              decoration: BoxDecoration(
                color: Color.fromRGBO(238, 240, 245, 1),
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Icon(
                Icons.arrow_back_ios_new,
                size: 18.sp,
                color: Colors.black87,
              ),
            ),
          ),
        ),
        title: Text(
          'Tranzaksiyalar tarixi',
          style: TextStyle(
            color: Colors.black87,
            fontSize: 20.sp,
            fontWeight: FontWeight.w600,
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
          SizedBox(width: 14.w),
        ],
      ),
      body: _ListTile(),
      backgroundColor: Colors.white,
    );
  }
}

class _ListTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView.builder(
        itemCount: 20,
        padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 2.h),
        itemBuilder: (context, index) {
          return Container(
            height: 56.h,
            alignment: Alignment.center,
            margin: EdgeInsets.symmetric(vertical: 6.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.r),
              color: Color.fromRGBO(253, 254, 255, 1),
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 0),
                  blurRadius: 3.r,
                  color: Color.fromRGBO(0, 0, 0, 0.12),
                ),
              ],
            ),
            child: ListTile(
              minTileHeight: 56.h,
              tileColor: Colors.transparent,
              contentPadding: EdgeInsets.symmetric(horizontal: 8.w),
              leading: Image.asset("assets/images/payme.png"),
              title: Text(
                "Java dasturlash tili asoslari",
                style: GoogleFonts.rubik(
                  color: Color.fromRGBO(13, 20, 39, 1),
                  fontWeight: FontWeight.w500,
                  fontSize: 14.sp,
                  letterSpacing: 0,
                ),
              ),
              subtitle: Text(
                "28 - Oktyabr, 2024",
                style: GoogleFonts.rubik(
                  color: Color.fromRGBO(13, 20, 39, 0.6),
                  fontWeight: FontWeight.w400,
                  fontSize: 12.sp,
                ),
              ),
              trailing: Text(
                "-100 000 uzs",
                style: GoogleFonts.rubik(
                  color: Color.fromRGBO(13, 20, 39, 1),
                  fontWeight: FontWeight.w500,
                  fontSize: 12.sp,
                  letterSpacing: 0,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
