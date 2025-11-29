import 'package:course/Repository/banner/banner_model.dart';
import 'package:course/Repository/banner/banner_provider.dart';
import 'package:course/Repository/mentor%20banner/mentorbanner_provider.dart';
import 'package:course/library.dart';

Color kBlue = Color.fromRGBO(53, 114, 237, 1);
Color kDivider = Color(0xFFE9EDF2);
Color kText = Colors.black87;

class AsosiyPage extends StatefulWidget {
  AsosiyPage({super.key});
  @override
  State<AsosiyPage> createState() => _AsosiyPageState();
}

class _AsosiyPageState extends State<AsosiyPage> {
  final _banner = PageController(viewportFraction: .9);

  CoursesProvider? provider;
  BannerProvider? bannerprovider;
  MentorBannerProvider? mentorBannerProvider;

  @override
  void initState() {
    super.initState();
    // build tugagach chaqirish:
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      context.read<CoursesProvider>().load();
      context.read<BannerProvider>().fetchBanners();
      context.read<MentorBannerProvider>().fetchMentorBanners();
    });
  }

  @override
  void dispose() {
    _banner.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final p = context.watch<CoursesProvider>();

    if (p.isLoading) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    if (p.error != null) {
      return Scaffold(body: Center(child: Text('Xatolik: ${p.error}')));
    }

    if (p.data.isEmpty) {
      return const Scaffold(body: Center(child: Text('Kurslar topilmadi')));
    }
    // print(bannerprovider!.data!.data![0].titleEn);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        backgroundColor: Colors.white,
        toolbarHeight: 80.h,
        elevation: 0,
        titleSpacing: 16.w,
        centerTitle: false,
        title: Text(
          "Asosiy",
          style: TextStyle(
            color: kText,
            fontSize: 20.sp,
            fontWeight: FontWeight.w800,
            letterSpacing: .2.w,
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () {},
            child: Image.asset(
              "assets/icons/search.png",
              width: 22.w,
              height: 22.w,
            ),
          ),
          SizedBox(width: 26.w),
          GestureDetector(
            onTap: () {},
            child: Image.asset(
              "assets/icons/sound.png",
              width: 22.w,
              height: 22.w,
            ),
          ),
          SizedBox(width: 16.w),
        ],
      ),

      body: Consumer2<BannerProvider, MentorBannerProvider>(
        builder: (context, bannerProvider, mentorProvider, child) {
          // Agar hali yuklanayotgan bo‘lsa
          if (bannerProvider.isLoading || mentorProvider.isLoading) {
            return Center(child: CircularProgressIndicator());
          }

          // Agar xatolik bo‘lsa
          if (bannerProvider.hasError) {
            return Center(child: Text("Internet yo‘q yoki serverda xatolik"));
          }
          return ListView(
            padding: EdgeInsets.only(bottom: 24.h),
            children: [
              // ---------- Banner ----------
              SizedBox(
                height: 130.h,
                child: PageView(
                  controller: _banner,
                  children: [_BannerCard(bannerProvider.banners), _BannerCard(bannerProvider.banners), _BannerCard(bannerProvider.banners)],
                ),
              ),
              SizedBox(height: 20.h),

              // ---------- Top kurslar ----------
              SectionHeader(
                title: 'Top kurslar +-',
                subtitle: 'Eng ko‘p sotib olingan video darslar',
              ),
              KursBannerClass().kursList(p.data),
              // ---------- Yangi kurslar ----------
              SectionHeader(
                title: 'Yangi kurslar +-',
                subtitle: 'Eng ko‘p sotib olingan video darslar',
                topPadding: 14.h,
              ),

              KursBannerClass().kursList(p.data),

              // ---------- Dasturlash bo‘yicha ----------
              SectionHeader(
                title: 'Dasturlash bo‘yicha +-',
                trailing: 'Barchasi',
                topPadding: 14.h,
                withSubtitle: false,
              ),
              KursBannerClass().kursList(p.data),
              SizedBox(height: 16.h),
              Container(
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
                padding: EdgeInsets.all(20.w),
                decoration: BoxDecoration(
                  color: Color(0xFF2E6CF6),
                  borderRadius: BorderRadius.circular(16.r),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Sarlavha
                    Text(
                      "Siz malakali\no‘qituvchimisiz?",
                      style: TextStyle(
                        height: 1.2.h,
                        color: Colors.white,
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 14.h),

                    // Matn
                    Padding(
                      padding: EdgeInsets.only(right: 4.w),
                      child: Text(
                        mentorProvider.banners[0].descriptionUz,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.sp,
                          height: 1.5.h,
                        ),
                      ),
                    ),
                    SizedBox(height: 24.h),

                    // Tugma
                    Center(
                      child: SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            foregroundColor: Colors.black87,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24.r),
                            ),
                            padding: EdgeInsets.symmetric(vertical: 14.h),
                          ),
                          child: Text(
                            "O‘qituvchi bo‘lish",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 14.sp,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20.h),
                    Center(
                      child: Image.asset(
                        "assets/images/teacher.png",
                        fit: BoxFit.fill,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class _BannerCard extends StatelessWidget {
  List<BannerModel> bannerprovider;

  _BannerCard(this.bannerprovider);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 12.w),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.sp),
          color: kBlue,
        ),
        padding: EdgeInsets.all(6.w),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 8.w,
                      vertical: 12.h,
                    ),
                    child: Text(
                    bannerprovider[0].titleUz,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w800,
                        fontSize: 15.sp,
                        fontFamily: 'RAYDIS',
                        height: 1.3.h,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: 6.w,
                      vertical: 2.h,
                    ),
                    width: 44.w,
                    height: 20.h,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(255, 83, 83, 1),
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: Text(
                      "30%",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w800,
                        fontSize: 15.sp,
                        fontFamily: 'RAYDIS',
                        height: 1.3.h,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/chegirma.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SectionHeader extends StatelessWidget {
  final String title;
  final String? subtitle;
  final bool withSubtitle;
  final String? trailing;
  final double topPadding;
  SectionHeader({
    required this.title,
    this.subtitle,
    this.trailing,
    this.topPadding = 10,
    this.withSubtitle = true,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        16.w,
        topPadding.h,
        16.w,
        withSubtitle ? 2.h : 0,
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w800,
                    color: kText,
                  ),
                ),
                if (withSubtitle && subtitle != null) ...[
                  SizedBox(height: 2.h),
                  Text(
                    subtitle!,
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: Color.fromRGBO(95, 100, 110, 1),
                    ),
                  ),
                ],
              ],
            ),
          ),
          if (trailing != null)
            Text(
              trailing!,
              style: TextStyle(
                fontSize: 16.sp,
                color: kBlue,
                fontWeight: FontWeight.w600,
              ),
            ),
        ],
      ),
    );
  }
}
