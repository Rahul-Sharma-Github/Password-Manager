// ignore_for_file: avoid_unnecessary_containers, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/security_details_controller.dart';

class SecurityDetailsPage extends StatefulWidget {
  final analysisList;
  final index;
  const SecurityDetailsPage(
      {super.key,
      required List<Map<String, dynamic>> this.analysisList,
      required this.index});

  @override
  State<SecurityDetailsPage> createState() => _SecurityDetailsPageState();
}

class _SecurityDetailsPageState extends State<SecurityDetailsPage> {
  SecurityDetailsController securityDetailsController =
      Get.put(SecurityDetailsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        forceMaterialTransparency: true,
        title: const Text(
          'Details',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: InkWell(
              onTap: () {},
              child: const Icon(
                Icons.delete_outline_outlined,
                color: Colors.black,
                size: 32,
              ),
            ),
          )
        ],
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              // mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(
                  height: 15,
                ),
                Container(
                  alignment: Alignment.center,
                  child: Card(
                    elevation: 0,
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 45,
                          backgroundImage: NetworkImage(
                            widget.analysisList[widget.index]['starticon']
                                .toString(),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                        child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 5),
                                      child: Text(
                                        widget.analysisList[widget.index]
                                            ['title'],
                                        style: const TextStyle(fontSize: 22),
                                      ),
                                    )),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                        child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 5),
                                      child: Text(
                                        widget.analysisList[widget.index]
                                            ['subtitle'],
                                        style: const TextStyle(fontSize: 16),
                                      ),
                                    )),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Details & Settings',
                            style: TextStyle(fontSize: 20),
                          ),
                          Icon(
                            Icons.keyboard_arrow_down_outlined,
                            size: 32,
                          ),
                        ],
                      ),
                      const Divider(
                        thickness: 2,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        child: Row(
                          children: [
                            const Expanded(
                              flex: 1,
                              child: Text(
                                'Link',
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Text(
                                '${widget.analysisList[widget.index]['title'].toString()}.com',
                                style: const TextStyle(
                                    fontSize: 16,
                                    color: Colors.blue,
                                    decoration: TextDecoration.underline),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        child: Row(
                          children: [
                            const Expanded(
                              flex: 1,
                              child: Text(
                                'User id',
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Text(
                                widget.analysisList[widget.index]['subtitle']
                                    .toString(),
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.black54,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 15),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Text(
                                'Password',
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Text(
                                'Cczsbbkjs545sc',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black54,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Expanded(
                              flex: 1,
                              child: Text(
                                'Autofill',
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Obx(
                                () => Container(
                                  alignment: Alignment.centerLeft,
                                  child: Switch.adaptive(
                                    value: securityDetailsController
                                        .isSwitchOn.value,
                                    onChanged: (value) {
                                      securityDetailsController
                                          .isSwitchOn.value = value;
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Divider(
                        thickness: 2,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          OutlinedButton(
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              ),
                            ),
                            onPressed: () {},
                            child: const Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 5, vertical: 15),
                              child: Text(
                                'Copy password',
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                          ),
                          OutlinedButton(
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              ),
                            ),
                            onPressed: () {},
                            child: const Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 5, vertical: 15),
                              child: Text(
                                'Change password',
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
