import 'package:course/library.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({super.key});

  static const _blue = Color.fromRGBO(53, 114, 237, 1);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  ProfilePage._blue,
          body: Column(
            children: [
              Container(
                height: 225.h,
                width: double.infinity,
                color: ProfilePage._blue,
                padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 40.h),
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.topRight,
                      child: Image.asset("assets/icons/soundwhite.png"),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Column(
                        children: [
                          Image.asset(
                               "assets/icons/personblue.png",
                             ),
                      
                          Text(
                            'Eshonov Fakhriyor',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22.sp,
                              fontWeight: FontWeight.w700,
                              fontFamily: 'SemiBold'
                            ),
                          ),
                          SizedBox(height: 6.h),
                          Text(
                            '+998 97 628 28 82',
                            style: TextStyle(
                               color: Colors.white,
                              fontSize: 14.sp,
                              fontFamily: 'Regular'
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              /// 2) OQ PANEL (chiplar shu ichida, ko‘kka qisman kirib turadi)
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                  color: Colors.white,
                    borderRadius: BorderRadius.vertical(top: Radius.circular(18.r))
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 17.h),
                        child: Row(
                          children: [
                            Expanded(
                              child: _StatChip(
                                title: 'Samaradorlik',
                                icon: 'raketa',
                                value: '%98',
                              ),
                            ),
                            SizedBox(width: 12.w),
                            Expanded(
                              child: _StatChip(
                                title: 'Yakunlangan\nkurslar',
                                icon: 'school',
                                value: '58',
                              ),
                            ),
                            SizedBox(width: 12.w),
                            Expanded(
                              child: _StatChip(
                                title: 'Yakunlangan\ndarslar',
                                icon: 'checklist',
                                value: '12',
                              ),
                            ),
                          ],
                        ),
                      ),
                
                      SizedBox(height: 10.h),
                
                      /// 3) MENYU LENTASI
                      _MenuItem(
                        leadingIcon: "edit",
                        title: "Ma’lumotlarni tahrirlash",
                      ),
                      _ThinDivider(),
                      _MenuItem(
                        leadingIcon: "kurs",
                        title: "Mening kurslarim",
                      ),
                      _ThinDivider(),
                      _MenuItem(
                        leadingIcon: "history",
                        title: "Tranzaksiyalar tarixi",
                      ),
                      _ThinDivider(),
                      _MenuItem(
                        leadingIcon: "languageblack",
                        title: "Til",
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "O’zbekcha",
                              style: TextStyle(
                                color: Color.fromRGBO(112, 114, 118, 1),
                                fontSize: 14.sp,
                                fontFamily: 'Regular'
                              ),
                            ),
                            SizedBox(width: 12.w),
                            Icon(
                              Icons.chevron_right,
                              size: 18.sp,
                              color: Color.fromRGBO(159, 166, 178, 1),
                            ),
                          ],
                        ),
                      ),
                      _ThinDivider(),
                      _MenuItem(
                        leadingIcon: "share",
                        title: "Biz bilan aloqa",
                      ),
                      _ThinDivider(),
                      _MenuItem(
                        leadingIcon: "exit",
                        title: "Akkountdan chiqish",
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
  }
}

/// --- Statistik chip (to‘g‘ri maket: tepa label, pastda ikon + qiymat)
class _StatChip extends StatelessWidget {
  final String title;
  final String value;
  final String icon;

  _StatChip({required this.title, required this.value, required this.icon});

  static const _chipBg = Color.fromRGBO(238, 240, 245, 1);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 92.h,
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
      decoration: BoxDecoration(
        color: _chipBg,
        borderRadius: BorderRadius.circular(18.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          /// Label (kichik, kulrang)
          Text(
            title,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 12.sp,
              color: Colors.black,
              fontFamily: 'Regular',
              fontWeight: FontWeight.w500
            ),
          ),
      
          /// Pastki qatorda: ikon + qiymat
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset("assets/icons/$icon.png", width: 20.w,),
              SizedBox(width: 6.w),
              Text(
                value,
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w600,
                  color: Color.fromRGBO(45, 52, 56, 1),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

/// --- Menyu bandi (leading ikon mayda, kulrang doira ichida)
class _MenuItem extends StatelessWidget {
  final String leadingIcon;
  final String title;
  final Widget? trailing;

  _MenuItem({required this.leadingIcon, required this.title, this.trailing});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 14.h, horizontal: 14.w),
      alignment: Alignment.center,
      child: Row(
        children: [
          Image.asset("assets/icons/$leadingIcon.png", width: 20.w),
          SizedBox(width: 16.w),
          Expanded(
            child: Text(
              title,
              style: TextStyle(
                fontSize: 16.sp,
                color: Color.fromRGBO(0, 0, 0, 1),
                fontFamily: 'Regular'
              ),
            ),
          ),
          trailing ??
              Icon(Icons.chevron_right, size: 20.sp, color: Color.fromRGBO(159, 166, 178, 1)),
        ],
      ),
    );
  }
}

class _ThinDivider extends StatelessWidget {
  _ThinDivider();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1,
      color: Color(0xFFE7EBF0),
    );
  }
}
