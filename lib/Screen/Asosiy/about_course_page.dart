import 'package:course/library.dart';

class AboutCoursePage extends StatefulWidget {
  AboutCoursePage({super.key});

  @override
  State<AboutCoursePage> createState() => _AboutCoursePageState();
}

class _AboutCoursePageState extends State<AboutCoursePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kurs haqida',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        primaryColor: Color(0xFF2563EB),
        colorScheme: ColorScheme.fromSeed(
          seedColor: Color(0xFF2563EB),
          primary: Color(0xFF2563EB),
        ),
        textTheme: TextTheme(
          headlineSmall: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.w700,
          ),
          titleLarge: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.w800),
          titleMedium: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w700),
          titleSmall: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600),
          bodyMedium: TextStyle(fontSize: 14.sp, color: Color(0xFF333333)),
          bodySmall: TextStyle(fontSize: 12.sp, color: Color(0xFF666666)),
          labelLarge: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
      ),
      home: CourseDetailsPage(),
    );
  }
}

class CourseDetailsPage extends StatelessWidget {
  CourseDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
    final theme = Theme.of(context);

    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title & author
              Padding(
                padding: EdgeInsets.fromLTRB(16.w, 8.h, 16.w, 18.h),
                child: Text(
                  'Super Photoshop',
                  style: theme.textTheme.titleLarge!.copyWith(
                    letterSpacing: -0.2,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.w),
                child: GestureDetector(
                  onTap: () => Get.to(AboutMuallifPage()),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 30.r,
                        backgroundImage: AssetImage('assets/images/Ellipse.png'),
                        // If you don't have assets, fallback color shows a circle
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Row(
                              children: [
                                SizedBox(width: 8.w),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Muallif',
                                      style: theme.textTheme.bodySmall,
                                    ),
                                    Text(
                                      'Baxtiyor Samandarov',
                                      style: theme.textTheme.titleSmall,
                                    ),
                                  ],
                                ),
                                // rating + students + like icon
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 6.w, right: 10.w),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.star,
                                        size: 16.sp,
                                        color: Color(0xFFFFC107),
                                      ),
                                      Icon(
                                        Icons.star,
                                        size: 16.sp,
                                        color: Color(0xFFFFC107),
                                      ),
                                      Icon(
                                        Icons.star,
                                        size: 16.sp,
                                        color: Color(0xFFFFC107),
                                      ),
                                      Icon(
                                        Icons.star,
                                        size: 16.sp,
                                        color: Color(0xFFFFC107),
                                      ),
                                      Icon(
                                        Icons.star,
                                        size: 16.sp,
                                        color: Color(0xFFFFC107),
                                      ),
                                      SizedBox(width: 6.w),
                                      Text(
                                        '(5)',
                                        style: TextStyle(
                                          fontSize: 12.sp,
                                          color: Color.fromRGBO(95, 100, 110, 1),
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.person_outline_outlined,
                                        size: 18.sp,
                                        color: Color.fromRGBO(169, 191, 246, 1),
                                      ),
                                      SizedBox(width: 4.w),
                                      Text(
                                        '915',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 13.sp,
                                          fontFamily: 'Regular',
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.comment_outlined,
                                        size: 18.sp,
                                        color: Color.fromRGBO(169, 191, 246, 1),
                                      ),
                                      SizedBox(width: 4.w),
                                      Text(
                                        '915',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 13.sp,
                                          fontFamily: 'Regular',
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 6.h),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
                child: Image.asset("assets/images/kursbanner.png"),
              ),

              // Stats grid
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  children: [
                    _StatRow(
                      icon: "play",
                      label: 'Mavzular soni:',
                      value: '38',
                    ),
                    SizedBox(height: 18.h),
                    _StatRow(
                      icon: "davomiylik",
                      label: 'Davomiyligi:',
                      value: '12:14:40',
                    ),
                    SizedBox(height: 18.h),
                    _StatRow(
                      icon: "language",
                      label: 'Til:',
                      value: "O'zbek tilida",
                    ),
                    SizedBox(height: 18.h),
                    _StatRow(
                      icon: "daraja",
                      label: 'Daraja:',
                      value: 'Boshlang\'ich',
                    ),
                    SizedBox(height: 18.h),
                    _StatRow(
                      icon: "azolar",
                      label: 'A\'zolikning davomiyligi:',
                      value: '1 yil',
                    ),
                    SizedBox(height: 18.h),
                    _StatRow(
                      icon: "sertifikat",
                      label: 'Sertifikat:',
                      value: '',
                      trailing: Icon(Icons.check, color: Color(0xFF2563EB)),
                    ),
                  ],
                ),
              ),

              // Price + button
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 18.h),
                child: _PriceRow(oldPrice: '400 000', price: '280 000 '),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.w),
                child: SizedBox(
                  height: 48.h,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: kBlue,
                      foregroundColor: Colors.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(26.r),
                      ),
                    ),
                    child: Text(
                      'Sotib olish',
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 16.sp,
                      ),
                    ),
                  ),
                ),
              ),

              // Tabs mock
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      left: 16.w,
                      right: 16.w,
                      top: 24.h,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              aboutActive = true;
                              themesActive = false;
                              izohlarActive = false;
                            });
                          },
                          child: TabChip(
                            label: 'Kurs haqida',
                            active: aboutActive,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              aboutActive = false;
                              themesActive = true;
                              izohlarActive = false;
                            });
                          },
                          child: TabChip(
                            label: 'Mavzular',
                            active: themesActive,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              aboutActive = false;
                              themesActive = false;
                              izohlarActive = true;
                            });
                          },
                          child: TabChip(
                            label: 'Izohlar',
                            active: izohlarActive,
                          ),
                        ),
                      ],
                    ),
                  ),
                  aboutActive
                      ? TabChipItem().about(context, theme)
                      : themesActive
                      ? TabChipItem().themes()
                      : TabChipItem().izohlar(),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}

class _StatRow extends StatelessWidget {
  _StatRow({
    required this.icon,
    required this.label,
    required this.value,
    this.trailing,
  });
  final String icon;
  final String label;
  final String value;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset("assets/icons/$icon.png"),
        SizedBox(width: 13.w),
        Expanded(
          child: Row(
            children: [
              Expanded(
                child: Text(
                  label,
                  style: TextStyle(
                    color: Color.fromRGBO(95, 100, 110, 1),
                    fontSize: 16.sp,
                    fontFamily: 'Regular',
                  ),
                ),
              ),
              if (value.isNotEmpty)
                Text(
                  value,
                  style: TextStyle(
                    color: Color.fromRGBO(27, 29, 36, 1),
                    fontSize: 16.sp,
                    fontFamily: 'Regular',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              if (trailing != null) ...[SizedBox(width: 4.w), trailing!],
            ],
          ),
        ),
      ],
    );
  }
}

class _PriceRow extends StatelessWidget {
  _PriceRow({required this.oldPrice, required this.price});
  final String oldPrice;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "Narxi:",
          style: TextStyle(
            color: Color.fromRGBO(95, 100, 110, 1),
            fontSize: 20.sp,
            fontFamily: "Regular",
            fontWeight: FontWeight.w500,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Text(
            oldPrice,
            style: TextStyle(
              color: Color(0xFF9CA3AF),
              decoration: TextDecoration.lineThrough,
              fontSize: 18.sp,
              fontFamily: 'Regular',
            ),
          ),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              price,
              style: TextStyle(
                color: Color.fromRGBO(53, 114, 237, 1),
                fontWeight: FontWeight.w500,
                fontSize: 25.sp,
              ),
            ),
            Text(
              "so'm",
              style: TextStyle(
                color: Color.fromRGBO(0, 0, 0, 0.5),
                fontWeight: FontWeight.w400,
                fontSize: 18.sp,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
