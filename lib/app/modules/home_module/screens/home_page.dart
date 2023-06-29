// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../new_record_module/screens/new_record_page.dart';
import '../../profile_module/screens/profile_page.dart';
import '../../security_details_module/screens/security_details_page.dart';
import '../controller/home_controller.dart';
import 'package:group_list_view/group_list_view.dart';

import 'package:percent_indicator/percent_indicator.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeController homeController = Get.put(HomeController());

  List<Widget> widgetOptions = [
    const HomeWidget(),
    const AnalysisWidget(),
    const SearchWidget(),
    const SettingWidget(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        leading: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: InkWell(
            onTap: () {
              Get.to(() => const ProfilePage());
            },
            child: const Icon(
              Icons.person_outline_rounded,
              color: Colors.black,
              size: 32,
            ),
          ),
        ),
        title: Obx(
          () => Text(
            homeController.appBarTitle.value,
            style: const TextStyle(color: Colors.black),
          ),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: InkWell(
              onTap: () {
                Get.to(() => const NewRecordPage());
              },
              child: const Icon(
                Icons.add,
                color: Colors.black,
                size: 32,
              ),
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

// Setting Widget
class SettingWidget extends StatefulWidget {
  const SettingWidget({super.key});

  @override
  State<SettingWidget> createState() => _SettingWidgetState();
}

class _SettingWidgetState extends State<SettingWidget> {
  HomeController homeController = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                      child: Text(
                        'Profile',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Get.to(() => const ProfilePage());
                      },
                      child: const Icon(
                        Icons.arrow_forward_ios_outlined,
                        size: 28,
                      ),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                      child: Text(
                        'Permissions',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward_ios_outlined,
                      size: 28,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                      child: Text(
                        'Sync',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    Obx(() => Switch.adaptive(
                          value: homeController.isSyncSwitchOn.value,
                          onChanged: (value) {
                            homeController.syncSwitchOnOff();
                          },
                        )),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                      child: Text(
                        'Autofill',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    Obx(() => Switch.adaptive(
                          value: homeController.isAutofillSwitchOn.value,
                          onChanged: (value) {
                            homeController.autofillSwitchOnOff();
                          },
                        )),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                      child: Text(
                        'About',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward_ios_outlined,
                      size: 28,
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                      child: Text(
                        'Help',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward_ios_outlined,
                      size: 28,
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                      child: Text(
                        'Version',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    Text(
                      '1.2.2',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Search Widget

class SearchWidget extends StatefulWidget {
  const SearchWidget({super.key});

  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  final List<Map<String, dynamic>> _searchList = [
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
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              height: 15,
            ),
            Row(
              children: [
                Expanded(
                  child: SearchBar(
                    elevation: MaterialStateProperty.all(3),
                    hintText: 'search here...',
                    padding: MaterialStateProperty.all(
                      const EdgeInsets.symmetric(horizontal: 10),
                    ),
                    trailing: const [
                      Icon(Icons.search_outlined),
                    ],
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _searchList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 0),
                    leading: CircleAvatar(
                      radius: 30,
                      backgroundImage: NetworkImage(
                        _searchList.toList()[index]['starticon'].toString(),
                      ),
                      backgroundColor: Colors.transparent,
                    ),
                    title: Text(
                      _searchList.toList()[index]['title'].toString(),
                      style: const TextStyle(fontSize: 18),
                    ),
                    subtitle: Text(
                      _searchList.toList()[index]['subtitle'].toString(),
                      style: const TextStyle(fontSize: 15),
                    ),
                    trailing: CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Icon(
                        _searchList.toList()[index]['endicon'] as IconData?,
                        color: Colors.black,
                        size: 32,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Analysis Widget

class AnalysisWidget extends StatefulWidget {
  const AnalysisWidget({super.key});

  @override
  State<AnalysisWidget> createState() => _AnalysisWidgetState();
}

class _AnalysisWidgetState extends State<AnalysisWidget> {
  final List<Map<String, dynamic>> _analysisList = [
    {
      'starticon':
          'https://cdn3.iconfinder.com/data/icons/popular-services-brands/512/behance-512.png',
      'title': 'Behance',
      'subtitle': 'design.steve@gmail.com',
      'endicon': Icons.arrow_forward_ios_outlined,
    },
    {
      'starticon': 'https://cdn-icons-png.flaticon.com/512/5436/5436922.png',
      'title': 'Adobe',
      'subtitle': 'adobe.steve@gmail.com',
      'endicon': Icons.arrow_forward_ios_outlined,
    },
    {
      'starticon':
          'https://e7.pngegg.com/pngimages/708/187/png-clipart-netflix-round-logo-tech-companies-thumbnail.png',
      'title': 'Netflix',
      'subtitle': 'design.netflix@gmail.com',
      'endicon': Icons.arrow_forward_ios_outlined,
    },
    {
      'starticon':
          'https://cdn3.iconfinder.com/data/icons/popular-services-brands/512/spotify-512.png',
      'title': 'Spotify',
      'subtitle': 'spotify.account@gmail.com',
      'endicon': Icons.arrow_forward_ios_outlined,
    },
    {
      'starticon':
          'https://upload.wikimedia.org/wikipedia/commons/c/c1/Steam_Logo.png',
      'title': 'Steam',
      'subtitle': 'Steam.account@gmail.com',
      'endicon': Icons.arrow_forward_ios_outlined,
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircularPercentIndicator(
                    backgroundWidth: 15,
                    radius: 65.0,
                    animation: true,
                    animationDuration: 1200,
                    lineWidth: 10.0,
                    percent: 0.82,
                    center: const Text(
                      "82 %",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20.0),
                    ),
                    circularStrokeCap: CircularStrokeCap.round,
                    backgroundColor: Colors.black,
                    progressColor: Colors.white,
                  ),
                ],
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: Text(
                      "82% Secured",
                      style: TextStyle(
                          fontWeight: FontWeight.w500, fontSize: 18.0),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: const Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "82",
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 22.0),
                        ),
                        Text(
                          "Safe",
                          style: TextStyle(fontSize: 18.0),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: const Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "12",
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 22.0),
                        ),
                        Text(
                          "Weak",
                          style: TextStyle(fontSize: 18.0),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: const Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "8",
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 22.0),
                        ),
                        Text(
                          "Risk",
                          style: TextStyle(fontSize: 18.0),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Analysis',
                    style: TextStyle(fontSize: 20),
                  ),
                  Icon(
                    Icons.filter_list_outlined,
                    size: 32,
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                child: ListView.builder(
                  shrinkWrap: true,
                  primary: false,
                  itemCount: _analysisList.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      contentPadding: const EdgeInsets.symmetric(horizontal: 0),
                      leading: CircleAvatar(
                        radius: 30,
                        backgroundImage: NetworkImage(
                          _analysisList.toList()[index]['starticon'].toString(),
                        ),
                        backgroundColor: Colors.transparent,
                      ),
                      title: Text(
                        _analysisList.toList()[index]['title'].toString(),
                        style: const TextStyle(fontSize: 18),
                      ),
                      subtitle: Text(
                        _analysisList.toList()[index]['subtitle'].toString(),
                        style: const TextStyle(fontSize: 15),
                      ),
                      trailing: CircleAvatar(
                        backgroundColor: Colors.white,
                        child: Icon(
                          _analysisList.toList()[index]['endicon'] as IconData?,
                          color: Colors.black,
                          size: 32,
                        ),
                      ),
                      onTap: () {
                        Get.to(
                          () => SecurityDetailsPage(
                              analysisList: _analysisList.toList(),
                              index: index),
                        );
                      },
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
