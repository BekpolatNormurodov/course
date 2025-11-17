import 'package:course/library.dart';

class KursBannerClass {
  kursGrid(List<CoursesModel> data) {
    return GridView.builder(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisExtent: 300.h,
      ),
      itemCount: data.length,
      itemBuilder: (context, index) {
        return kursItem(data[index]);
      },
    );
  }

  kursList(List<CoursesModel> data) {
    return Container(
      margin: EdgeInsets.only(top: 8.h, left: 10.w),
      height: 300.h,
      child: ListView.builder(
        itemCount: data.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return kursItem(data[index]);
        },
      ),
    );
  }

  kursItem(CoursesModel data) {
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
                child: Image.network(data.image, fit: BoxFit.cover),
              ),
      
              // Kontent
              Padding(
                padding: EdgeInsets.only(top: 12.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Muallif
                    Text(
                     data.authorName,
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
                        data.coursesNameUz,
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
                        Icon(Icons.star, size: 13.sp, color: data.averageRating! >= 1 ?  Color(0xFFFFC107) :  Color.fromRGBO(0, 0, 0, 0.3)),
                        Icon(Icons.star, size: 13.sp, color: data.averageRating! >= 2 ?  Color(0xFFFFC107) :  Color.fromRGBO(0, 0, 0, 0.3)),
                        Icon(Icons.star, size: 13.sp, color: data.averageRating! >= 3 ?  Color(0xFFFFC107) :  Color.fromRGBO(0, 0, 0, 0.3)),
                        Icon(Icons.star, size: 13.sp, color: data.averageRating! >= 4 ?  Color(0xFFFFC107) :  Color.fromRGBO(0, 0, 0, 0.3)),
                        Icon(Icons.star, size: 13.sp, color: data.averageRating! >= 5 ?  Color(0xFFFFC107) :  Color.fromRGBO(0, 0, 0, 0.3)),
                        SizedBox(width: 6.w),
                        Text(
                          "(${data.averageRating})",
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
                          data.salePrice.toString(),
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
                        Text(data.addedUser.toString(), style: TextStyle(fontSize: 14.sp)),
                        SizedBox(width: 22.w),
                        Icon(
                          Icons.person_outline,
                          size: 18.sp,
                          color: Color.fromRGBO(0, 0, 0, 0.3),
                        ),
                        SizedBox(width: 6.w),
                        Text(data.soldCount.toString(), style: TextStyle(fontSize: 14.sp)),
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
