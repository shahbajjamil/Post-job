import 'dart:math';

import 'package:flutter/material.dart';
import 'package:post_job/feature/filter/model/filter_model.dart';
import 'package:post_job/utils/screen_size.dart';
import 'package:post_job/widget/text_icon.dart';

import '../../../constant/app_color.dart';
import '../../filter/filter_screen.dart';
import '../model/job_model.dart';
import 'component/job_card.dart';

class JobScreen extends StatefulWidget {
  const JobScreen({super.key});

  @override
  State<JobScreen> createState() => _JobScreenState();
}

class _JobScreenState extends State<JobScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            _topSearchBar(context),
            const Divider(
              height: 10,
              thickness: 4,
              color: Colors.black,
            ),
            _jobBar(),
            Divider(
              height: 10,
              thickness: 1,
              color: AppColors.grey.withOpacity(0.5),
            ),
            // OutlinedButton.icon(
            //   style: OutlinedButton.styleFrom(
            //     padding: const EdgeInsets.symmetric(horizontal: 16),
            //     shape: RoundedRectangleBorder(
            //       borderRadius: BorderRadius.circular(8),
            //     ),
            //     backgroundColor: AppColors.primaryColor,
            //     foregroundColor: AppColors.white,
            //   ),
            //   onPressed: () {},
            //   icon: const Icon(Icons.mobiledata_off),
            //   label: const Text('Relevance'),
            // ),
            _filterbar(),
            Expanded(
              child: ListView.builder(
                itemCount: jobList.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  var data = jobList[index];
                  return JobCard(data: data);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Row _filterbar() {
    return Row(
      children: [
        InkWell(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const FilterScreen()));
          },
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: AppColors.primaryColor,
              ),
              // color: AppColors.primaryColor,
            ),
            child: Transform.rotate(
              angle: 90 * pi / 180,
              child: const Icon(
                Icons.tune,
                color: AppColors.primaryColor,
              ),
            ),
          ),
        ),
        Expanded(
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 16),
            height: 40,
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: filterTypeList.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  var data = filterTypeList[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(
                          color: data.selected
                              ? AppColors.primaryColor
                              : AppColors.grey,
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        backgroundColor: data.selected
                            ? AppColors.primaryColor
                            : AppColors.white,
                        foregroundColor:
                            data.selected ? AppColors.white : AppColors.grey,
                      ),
                      onPressed: () {
                        setState(() => data.selected = !data.selected);
                      },
                      child: Text(data.title),
                    ),
                  );
                }),
          ),
        ),
      ],
    );
  }

  Row _jobBar() {
    var styleFrom = TextButton.styleFrom(
      padding: EdgeInsets.zero,
      foregroundColor: AppColors.black,
    );
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        TextButton.icon(
          style: styleFrom,
          onPressed: () {},
          icon: const Icon(Icons.touch_app_outlined),
          label: const Text('Apply for Job'),
        ),
        TextButton.icon(
          style: styleFrom,
          onPressed: () {},
          icon: const Icon(Icons.image_search),
          label: const Text('Post a Job'),
        ),
        TextButton.icon(
          style: styleFrom,
          onPressed: () {},
          icon: const Icon(Icons.collections_bookmark_outlined),
          label: const Text('Posted Job'),
        ),
      ],
    );
  }

  Row _topSearchBar(BuildContext context) {
    return Row(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          width: screenWidth(context) * 0.13,
          height: screenWidth(context) * 0.13,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(16)),
            image: DecorationImage(
              image:
                  NetworkImage('https://randomuser.me/api/portraits/men/1.jpg'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(right: 32.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search jobs',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: AppColors.grey.withOpacity(0.2),
                prefixIcon: const Icon(Icons.search),
                suffixIcon: const Icon(Icons.mic_none),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
