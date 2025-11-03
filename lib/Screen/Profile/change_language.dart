import 'package:course/library.dart';

// ---- Til modelleri
class LanguageOption {
  final String title;
  final Locale locale;
  final String assetPath;

   LanguageOption({
    required this.title,
    required this.locale,
    required this.assetPath,
  });
}

final _languages = <LanguageOption>[
  LanguageOption(
    title: 'Русский',
    locale:  Locale('ru'),
    assetPath: 'assets/icons/ru.png',
  ),
  LanguageOption(
    title: "O'zbekcha",
    locale:  Locale('uz', 'UZ'),
    assetPath: 'assets/icons/uz.png',
  ),
];

class ChangeLanguagePage extends StatefulWidget {
  ChangeLanguagePage({super.key});

  @override
  State<ChangeLanguagePage> createState() => _ChangeLanguagePageState();
}

class _ChangeLanguagePageState extends State<ChangeLanguagePage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      showLanguageBottomSheet(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                color:  Color.fromRGBO(238, 240, 245, 1),
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Icon(
                Icons.arrow_back_ios_new,
                size: 18.sp,
                color: Colors.black87,
              ),
            ),
          ),
        ),
        title: Text(
          "Tilni o'zgartirish",
          style: TextStyle(
            color: Colors.black87,
            fontSize: 20.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}

Future showLanguageBottomSheet(BuildContext context) {
  return showModalBottomSheet(
    context: context,
    isScrollControlled: false,
    backgroundColor: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
    ),
    builder: (ctx) => _FilterSheet(),
  );
}

class _FilterSheet extends StatefulWidget {
  @override
  State<_FilterSheet> createState() => _FilterSheetState();
}

class _FilterSheetState extends State<_FilterSheet> {
  final _formKey = GlobalKey<FormState>();
  late Locale _selected;

  @override
  void initState() {
    super.initState();
    _selected =  Locale('uz', 'UZ'); // yoki Localizations.localeOf(context) ni post-frame’da oling
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(16.w, 20.h, 16.w, 60.h),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Header
            Row(
              children: [
                Expanded(
                  child: Text(
                    "Til",
                    style: GoogleFonts.rubik(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0,
                      color: Colors.black,
                    ),
                  ),
                ),
                InkWell(
                  onTap: () => Navigator.pop(context),
                  child:  Icon(
                    Icons.close,
                    color: Color.fromRGBO(255, 10, 10, 1),
                  ),
                ),
                SizedBox(width: 12.h),
              ],
            ),
            SizedBox(height: 18.h),

            // === TIL RO‘YXATI (Til sarlavhasi va Saqlash orasida) ===
            ListView.separated(
              shrinkWrap: true,
              physics:  NeverScrollableScrollPhysics(),
              itemCount: _languages.length,
              separatorBuilder: (_, __) =>  Padding(
                padding:  EdgeInsets.symmetric(vertical: 4.h),
                child: Divider(height: 1, color: Color.fromRGBO(228, 233, 235, 1),),
              ),
              itemBuilder: (ctx, i) {
                final item = _languages[i];
                final isSelected =
                    item.locale.languageCode == _selected.languageCode &&
                    (item.locale.countryCode ?? '') ==
                        (_selected.countryCode ?? '');

                return ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(12.r),
                    child: Image.asset(
                      item.assetPath,
                      width: 24.w,
                      height: 24.w,
                      fit: BoxFit.cover,
                    ),
                  ),
                  title: Text(
                    item.title,
                    style: GoogleFonts.rubik(
                      fontSize: 16.sp,
                      fontWeight: isSelected ? FontWeight.w500 : FontWeight.w400,
                      color: Color.fromRGBO(5, 35, 56, 1),
                      letterSpacing: 0,
                    ),
                  ),
                  trailing: isSelected
                      ?  Icon(Icons.check, color: Color.fromRGBO(53, 114, 237, 1))
                      :  SizedBox.shrink(),
                  onTap: () {
                    setState(() => _selected = item.locale);
                    // Agar darhol qo‘llash kerak bo‘lsa:
                    // Get.updateLocale(item.locale);
                  },
                );
              },
            ),

            SizedBox(height: 24.h),

            // Saqlash
            SizedBox(
              width: double.infinity,
              height: 48.h,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor:  Color.fromRGBO(53, 114, 237, 1),
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(vertical: 14.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.r),
                  ),
                ),
                onPressed: () {
                  // Tanlangan tilni shu yerda qo‘llang:
                  // Get.updateLocale(_selected);
                  Navigator.pop(context);
                },
                child: Text(
                  "Saqlash",
                  style: GoogleFonts.rubik(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0,
                    height: 1.4,
                  ),
                ),
              ),
            ),

            SizedBox(height: MediaQuery.of(context).viewInsets.bottom),
          ],
        ),
      ),
    );
  }
}