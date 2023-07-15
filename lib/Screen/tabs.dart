import 'package:flutter/material.dart';
import 'package:meal_app/Screen/catogory.dart';
import 'package:meal_app/Screen/favorite.dart';

class Tabs extends StatefulWidget {
  const Tabs({super.key});

  @override
  State<Tabs> createState() => _TabsState();
}

int selectedindex = 0;

class _TabsState extends State<Tabs> {
  @override
  Widget build(BuildContext context) {
    Widget titles = const Text("pick up your catogory");
    Widget activepage = const CategoriesScreen();
    if (selectedindex == 1) {
      activepage = const favorites();
      titles = const Text("home page");
    }
    void selectedpage(int index) {
      setState(() {
        selectedindex = index;
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: titles,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedindex,
        onTap: selectedpage,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home Page"),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: "favorites")
        ],
      ),
      body: activepage,
    );
  }
}
