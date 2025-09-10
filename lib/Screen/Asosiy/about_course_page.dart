import 'package:course/library.dart';

class AboutCoursePage extends StatefulWidget {
  const AboutCoursePage({super.key});

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
        primaryColor: const Color(0xFF2563EB),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF2563EB),
          primary: const Color(0xFF2563EB),
        ),
        textTheme: const TextTheme(
          headlineSmall: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
          titleLarge: TextStyle(fontSize: 22, fontWeight: FontWeight.w800),
          titleMedium: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
          titleSmall: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
          bodyMedium: TextStyle(fontSize: 14, color: Color(0xFF333333)),
          bodySmall: TextStyle(fontSize: 12, color: Color(0xFF666666)),
          labelLarge: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
      ),
      home: const CourseDetailsPage(),
    );
  }
}

class CourseDetailsPage extends StatelessWidget {
  const CourseDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          'Kurs haqida',
          style: TextStyle(
            color: Colors.black87,
            fontSize: 20.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: const SafeArea(child: _CourseScrollBody()),
    );
  }
}

class _CourseScrollBody extends StatelessWidget {
  const _CourseScrollBody();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          padding: const EdgeInsets.only(bottom: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title & author
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 18),
                child: Text(
                  'Super Photoshop',
                  style: theme.textTheme.titleLarge!.copyWith(
                    letterSpacing: -0.2,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
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
                              const SizedBox(width: 8),
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
                                    const Icon(
                                      Icons.person_outline_outlined,
                                      size: 18,
                                      color: Color.fromRGBO(169, 191, 246, 1),
                                    ),
                                    const SizedBox(width: 4),
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
                                    const Icon(
                                      Icons.comment_outlined,
                                      size: 18,
                                      color: Color.fromRGBO(169, 191, 246, 1),
                                    ),
                                    const SizedBox(width: 4),
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

              const SizedBox(height: 30),

              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Image.asset("assets/images/kursbanner.png"),
              ),

              const SizedBox(height: 24),

              // Stats grid
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    _StatRow(
                      icon: "play",
                      label: 'Mavzular soni:',
                      value: '38',
                    ),
                    SizedBox(height: 18),
                    _StatRow(
                      icon: "davomiylik",
                      label: 'Davomiyligi:',
                      value: '12:14:40',
                    ),
                    SizedBox(height: 18),
                    _StatRow(
                      icon: "language",
                      label: 'Til:',
                      value: "O'zbek tilida",
                    ),
                    SizedBox(height: 18),
                    _StatRow(
                      icon: "daraja",
                      label: 'Daraja:',
                      value: 'Boshlang\'ich',
                    ),
                    SizedBox(height: 18),
                    _StatRow(
                      icon: "azolar",
                      label: 'A\'zolikning davomiyligi:',
                      value: '1 yil',
                    ),
                    SizedBox(height: 18),
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
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 18,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          _PriceRow(oldPrice: '400 000', price: '280 000 '),
                        ],
                      ),
                    ),
                  ],
                ),
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

              SizedBox(height: 30.h),

              // Tabs mock
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _TabChip(label: 'Kurs haqida', active: true),
                    SizedBox(width: 4.w),
                    _TabChip(label: 'Mavzular'),
                    SizedBox(width: 4.w),
                    _TabChip(label: 'Izohlar'),
                  ],
                ),
              ),

              SizedBox(height: 24.h),

              // About text
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  "Ushbu kurs davomida siz dasturni o'rnatishdan tortib, so'nggi trenddagi dizaynlarni tayyorlashni o'rganib olasiz. Barcha videolarni ko'rib, o'rgangan olganlaringizdan so'ng bemalol pulli buyurtmalarni qabul qilishga mumkin",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),

              SizedBox(height: 24.h),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Bu kursda nimalarni o\'rganasiz?',
                      style: theme.textTheme.titleMedium,
                    ),
                    SizedBox(height: 14.h),
                    _CheckLine(text: 'Photoshop asoslarini bilib olasiz'),
                    _CheckLine(text: 'SMM dizayn tayyorlay olasiz'),
                    _CheckLine(text: 'Grafik dizayn bilan ishlay olasiz'),
                    _CheckLine(text: 'Va barcha dizayn ishlarini qila olasiz'),
                  ],
                ),
              ),

              SizedBox(height: 6.h),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Bu kursda nimalarni o\'rganasiz?',
                      style: theme.textTheme.titleMedium,
                    ),
                    SizedBox(height: 12.h),
                    _BulletLine(text: 'Kompyuter'),
                    _BulletLine(text: 'Ishlatyoq'),
                    _BulletLine(text: 'Internet'),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _StatRow extends StatelessWidget {
  const _StatRow({
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
              if (trailing != null) ...[const SizedBox(width: 4), trailing!],
            ],
          ),
        ),
      ],
    );
  }
}

class _PriceRow extends StatelessWidget {
  const _PriceRow({required this.oldPrice, required this.price});
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
            fontSize: 20,
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

class _TabChip extends StatelessWidget {
  const _TabChip({required this.label, this.active = false});
  final String label;
  final bool active;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 38,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: active ? Color.fromRGBO(53, 114, 237, 1) : Colors.white,
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            color:
                active
                    ? Color.fromRGBO(253, 254, 255, 1)
                    : Color.fromRGBO(27, 29, 36, 1),
          ),
        ),
      ),
    );
  }
}

class _CheckLine extends StatelessWidget {
  const _CheckLine({required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 18.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.check_circle_outline,
            size: 22.sp,
            color: Color.fromRGBO(82, 125, 236, 1),
          ),
          SizedBox(width: 10.w),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 14.sp,
                color: Color.fromRGBO(95, 100, 110, 1),
                fontFamily: 'Regular',
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _BulletLine extends StatelessWidget {
  const _BulletLine({required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Icon(
            Icons.star,
            size: 10.sp,
            color: Color.fromRGBO(229, 0, 0, 1),
          ),
          SizedBox(width: 10.w),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 14.sp,
                color: Color.fromRGBO(95, 100, 110, 1),
                fontFamily: 'Regular',
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
