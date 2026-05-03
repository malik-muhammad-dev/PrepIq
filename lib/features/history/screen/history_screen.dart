import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_text_styles.dart';
import '../../../core/constants/app_dimenstions.dart';
import '../../../core/constants/app_strings.dart';
import '../controller/history_controller.dart';
import '../widgets/history_card.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HistoryController>();

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        title: Text(
          AppStrings.interviewHistory,
          style: AppTextStyles.titleLarge,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppDimensions.paddingM),
        child: Column(
          children: [
            // Search bar
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: AppDimensions.paddingM,
              ),
              decoration: BoxDecoration(
                color: AppColors.cardBackground,
                borderRadius: BorderRadius.circular(AppDimensions.radiusL),
              ),
              child: Row(
                children: [
                  const Icon(
                    Icons.search_rounded,
                    color: AppColors.textSecondary,
                  ),
                  const SizedBox(width: AppDimensions.paddingS),
                  Expanded(
                    child: TextField(
                      style: AppTextStyles.bodyLarge,
                      decoration: InputDecoration(
                        hintText: 'Search interviews...',
                        hintStyle: AppTextStyles.bodyMedium,
                        border: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                      ),
                      onChanged: controller.searchInterviews,
                    ),
                  ),
                ],
              ),
            )
            .animate()
            .fadeIn(duration: 500.ms),

            const SizedBox(height: AppDimensions.paddingL),

            // List
            Expanded(
              child: Obx(() => controller.filteredHistory.isEmpty
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.history_rounded,
                            color: AppColors.textHint,
                            size: 64,
                          ),
                          const SizedBox(height: AppDimensions.paddingM),
                          Text(
                            AppStrings.noHistory,
                            style: AppTextStyles.titleMedium.copyWith(
                              color: AppColors.textHint,
                            ),
                          ),
                          const SizedBox(height: AppDimensions.paddingS),
                          Text(
                            AppStrings.noHistorySubtitle,
                            style: AppTextStyles.bodyMedium,
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    )
                  : ListView.builder(
                      itemCount: controller.filteredHistory.length,
                      itemBuilder: (context, index) {
                        final item = controller.filteredHistory[index];
                        return HistoryCard(
                          role: item['role'] as String,
                          industry: item['industry'] as String,
                          score: item['score'] as int,
                          time: item['time'] as String,
                          index: index,
                        );
                      },
                    )),
            ),
          ],
        ),
      ),
    );
  }
}