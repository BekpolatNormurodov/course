import 'package:course/library.dart';
import 'package:flutter/cupertino.dart';
import 'package:course/Screen/rating_page.dart';

class NavigatorBar extends StatefulWidget {
  NavigatorBar({super.key});

  @override
  State<NavigatorBar> createState() => _NavigatorBarState();
}

class _NavigatorBarState extends State<NavigatorBar> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    List page = [AsosiyPage(), KurslarPage(), RatingPage(), ProfilePage()];
    return Scaffold(
      body: page[_currentIndex],
      bottomNavigationBar: _BottomBar(
        index: _currentIndex,
        onChanged: (i) => setState(() => _currentIndex = i),
      ),
    );
  }
}

class _BottomBar extends StatelessWidget {
  final int index;
  final ValueChanged<int> onChanged;
  _BottomBar({required this.index, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            offset: Offset(1, -1),
            color: Colors.black.withOpacity(.1),
            blurRadius: 4,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(18.r),
          topRight: Radius.circular(18.r),
        ),
        child: BottomNavigationBar(
          elevation: 8,
          backgroundColor: Colors.white,
          currentIndex: index,
          onTap: onChanged,
          type: BottomNavigationBarType.fixed,
          showUnselectedLabels: true,
          selectedItemColor: Color.fromRGBO(0, 85, 255, 1),
          unselectedItemColor: Color.fromRGBO(0, 0, 0, 0.5),
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: 'Asosiy',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.school_outlined),
              label: 'Kurslar',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.workspace_premium_outlined),
              label: 'Reyting',
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.person),
              label: 'Profil',
            ),
          ],
        ),
      ),
    );
  }
}
