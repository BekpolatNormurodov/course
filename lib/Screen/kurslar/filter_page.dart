import 'package:course/library.dart';

class FilterPage extends StatefulWidget {
   FilterPage({super.key});

  @override
  State<FilterPage> createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  final List<String> teachers =  [
    'Sardor Qodirov',
    'Isxoqjon Ahmedov',
    'Ahmadjon Xashimov',
    'Otabek Raymjonov',
    'Nodirbek Abdubannobov',
    'Murodil Tursunaliyev',
    'Firdavs O‘rinov',
    'Мадина Сабирова',
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
      side: BorderSide(color: kBlue, width: 1.4.w),
      checkColor:  WidgetStatePropertyAll(Colors.white),
      fillColor: WidgetStateProperty.resolveWith<Color?>(
        (states) =>
            states.contains(WidgetState.selected) ? kBlue : Colors.transparent,
      ),
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      visualDensity:  VisualDensity(horizontal: -4, vertical: -4),
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
          padding: EdgeInsets.fromLTRB(16.w, 12.h, 16.w, 60.h),
          children: [
            // O‘qituvchilar
            _SectionCard(
              title: "O‘qituvchilar",
              child: SizedBox(
                height: 260.h,
                child: Scrollbar(
                  controller: _scrollCtrl, // <-- MUHIM
                  thumbVisibility: true,
                  radius: Radius.circular(8.r),
                  thickness: 3.w,
                  child: ListView.separated(
                    itemCount: teachers.length,
                    controller: _scrollCtrl, // <-- AYNAN SHU controller
                    separatorBuilder: (_, __) => SizedBox(height: 6.h),
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
                  InkWell(
                    borderRadius: BorderRadius.circular(8.r),
                    onTap: () => setState(() => priceType = 'Pullik'),
                    child: Row(
                      children: [
                        Checkbox(
                          value: priceType == 'Pullik',
                          onChanged: (_) => setState(() => priceType = 'Pullik'),
                        ),
                        SizedBox(width: 6.w),
                        Expanded(
                          child: Row(
                            children: [
                              Text(
                                'Pullik',
                                style: TextStyle(
                                  fontSize: 14.5.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(width: 6.w),
                              Icon(
                                Icons.keyboard_arrow_down_rounded,
                                size: 18.sp,
                                color: Colors.black54,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 6.h),
                  _CheckRow(
                    label: 'Bepul',
                    value: priceType == 'Bepul',
                    onChanged: (_) => setState(() => priceType = 'Bepul'),
                  ),
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
                        padding: EdgeInsets.symmetric(vertical: 4.h),
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
      padding: EdgeInsets.fromLTRB(12.w, 12.h, 12.w, 12.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 15.5.sp,
              fontWeight: FontWeight.w800,
              color: Colors.black,
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
        Checkbox(
          value: value,
          onChanged: onChanged,
          checkColor: Color.fromRGBO(236, 226, 82, 1),
        ),
        SizedBox(width: 6.w),
        Expanded(
          child: Text(
            label,
            style: TextStyle(
              fontSize: 14.5.sp,
              color: Colors.black,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}
