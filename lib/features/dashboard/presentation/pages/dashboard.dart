import 'package:cropmaster/features/dashboard/domain/dashboard_controller.dart';
import 'package:cropmaster/features/dashboard/presentation/widgets/dashboard_card_widget.dart';
import 'package:cropmaster/features/dashboard/presentation/widgets/header_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class DashboardPage extends StatelessWidget {
  final DashboardController dashboardController =
      Get.put(DashboardController());

  DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const HeaderWidget(),
          SizedBox(height: 30.h,),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemCount: dashboardController.cardDataList.length,
              itemBuilder: (context, index) {
                return SingleChildScrollView(
                  child: DashboardCardWidget(
                    index: index,
                    backgroundImageUrl: dashboardController
                        .cardDataList[index].backgroundImageUrl,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
