import 'package:flutter/material.dart';

import '../../../../constant/app_color.dart';
import '../../../../widget/text_icon.dart';
import '../../model/job_model.dart';

class JobCard extends StatefulWidget {
  const JobCard({super.key, required this.data});
  final JobModel data;

  @override
  State<JobCard> createState() => _JobCardState();
}

class _JobCardState extends State<JobCard> {
  String timeDifference(DateTime dateTime) {
    final DateTime now = DateTime.now();
    final Duration difference = now.difference(dateTime);
    if (difference.inDays > 0) {
      return '${difference.inDays} day ago';
    } else if (difference.inHours > 0) {
      return '${difference.inHours} hour ago';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes} min ago';
    } else {
      return 'now';
    }
  }

  @override
  Widget build(BuildContext context) {
    JobModel data = widget.data;
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: AppColors.grey.withOpacity(0.5),
        ),
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data.title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primaryColor,
                      ),
                    ),
                    const SizedBox(height: 4),
                    IconTextWidget(
                      title: data.company,
                      iconData: Icons.business,
                      iconSize: 16,
                    ),
                    const SizedBox(height: 4),
                    IconTextWidget(
                      title: data.location,
                      iconData: Icons.location_on_outlined,
                      iconSize: 16,
                    ),
                    const SizedBox(height: 4),
                    IconTextWidget(
                      title: data.experience,
                      iconData: Icons.work,
                      iconSize: 16,
                    ),
                    const SizedBox(height: 4),
                    IconTextWidget(
                      title: timeDifference(data.postedDate),
                      iconData: Icons.access_time_rounded,
                      iconSize: 16,
                    ),
                  ],
                ),
              ),
              Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(
                    image: NetworkImage(data.companyLogo),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
          Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Directionality(
                textDirection: TextDirection.rtl,
                child: OutlinedButton.icon(
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(
                      color: data.isInterested
                          ? AppColors.primaryColor
                          : AppColors.grey,
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    backgroundColor: data.isInterested
                        ? AppColors.primaryColor
                        : AppColors.white,
                    foregroundColor:
                        data.isInterested ? AppColors.white : AppColors.grey,
                  ),
                  onPressed: () {
                    setState(() {
                      data.isInterested = !data.isInterested;
                    });
                  },
                  icon: const Icon(Icons.food_bank),
                  label: const Text('Interested'),
                ),
              ),
              const SizedBox(width: 8),
              Directionality(
                textDirection: TextDirection.rtl,
                child: OutlinedButton.icon(
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(
                      color: data.isSaved
                          ? AppColors.primaryColor
                          : AppColors.grey,
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    backgroundColor:
                        data.isSaved ? AppColors.primaryColor : AppColors.white,
                    foregroundColor:
                        data.isSaved ? AppColors.white : AppColors.grey,
                  ),
                  onPressed: () {
                    setState(() {
                      data.isSaved = !data.isSaved;
                    });
                  },
                  icon: const Icon(Icons.bookmark_add_outlined),
                  label: const Text('Saved'),
                ),
              ),
              const Spacer(),
              InkWell(
                onTap: () {},
                child: const Icon(
                  Icons.playlist_add_circle_outlined,
                  color: AppColors.grey,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
