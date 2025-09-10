import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fclhackathon_team9/core/constants/app_colors.dart';
import 'package:fclhackathon_team9/core/constants/app_dimensions.dart';
import 'package:fclhackathon_team9/core/constants/app_strings.dart';
import 'package:fclhackathon_team9/modules/wallet/controllers/wallet_controller.dart';
import 'package:fclhackathon_team9/modules/notifications/views/notifications_view.dart';
import 'package:fclhackathon_team9/modules/transactions/views/transactions_view.dart';
import 'package:fclhackathon_team9/utils/extensions/context_extensions.dart'
    hide ContextExtensionss;

class WalletView extends StatelessWidget {
  const WalletView({super.key});

  @override
  Widget build(BuildContext context) {
    final WalletController controller = Get.put(WalletController());
    final h = context.heightUnit;
    final w = context.widthUnit;
    final horizontalPadding = w * 5;
    final topSpacing = h * 8;

    final content = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: topSpacing),
        // Top section with balance pill and notification bell
        Row(
          children: [
            Expanded(child: Obx(() => _buildBalancePill(context, controller))),
            SizedBox(width: w * 55),
            _buildNotificationBell(context, controller),
          ],
        ),
        SizedBox(height: h * 6),
        // Total Wallet Value section
        Text(
          AppStrings.totalWalletValue,
          style: TextStyle(
            color: AppColors.textPrimary,
            fontWeight: FontWeight.w600,
            fontSize: h * 2.6,
          ),
        ),
        SizedBox(height: h * 2),
        Obx(() => _buildTotalValueCard(context, controller)),
        SizedBox(height: h * 2),
        // Earning this month section
        Text(
          AppStrings.earningThisMonth,
          style: TextStyle(
            color: AppColors.textPrimary,
            fontWeight: FontWeight.w600,
            fontSize: h * 2.6,
          ),
        ),
        SizedBox(height: h * 2),
        Obx(() => _buildEarningsCard(context, controller)),
        SizedBox(height: h * 4),
      ],
    );

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
          child: LayoutBuilder(
            builder: (context, constraints) {
              return Scrollbar(
                interactive: true,
                thumbVisibility: false,
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight:
                          constraints.maxHeight -
                          context.heightUnit *
                              AppDimensions.bottomNavHeightUnit,
                    ),
                    child: content,
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildBalancePill(BuildContext context, WalletController controller) {
    final h = context.heightUnit;
    final w = context.widthUnit;

    return GestureDetector(
      onTap: () {
        controller.openTransactions();
        Get.to(
          () => const TransactionsView(),
          transition: Transition.cupertino,
        );
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: w * 4, vertical: h * 1.5),
        decoration: BoxDecoration(
          color: AppColors.primaryGreen,
          borderRadius: BorderRadius.circular(h * 2),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.attach_money,
              color: AppColors.primaryDark,
              size: h * 2.5,
            ),
            SizedBox(width: w * 2),
            Text(
              controller.balanceText,
              style: TextStyle(
                color: AppColors.primaryDark,
                fontWeight: FontWeight.bold,
                fontSize: h * 2.2,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNotificationBell(
    BuildContext context,
    WalletController controller,
  ) {
    final h = context.heightUnit;

    return GestureDetector(
      onTap: () {
        controller.openNotifications();
        Get.to(
          () => const NotificationsView(),
          transition: Transition.cupertino,
        );
      },
      child: Container(
        padding: EdgeInsets.all(h * 1.2),
        decoration: BoxDecoration(
          color: AppColors.primaryGreen,
          borderRadius: BorderRadius.circular(h * 1.5),
        ),
        child: Icon(
          Icons.notifications,
          color: AppColors.primaryDark,
          size: h * 3,
        ),
      ),
    );
  }

  Widget _buildTotalValueCard(
    BuildContext context,
    WalletController controller,
  ) {
    final h = context.heightUnit;

    return Container(
      padding: EdgeInsets.only(bottom: h, left: 65, right: 65, top: h),
      decoration: BoxDecoration(
        color: AppColors.lightSurface,
        borderRadius: BorderRadius.circular(h * 2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '\$${controller.balanceText}',
            style: TextStyle(
              color: AppColors.textPrimary,
              fontWeight: FontWeight.bold,
              fontSize: h * 4.5,
            ),
          ),
          SizedBox(height: h),
          Text(
            AppStrings.claimAtEnd,
            style: TextStyle(color: AppColors.textSecondary, fontSize: h * 1.8),
          ),
        ],
      ),
    );
  }

  Widget _buildEarningsCard(BuildContext context, WalletController controller) {
    final h = context.heightUnit;

    return Container(
      padding: EdgeInsets.all(h),
      decoration: BoxDecoration(
        color: AppColors.lightSurface,
        borderRadius: BorderRadius.circular(h * 2),
      ),
      child: Column(
        children: [
          Stack(
            alignment: Alignment.centerRight,
            children: [
              LinearProgressIndicator(
                value: controller.progress,
                minHeight: h * 2.5,
                backgroundColor: AppColors.trackGrey,
                valueColor: const AlwaysStoppedAnimation<Color>(
                  AppColors.primaryGreen,
                ),
                borderRadius: BorderRadius.circular(h * 1.25),
              ),
              Container(
                padding: EdgeInsets.all(h * 0.5),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColors.primaryGreen, width: 2),
                ),
                child: Icon(
                  Icons.attach_money,
                  color: AppColors.primaryGreen,
                  size: h * 2.5,
                ),
              ),
            ],
          ),
          SizedBox(height: h * 1.5),
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              controller.earningsText,
              style: TextStyle(
                color: AppColors.textSecondary,
                fontSize: h * 1.8,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
