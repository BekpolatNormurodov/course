import 'package:course/library.dart';

class FilterPage extends StatefulWidget {
  FilterPage({super.key});

  @override
  State<FilterPage> createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  final List<String> teachers = [
    'Sardor Qodirov',
    'Isxoqjon Ahmedov',
    'Ahmadjon Xashimov',
    'Otabek Raymjonov',
    'Nodirbek Abdubannobov',
    'Murodil Tursunaliyev',
    'Firdavs O‘rinov',
    'Madina Sobirova',
    'Sardor Qodirov',
    'Isxoqjon Ahmedov',
    'Ahmadjon Xashimov',
    'Otabek Raymjonov',
    'Nodirbek Abdubannobov',
    'Murodil Tursunaliyev',
    'Firdavs O‘rinov',
    'Madina Sobirova',
  ];
  final Set<int> selectedTeachers = {};

  String priceType = 'Pullik';
  final Map<String, bool> levels = {
    "Boshlang‘ich": false,
    "O‘rta darajadagi": false,
    "Yuqori darajadagi": false,
  };

  final _scrollCtrl = ScrollController();

  @override
  void dispose() {
    _scrollCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final checkboxTheme = CheckboxThemeData(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.r)),
      side: BorderSide(color: Color.fromRGBO(82, 125, 236, 1), width: 1.w),
      checkColor: WidgetStatePropertyAll(Colors.white),
      fillColor: WidgetStateProperty.resolveWith<Color?>(
        (states) =>
            states.contains(WidgetState.selected)
                ? Color.fromRGBO(82, 125, 236, 1)
                : Colors.transparent,
      ),
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      visualDensity: VisualDensity(horizontal: -4, vertical: -4),
    );
    return Theme(
      data: Theme.of(context).copyWith(checkboxTheme: checkboxTheme),
      child: Scaffold(
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
            'Filterlash',
            style: TextStyle(
              color: Colors.black87,
              fontSize: 20.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),

        body: ListView(
          padding: EdgeInsets.fromLTRB(16.w, 12.h, 16.w, 70.h),
          children: [
            // O‘qituvchilar
            _SectionCard(
              title: "O‘qituvchilar",
              child: SizedBox(
                height: 380.h,
                child: Scrollbar(
                  controller: _scrollCtrl, // <-- MUHIM
                  thumbVisibility: true,
                  radius: Radius.circular(8.r),
                  thickness: 3.w,
                  child: ListView.separated(
                    itemCount: teachers.length,
                    controller: _scrollCtrl, // <-- AYNAN SHU controller
                    separatorBuilder: (_, __) => SizedBox(height: 24.h),
                    itemBuilder: (context, i) {
                      final isSel = selectedTeachers.contains(i);
                      return _CheckRow(
                        label: teachers[i],
                        value: isSel,
                        onChanged: (v) {
                          setState(() {
                            if (v == true) {
                              selectedTeachers.add(i);
                            } else {
                              selectedTeachers.remove(i);
                            }
                          });
                        },
                      );
                    },
                  ),
                ),
              ),
            ),

            SizedBox(height: 12.h),

            // Narxi
            _SectionCard(
              title: "Narxi",
              child: Column(
                
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 4.h),
                  _CheckRow(
                    label: 'Pullik',
                    value: priceType == 'pullik',
                    onChanged: (_) => setState(() => priceType = 'pullik'),
                  ),
                  SizedBox(height: 24.h),
                  _CheckRow(
                    label: 'Bepul',
                    value: priceType == 'Bepul',
                    onChanged: (_) => setState(() => priceType = 'Bepul'),
                  ),
                  SizedBox(height: 10.h),
                ],
              ),
            ),

            SizedBox(height: 12.h),

            // Daraja
            _SectionCard(
              title: "Daraja",
              child: Column(
                children:
                    levels.keys.map((k) {
                      return Padding(
                        padding: EdgeInsets.only(top: 4.h, bottom: 20.h),
                        child: _CheckRow(
                          label: k,
                          value: levels[k]!,
                          onChanged:
                              (v) => setState(() => levels[k] = v ?? false),
                        ),
                      );
                    }).toList(),
              ),
            ),
            SizedBox(height: 12.h),
            // Saqlash
            SizedBox(
              height: 48.h,
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
                  'Barchasini saqlash',
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 15.5.sp,
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

/// Kartochka bo‘limi (sarlavhali oq container)
class _SectionCard extends StatelessWidget {
  final String title;
  final Widget child;
  _SectionCard({required this.title, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: Color.fromRGBO(82, 125, 236, 1), width: 1.w),
      ),
      padding: EdgeInsets.fromLTRB(12.w, 24.h, 12.w, 12.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 12.w),
            child: Text(
              title,
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
          ),
          SizedBox(height: 10.h),
          child,
        ],
      ),
    );
  }
}

/// Checkbox + label qatordan iborat element
class _CheckRow extends StatelessWidget {
  final String label;
  final bool value;
  final ValueChanged<bool?> onChanged;
  _CheckRow({
    required this.label,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: 10.w),
        Checkbox(value: value, onChanged: onChanged, checkColor: Colors.white),
        SizedBox(width: 10.w),
        Expanded(
          child: Text(
            label,
            style: TextStyle(
              fontSize: 16.sp,
              color: Color.fromRGBO(95, 100, 110, 1),
              fontWeight: FontWeight.w500,
              fontFamily: 'Regular',
            ),
          ),
        ),
      ],
    );
  }
}
