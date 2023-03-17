import 'package:flutter/material.dart';
import 'package:post_job/constant/app_color.dart';
import 'package:post_job/feature/filter/model/filter_model.dart';
import 'package:post_job/feature/filter/view/component/radio_check_widget.dart';
import 'package:post_job/utils/screen_size.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  int selectedFilter = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filters'),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: AppColors.primaryColor),
                shape: const StadiumBorder(),
              ),
              child: const Text(
                'Clear',
                style: TextStyle(
                  color: AppColors.grey,
                  fontSize: 18,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                shape: const StadiumBorder(),
                backgroundColor: AppColors.primaryColor,
                padding: EdgeInsets.symmetric(
                  horizontal: screenWidth(context) * 0.2,
                ),
              ),
              child: const Text(
                'Apply',
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: 18,
                ),
              ),
            ),
          ],
        ),
      ),
      body: Row(
        children: [
          _leftSide(),
          Expanded(
              child: Container(
                  child: filterTypeList[selectedFilter].options.isNotEmpty
                      ? RadioCheckListWidget(
                          optionList: filterTypeList[selectedFilter].options,
                          optionType: filterTypeList[selectedFilter].optionType,
                        )
                      : const SizedBox.shrink())),
        ],
      ),
    );
  }

  Expanded _leftSide() {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        decoration: const BoxDecoration(
          color: AppColors.greyLight,
          boxShadow: [
            BoxShadow(
              color: AppColors.grey,
              blurRadius: 10,
              offset: Offset(0, 5), // changes position of shadow
            ),
          ],
        ),
        child: ListView.builder(
            itemCount: filterTypeList.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              var data = filterTypeList[index];
              return InkWell(
                onTap: () {
                  setState(() {
                    selectedFilter = index;
                  });
                },
                child: Container(
                    color: selectedFilter == index
                        ? AppColors.white
                        : Colors.transparent,
                    padding: EdgeInsets.fromLTRB(
                        selectedFilter == index ? 25 : 20, 10, 20, 10),
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    child: Text(
                      data.title,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: selectedFilter == index
                            ? AppColors.primaryColor
                            : AppColors.black,
                      ),
                    )),
              );
            }),
      ),
    );
  }
}
