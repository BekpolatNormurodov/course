import 'package:course/library.dart';

class KursBanner {
  kursGrid(narx) {
    return GridView.builder(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisExtent: 300.h,
      ),
      itemCount: 20,
      itemBuilder: (context, index) {
        return kursItem(narx);
      },
    );
  }

  kursList(narx) {
    return Container(
      margin: EdgeInsets.only(top: 8.h, left: 10.w),
      height: 300.h,
      child: ListView.builder(
        itemCount: 10,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return kursItem(narx);
        },
      ),
    );
  }

  kursItem(narx) {
    return GestureDetector(
      onTap: ()=>Get.to(AboutCoursePage()),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 10.h),
        child: Container(
          width: 170.w,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12.r),
          ),
          clipBehavior: Clip.antiAlias,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Rasm (tepada)
              SizedBox(
                child: Image.asset('assets/images/kurs.png', fit: BoxFit.cover),
              ),
      
              // Kontent
              Padding(
                padding: EdgeInsets.only(top: 12.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Muallif
                    Text(
                      "Sardor Qodirov",
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontFamily: 'Regular',
                        color: Color.fromRGBO(95, 100, 110, 1),
                      ),
                    ),
                    SizedBox(height: 4.h),
      
                    // Sarlavha
                    Container(
                      padding: EdgeInsets.only(right: 6.w),
                      height: 30.h,
                      child: Text(
                        "Java dasturlash tili asoslari",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 14.sp,
                          height: 1.2.h,
                          fontWeight: FontWeight.w600,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                    SizedBox(height: 8.h),
      
                    // Yulduzlar + (5)
                    Row(
                      children: [
                        Icon(Icons.star, size: 13.sp, color: Color(0xFFFFC107)),
                        Icon(Icons.star, size: 13.sp, color: Color(0xFFFFC107)),
                        Icon(Icons.star, size: 13.sp, color: Color(0xFFFFC107)),
                        Icon(Icons.star, size: 13.sp, color: Color(0xFFFFC107)),
                        Icon(Icons.star, size: 13.sp, color: Color(0xFFFFC107)),
                        SizedBox(width: 6.w),
                        Text(
                          '(5)',
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: Color.fromRGBO(95, 100, 110, 1),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8.h),
      
                    // Narx
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          narx,
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                            color: Colors.blueAccent,
                            letterSpacing: .2,
                          ),
                        ),
                        SizedBox(width: 4.w),
                        Text(
                          'UZS',
                          style: TextStyle(
                            fontSize: 13.sp,
                            color: Color.fromRGBO(0, 0, 0, 0.4),
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8.h),
      
                    // Statistikalar
                    Row(
                      children: [
                        Icon(
                          Icons.play_circle_fill,
                          size: 18.sp,
                          color: Color.fromRGBO(0, 0, 0, 0.3),
                        ),
                        SizedBox(width: 6.w),
                        Text('38', style: TextStyle(fontSize: 14.sp)),
                        SizedBox(width: 22.w),
                        Icon(
                          Icons.person_outline,
                          size: 18.sp,
                          color: Color.fromRGBO(0, 0, 0, 0.3),
                        ),
                        SizedBox(width: 6.w),
                        Text('58', style: TextStyle(fontSize: 14.sp)),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
