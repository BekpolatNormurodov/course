import 'package:course/Screen/Profile/jadval_page.dart';
import 'package:course/library.dart';

class AboutMyCoursePage extends StatefulWidget {
  AboutMyCoursePage({super.key});

  @override
  State<AboutMyCoursePage> createState() => _AboutMyCoursePageState();
}

class _AboutMyCoursePageState extends State<AboutMyCoursePage> {
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
        title: Text(
          'Kurs haqida',
          style: TextStyle(
            color: Colors.black87,
            fontSize: 20.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
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
    return LayoutBuilder(
      builder: (context, raints) {
        return ListView.builder(
          itemCount: 20,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.symmetric(vertical: 6.h, horizontal: 14.w),
              decoration: BoxDecoration(
                color: Color.fromRGBO(253, 254, 255, 1),
                borderRadius: BorderRadius.circular(5.r),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 0),
                    color: Color.fromRGBO(0, 0, 0, 0.12),
                    blurRadius: 6.r,
                  ),
                ],
              ),
              child: ExpansionTile(
                initiallyExpanded: false,
                tilePadding: EdgeInsets.symmetric(horizontal: 18.w),
                controlAffinity: ListTileControlAffinity.platform,
                childrenPadding: EdgeInsets.zero,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5.r)),
                ),
                collapsedShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5.r)),
                ),
                title: Container(
                  padding: EdgeInsets.symmetric(vertical: 12.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${index + 1}. Poligrafiya uchun dizayn",
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                          color: Color.fromRGBO(4, 21, 66, 1),
                        ),
                      ),
                      SizedBox(height: 12.h),
                      Row(
                        children: [
                          Image.asset(
                            "assets/icons/bookblue.png",
                            color: Color.fromRGBO(168, 190, 246, 1),
                            width: 18.w,
                            height: 18.h,
                          ),
                          SizedBox(width: 10.w),
                          Text(
                            "23 ta dars",
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontFamily: 'Regular',
                              color: Color.fromRGBO(57, 60, 67, 1),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(width: 12.w),
                          Image.asset(
                            "assets/icons/clockblue.png",
                            width: 18.w,
                            height: 18.h,
                            color: Color.fromRGBO(168, 190, 246, 1),
                          ),
                          SizedBox(width: 10.w),
                          Text(
                            "14:40min",
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontFamily: 'Regular',
                              color: Color.fromRGBO(57, 60, 67, 1),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                children: [
                  Container(
                    color: Color.fromRGBO(241, 239, 239, 1),
                    width: double.infinity,
                    height: 2.h,
                  ),
                  SizedBox(
                    height: 380.h,
                    child: GridView.builder(
                      padding: EdgeInsets.symmetric(
                        horizontal: 18.w,
                        vertical: 18.h,
                      ),
                      itemCount: 10, // nechta video bo‘lsa
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, // 2 ustunli grid
                        mainAxisSpacing: 38.h,
                        crossAxisSpacing: 12.w,
                      ),
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: ()=> Get.to(JadvalPage()),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    Image.asset(
                                      "assets/images/video.png",
                                      width: double.infinity,
                                      fit: BoxFit.cover,
                                    ),
                                    Container(
                                      width: 48.w,
                                      height: 48.w,
                                      decoration: BoxDecoration(
                                        color: Color.fromRGBO(94, 82, 236, 1),
                                        shape: BoxShape.circle,
                                      ),
                                      child: Icon(
                                        Icons.play_arrow,
                                        size: 32.sp,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  left: 2.w,
                                  top: 12.h,
                                ),
                                child: Text(
                                  "1. HTML. Boshlangich tushunchalar. Teg va...",
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    height: 1.5,
                                    fontFamily: 'Regular',
                                    color: Color.fromRGBO(57, 60, 67, 1),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
