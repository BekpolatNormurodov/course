import 'package:course/library.dart';

class JadvalPage extends StatelessWidget {
  JadvalPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        backgroundColor: Colors.white,
        toolbarHeight: 70.h,
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
              margin: EdgeInsets.symmetric(vertical: 8.h, horizontal: 8.w),
              alignment: Alignment.center,
              child: Icon(
                Icons.arrow_back_ios_new,
                size: 18.sp,
                color: Colors.black87,
              ),
            ),
          ),
        ),
        actions: [
          Text(
            "Jadval",
            style: TextStyle(
              fontSize: 16.sp,
              height: 1.5,
              fontWeight: FontWeight.w500,
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 12.w, right: 14.w),
            decoration: BoxDecoration(
              color: Color.fromRGBO(53, 114, 237, 0.1),
              shape: BoxShape.circle,
            ),
            padding: EdgeInsets.symmetric(horizontal: 9.w, vertical: 9.h),
            child: Icon(
              Icons.format_list_bulleted,
              size: 20.sp,
              color: Color.fromRGBO(53, 114, 237, 1), // ko‘k rang
            ),
          ),
        ],
      ),
      body: SafeArea(child: _CourseScrollBody()),
    );
  }
}

class _CourseScrollBody extends StatefulWidget {
  _CourseScrollBody();

  @override
  State<_CourseScrollBody> createState() => _CourseScrollBodyState();
}

class _CourseScrollBodyState extends State<_CourseScrollBody> {
  bool aboutActive = true;
  bool themesActive = false;
  bool izohlarActive = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 14.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(
              left: 2.w,
              right: 6.w,
              top: 10.h,
              bottom: 24.h,
            ),
            child: Text(
              "1. HTML. Boshlangich tushunchalar. Teg va attributlar..Giperssilkalar bilan ishlash. Rasmlar bilan ishlash.",
              style: TextStyle(
                fontSize: 20.sp,
                height: 1.4,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Stack(
            alignment: Alignment.center,
            children: [
              Image.asset(
                "assets/images/video.png",
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              Container(
                width: 60.w,
                height: 60.w,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(94, 82, 236, 1),
                  shape: BoxShape.circle,
                ),
                child: Icon(Icons.play_arrow, size: 40.sp, color: Colors.white),
              ),
            ],
          ),
          SizedBox(height: 66.h),
          Container(
            width: 350.w,
            padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 18.h),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.r),
              boxShadow: [
                BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0.12),
                  blurRadius: 7,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Tavsif",
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(82, 125, 236, 1), // ko‘k rang
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  "Savollar va muhokamalar uchun https://t.me/joinchat/SgvZ9BV_DYyHSEn8OvHD5w",
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: Color.fromRGBO(95, 100, 110, 1),
                    height: 1.5.h,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
