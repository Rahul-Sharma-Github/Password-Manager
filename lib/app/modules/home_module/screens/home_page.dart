// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/home_controller.dart';
import 'package:group_list_view/group_list_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeController homeController = Get.put(HomeController());

  List<Widget> widgetOptions = [
    const HomeWidget(),
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
        title: Obx(
          () => Text(
            homeController.appBarTitle.value,
            style: const TextStyle(color: Colors.black),
          ),
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
  const HomeWidget({super.key});

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  final Map<String, List<Map<dynamic, dynamic>>> _elements = {
    'Priority': [
      {
        'starticon':
            'https://cdn3.iconfinder.com/data/icons/popular-services-brands/512/behance-512.png',
        'title': 'Behance',
        'subtitle': 'design.steve@gmail.com',
        'endicon': Icons.copy_rounded,
      },
      {
        'starticon': 'https://cdn-icons-png.flaticon.com/512/5436/5436922.png',
        'title': 'Adobe',
        'subtitle': 'adobe.steve@gmail.com',
        'endicon': Icons.copy_rounded,
      },
    ],
    'Entertainment': [
      {
        'starticon':
            'https://e7.pngegg.com/pngimages/708/187/png-clipart-netflix-round-logo-tech-companies-thumbnail.png',
        'title': 'Netflix',
        'subtitle': 'design.netflix@gmail.com',
        'endicon': Icons.copy_rounded,
      },
      {
        'starticon':
            'https://cdn3.iconfinder.com/data/icons/popular-services-brands/512/spotify-512.png',
        'title': 'Spotify',
        'subtitle': 'spotify.account@gmail.com',
        'endicon': Icons.copy_rounded,
      },
      {
        'starticon':
            'https://upload.wikimedia.org/wikipedia/commons/c/c1/Steam_Logo.png',
        'title': 'Steam',
        'subtitle': 'Steam.account@gmail.com',
        'endicon': Icons.copy_rounded,
      },
    ],
  };

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.amber,
      child: GroupListView(
        padding: const EdgeInsets.symmetric(vertical: 20),
        sectionsCount: _elements.keys.toList().length,
        countOfItemInSection: (int section) {
          return _elements.values.toList()[section].length;
        },
        itemBuilder: (BuildContext context, IndexPath index) {
          return ListTile(
            // shape: Border.all(),
            leading: CircleAvatar(
              radius: 30,
              backgroundImage: NetworkImage(
                _elements.values
                    .toList()[index.section][index.index]['starticon']
                    .toString(),
              ),
              backgroundColor: Colors.transparent,
            ),
            title: Text(
              _elements.values
                  .toList()[index.section][index.index]['title']
                  .toString(),
              style: const TextStyle(fontSize: 18),
            ),
            subtitle: Text(
              _elements.values
                  .toList()[index.section][index.index]['subtitle']
                  .toString(),
              style: const TextStyle(fontSize: 15),
            ),
            trailing: CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(
                _elements.values.toList()[index.section][index.index]
                    ['endicon'],
                color: Colors.black,
                size: 32,
              ),
            ),
          );
        },
        groupHeaderBuilder: (BuildContext context, int section) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
            child: Text(
              _elements.keys.toList()[section],
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
          );
        },
        separatorBuilder: (context, index) => const SizedBox(height: 10),
        sectionSeparatorBuilder: (context, section) =>
            const SizedBox(height: 10),
      ),
    );
  }
}
