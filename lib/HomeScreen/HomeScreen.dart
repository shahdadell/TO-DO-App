import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';
import 'package:htodo/pages/home_view/home_view.dart';
import 'package:htodo/pages/settings_view/settings_view.dart';


class HomeScreen extends StatefulWidget {
  static const routeName = "Home";

   HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectIndex = 0 ;
  List<Widget> pages =[
    HomeView(),
    SettingsView(),
  ];

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      floatingActionButton: GestureDetector(
        onTap: () {
          showModalBottomSheet(
            context: context,
            builder: (context) => Container(),
          );
        },
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
          ),
          padding: EdgeInsets.all(5),
          child: Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: theme.primaryColor,
            ),
            child: Icon(Icons.add,
            color: Colors.white,

            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      extendBody: true,
      body: pages[selectIndex],
      bottomNavigationBar:
      BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 10,
        child: BottomNavigationBar(
          currentIndex: selectIndex,
          onTap: (value) {
            selectIndex = value;
            setState(() {
            });
          },
          items: const [
            BottomNavigationBarItem(

              icon: ImageIcon(
                  AssetImage("assets/images/icon_list.png")
              ),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(
                  AssetImage("assets/images/icon_settings.png")
              ),
              label: "Settings",
            ),
          ],
        ),
      ),
    );
    }
}