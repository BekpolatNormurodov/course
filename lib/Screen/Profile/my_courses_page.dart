import 'package:course/library.dart';

class MyCoursesPage extends StatelessWidget {
  MyCoursesPage({super.key});

  @override
  Widget build(BuildContext context) {
    List courses = [
      {
        "image": "assets/images/kurs.png",
        "author": "Sardor Qodirov",
        "title": "Java dasturlash tili asoslari",
        "progress": 12,
        "total": 38,
      },
      {
        "image": "assets/images/kurs.png",
        "author": "Sardor Qodirov",
        "title": "Java dasturlash tili asoslari",
        "progress": 12,
        "total": 38,
      },
      {
        "image": "assets/images/kurs.png",
        "author": "Sardor Qodirov",
        "title": "Java dasturlash tili asoslari",
        "progress": 12,
        "total": 38,
      },
      {
        "image": "assets/images/kurs.png",
        "author": "Sardor Qodirov",
        "title": "Java dasturlash tili asoslari",
        "progress": 12,
        "total": 38,
      },
    ];

    return Scaffold(
       backgroundColor: Colors.white,
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
            'Mening kurslarim',
            style: TextStyle(
              color: Colors.black87,
              fontSize: 20.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      body: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 16.h),
        itemCount: courses.length,
        itemBuilder: (context, index) {
          final course = courses[index];
          final progress =
              (course["progress"] as int).toDouble() /
              (course["total"] as int).toDouble();

          return GestureDetector(
            onTap: ()=> Get.to(AboutMyCoursePage()),
            child: Container(
              margin: EdgeInsets.only(bottom: 18.h),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8.r),
                    child: Image.asset(
                      course["image"]!,
                      width: 107.w,
                      height: 80.h,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(width: 16.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          course["author"],
                          style: TextStyle(fontSize: 12.sp, color: Color.fromRGBO(95, 100, 110, 1), fontFamily: 'Regular'),
                        ),
                        SizedBox(height: 4.h),
                        SizedBox(
                          width: 150.w,
                          child: Text(
                            course["title"]!,
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Medium',
                              color: Color.fromRGBO(13, 20, 39, 1)
                            ),
                          ),
                        ),
                        SizedBox(height: 8.h),
                        Row(
                          children: [
                            Expanded(
                              child: LinearProgressIndicator(
                                value: progress,
                                backgroundColor: Colors.grey[300],
                                color: Colors.blue,
                                minHeight: 6.h,
                                borderRadius: BorderRadius.circular(6.r),
                              ),
                            ),
                            SizedBox(width: 8.w),
                            Row(
                              children: [
                                Icon(Icons.play_circle_fill, color: Colors.blue, size: 20.sp,),
                                SizedBox(width: 5.w),
                                Text(
                                  "${course["progress"]}/${course["total"]}",
                                  style: TextStyle(
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'Regular'
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
