// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/home_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeController homeController = Get.put(HomeController());

  List<Widget> widgetOptions = [
    HomeWidget(),
    const Text('Analysis'),
    const Text('Search'),
    const Text('Setting'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        leading: const Padding(
          padding: EdgeInsets.only(left: 10),
          child: Icon(
            Icons.person_outline_rounded,
            color: Colors.black,
            size: 32,
          ),
        ),
        title: const Text(
          'Passwords',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: Icon(
              Icons.add,
              color: Colors.black,
              size: 32,
            ),
          )
        ],
      ),
      body: Obx(
        () => widgetOptions.elementAt(homeController.selectedIndex.value),
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.manage_search_outlined),
              label: 'Analysis',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search_outlined),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings_outlined),
              label: 'Setting',
            ),
          ],
          currentIndex: homeController.selectedIndex.value,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.grey,
          showUnselectedLabels: true,
          showSelectedLabels: true,
          onTap: (value) => homeController.onItemTapped(value),
          iconSize: 32,
          selectedLabelStyle: const TextStyle(fontSize: 14),
          unselectedLabelStyle: const TextStyle(fontSize: 14),
        ),
      ),
    );
  }
}

// Home Widget
class HomeWidget extends StatefulWidget {
  HomeWidget({super.key});

  @override
  State<HomeWidget> createState() => _HomeWidgetState();

  final Map<String, List> _elements = {
    'Team A': ['Klay Lewis', 'Ehsan Woodard', 'River Bains'],
    'Team B': ['Toyah Downs', 'Tyla Kane'],
  };
}

class _HomeWidgetState extends State<HomeWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.amber,
      child: ,
    );
  }
}
