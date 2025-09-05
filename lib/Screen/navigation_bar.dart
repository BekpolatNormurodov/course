import 'package:course/library.dart';

class NavigatorBar extends StatefulWidget {
  NavigatorBar({super.key});

  @override
  State<NavigatorBar> createState() => _NavigatorBarState();
}

class _NavigatorBarState extends State<NavigatorBar> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    List page = [AsosiyPage(), KurslarPage()];
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
      child: BottomNavigationBar(
        elevation: 8,
        backgroundColor: Colors.white,
        currentIndex: index,
        onTap: onChanged,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Color.fromRGBO(53, 114, 237, 1),
        unselectedItemColor: Color.fromRGBO(0, 0, 0, 0.5),
        showUnselectedLabels: true,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Asosiy',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_book_outlined),
            label: 'Kurslar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.leaderboard_outlined),
            label: 'Reyting',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Profil',
          ),
        ],
      ),
    );
  }
}
