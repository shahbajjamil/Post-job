import 'dart:io';

import 'package:flutter/material.dart';
import 'package:post_job/feature/job/view/job_screen.dart';

import '../../../constant/app_color.dart';

class MainBottomScreen extends StatefulWidget {
  const MainBottomScreen({super.key});

  @override
  State<MainBottomScreen> createState() => _MainBottomScreenState();
}

class _MainBottomScreenState extends State<MainBottomScreen> {
  int currentIndex = 4;

  List<Widget> screenList = [
    const Center(child: Text('Home')),
    const Center(child: Text('Activity Tracker')),
    const Center(child: Text('Post')),
    const Center(child: Text('Notification')),
    const JobScreen()
  ];

  @override
  Widget build(BuildContext context) {
    // super.build(context);
    return Scaffold(
      body: screenList[currentIndex],
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: EdgeInsets.only(
              top: 10,
              bottom: Platform.isAndroid ? 10 : 0,
              left: 10,
              right: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: bottomNavBarIcons
                .map(
                  (e) => GestureDetector(
                    onTap: () {
                      setState(() {
                        currentIndex = e['index'];
                      });
                    },
                    child: BuildNavIcon(
                        icon: e['icon'],
                        label: e['title'],
                        isSelected: e['index'] == currentIndex),
                  ),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}

class BuildNavIcon extends StatelessWidget {
  const BuildNavIcon({
    Key? key,
    required this.icon,
    required this.label,
    required this.isSelected,
  }) : super(key: key);

  final IconData icon;
  final String label;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
      color: Colors.transparent,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon,
              color: isSelected ? AppColors.primaryColor : AppColors.grey),
          Text(
            label,
            style: TextStyle(
              color: isSelected ? AppColors.primaryColor : AppColors.grey,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}

List bottomNavBarIcons = [
  {
    "icon": Icons.home_filled,
    "title": "Home",
    "index": 0,
  },
  {
    "icon": Icons.calendar_month,
    "title": "Activity Tracker",
    "index": 1,
  },
  {
    "icon": Icons.add_circle,
    "title": "Post",
    "index": 2,
  },
  {
    "icon": Icons.notifications_on_outlined,
    "title": "Notification",
    "index": 3,
  },
  {
    "icon": Icons.work,
    "title": "Jobs",
    "index": 4,
  },
];
