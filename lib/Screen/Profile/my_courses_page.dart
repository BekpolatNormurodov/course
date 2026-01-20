import 'package:course/library.dart';
import 'package:course/Repository/purchase/purchase_service.dart';
import 'package:course/Repository/purchase/purchase_model.dart';
import 'package:course/Repository/course_id/course_id_provider.dart';
import 'package:provider/provider.dart';

class MyCoursesPage extends StatefulWidget {
  const MyCoursesPage({super.key});

  @override
  State<MyCoursesPage> createState() => _MyCoursesPageState();
}

class _MyCoursesPageState extends State<MyCoursesPage> {
  final PurchaseService _purchaseService = PurchaseService();
  List<PurchaseModel> _courses = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadMyCourses();
  }

  Future<void> _loadMyCourses() async {
    try {
      final courses = await _purchaseService.getMyCourses();
      setState(() {
        _courses = courses;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      Get.snackbar(
        'Xatolik',
        'Kurslarni yuklashda xatolik: $e',
        backgroundColor: Colors.red.shade100,
        colorText: Colors.red.shade900,
        snackPosition: SnackPosition.TOP,
      );
    }
  }

  Future<void> _navigateToCourse(int courseId) async {
    final courseProvider = context.read<CourseIdProvider>();
    await courseProvider.load(courseId);
    Get.to(() => AboutMyCoursePage());
  }

  @override
  Widget build(BuildContext context) {
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
      body:
          _isLoading
              ? Center(
                child: CircularProgressIndicator(
                  color: Color.fromRGBO(53, 114, 237, 1),
                ),
              )
              : _courses.isEmpty
              ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.school_outlined,
                      size: 80.sp,
                      color: Colors.grey,
                    ),
                    SizedBox(height: 16.h),
                    Text(
                      'Sizda hali kurslar yo\'q',
                      style: TextStyle(
                        fontSize: 18.sp,
                        color: Colors.grey,
                        fontFamily: 'Regular',
                      ),
                    ),
                  ],
                ),
              )
              : ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 16.h),
                itemCount: _courses.length,
                itemBuilder: (context, index) {
                  final purchase = _courses[index];
                  final courseData = purchase.courseData;

                  // Calculate progress if available
                  double progress = 0.0;
                  if (courseData != null) {
                    final completed =
                        (courseData['completedModules'] ?? 0).toDouble();
                    final total = (courseData['totalModules'] ?? 1).toDouble();
                    progress = total > 0 ? completed / total : 0.0;
                  }

                  return GestureDetector(
                    onTap: () => _navigateToCourse(purchase.courseId),
                    child: Container(
                      margin: EdgeInsets.only(bottom: 18.h),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8.r),
                            child:
                                purchase.courseImage != null &&
                                        purchase.courseImage!.isNotEmpty
                                    ? Image.network(
                                      purchase.courseImage!,
                                      width: 107.w,
                                      height: 80.h,
                                      fit: BoxFit.cover,
                                      errorBuilder: (
                                        context,
                                        error,
                                        stackTrace,
                                      ) {
                                        return Container(
                                          width: 107.w,
                                          height: 80.h,
                                          color: Colors.grey.shade200,
                                          child: Icon(
                                            Icons.image,
                                            color: Colors.grey,
                                          ),
                                        );
                                      },
                                    )
                                    : Container(
                                      width: 107.w,
                                      height: 80.h,
                                      color: Colors.grey.shade200,
                                      child: Icon(
                                        Icons.school,
                                        color: Colors.grey,
                                      ),
                                    ),
                          ),
                          SizedBox(width: 16.w),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  courseData?['teacherName'] ?? 'Ustoz',
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                    color: Color.fromRGBO(95, 100, 110, 1),
                                    fontFamily: 'Regular',
                                  ),
                                ),
                                SizedBox(height: 4.h),
                                Text(
                                  purchase.courseName ?? 'Kurs nomi',
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'Medium',
                                    color: Color.fromRGBO(13, 20, 39, 1),
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
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
                                        borderRadius: BorderRadius.circular(
                                          6.r,
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 8.w),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.play_circle_fill,
                                          color: Colors.blue,
                                          size: 20.sp,
                                        ),
                                        SizedBox(width: 5.w),
                                        Text(
                                          courseData != null
                                              ? '${courseData['completedModules'] ?? 0}/${courseData['totalModules'] ?? 0}'
                                              : '0/0',
                                          style: TextStyle(
                                            fontSize: 13.sp,
                                            fontWeight: FontWeight.w500,
                                            fontFamily: 'Regular',
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
