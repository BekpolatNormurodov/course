import 'package:course/library.dart';

class AboutMuallifPage extends StatefulWidget {
  AboutMuallifPage({super.key});

  @override
  State<AboutMuallifPage> createState() => _AboutMuallifPageState();
}

class _AboutMuallifPageState extends State<AboutMuallifPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        toolbarHeight: 70.h,
        backgroundColor: Colors.white,
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
          'Muallif haqida',
          style: TextStyle(
            color: Colors.black87,
            fontSize: 20.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.only(bottom: 40.h),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
                height: 520.h,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Profil rasmi
                    CircleAvatar(
                      radius: 50.r,
                      backgroundImage: AssetImage("assets/images/Ellipse.png"),
                    ),
                    SizedBox(height: 12.h),

                    // Ism
                    Text(
                      "Sardor Qodirov",
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: 12.h),

                    // Lavozim
                    Text(
                      "Full stack dizayner",
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: Colors.grey.shade600,
                      ),
                    ),
                    SizedBox(height: 24.h),

                    // Statistika
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            Text(
                              "915",
                              style: TextStyle(
                                fontSize: 22.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "O‘quvchilar",
                              style: TextStyle(
                                fontSize: 13.sp,
                                color: Colors.grey.shade600,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(width: 50.w),
                        Column(
                          children: [
                            Text(
                              "22",
                              style: TextStyle(
                                fontSize: 25.sp,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Regular',
                              ),
                            ),
                            Text(
                              "Izohlar",
                              style: TextStyle(
                                fontSize: 13.sp,
                                color: Colors.grey.shade600,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 24.h),

                    // Bio matn
                    Text(
                      "Ismim Sardor Qodirov (KADIROV). Grafik va veb dizaynerman.\n\n"
                      "Bu yerda siz Photoshop dasturida hosil qilinadigan ajoyib darsliklarni ko‘rishingiz mumkin. "
                      "Har xil prikol, uylas, g‘iybat va shunga o‘xshash keraksiz, vaqtni oladigan videolarni ko‘rmasdan, "
                      "o‘zingizni rivojlantirish, hayotingizni yaxshi tomonga o‘zgartirish, yangi bilimlarni o‘zlashtirish uchun "
                      "ushbu kanalga kirganingiz uchun rahmat!",
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: Color.fromRGBO(57, 60, 67, 1),
                        fontFamily: 'Regular',
                        height: 1.5,
                      ),
                    ),
                    SizedBox(height: 30.h),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Dasturlash bo’yicha',
                        style: TextStyle(
                          color: Color.fromRGBO(13, 20, 39, 1),
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Medium',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(child: KursBannerClass().kursGrid("1 200 000")),
            ],
          ),
        ),
      ),
    );
  }
}
