import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fclhackathon_team9/core/constants/app_colors.dart';
import 'package:fclhackathon_team9/core/constants/app_dimensions.dart';
import 'package:fclhackathon_team9/core/constants/app_strings.dart';
import 'package:fclhackathon_team9/modules/wallet/controllers/wallet_controller.dart';
import 'package:fclhackathon_team9/modules/wallet/widgets/balance_pill.dart';
import 'package:fclhackathon_team9/modules/wallet/widgets/total_value_card.dart';
import 'package:fclhackathon_team9/modules/wallet/widgets/earnings_card.dart';
import 'package:fclhackathon_team9/modules/notifications/views/notifications_view.dart';
import 'package:fclhackathon_team9/modules/transactions/views/transactions_view.dart';
import 'package:fclhackathon_team9/utils/extensions/context_extensions.dart'
    hide ContextExtensionss;

class WalletView extends StatelessWidget {
  const WalletView({super.key});

  @override
  Widget build(BuildContext context) {
    final WalletController controller = Get.put(WalletController());
    final isPortrait = ContextExtensionss(context).isPortrait;
    final horizontalPadding = context.widthUnit * 4.6;
    final topSpacing = context.heightUnit * 6.9;

    final content = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: topSpacing),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Obx(
                () => BalancePill(
                  amountText: controller.balanceText,
                  onTap: () {
                    controller.openTransactions();
                    Get.to(
                      () => const TransactionsView(),
                      transition: Transition.cupertino,
                    );
                  },
                ),
              ),
            ),
            SizedBox(width: context.widthUnit * 4.0),
            SizedBox(
              width: isPortrait
                  ? context.widthUnit * 22.0
                  : context.widthUnit * 15.0,
              child: _NotificationPill(
                onTap: () {
                  controller.openNotifications();
                  Get.to(
                    () => const NotificationsView(),
                    transition: Transition.cupertino,
                  );
                },
              ),
            ),
          ],
        ),
        SizedBox(height: context.heightUnit * 4.5),
        Text(
          AppStrings.totalWalletValue,
          style: TextStyle(
            color: AppColors.textPrimary,
            fontWeight: FontWeight.w600,
            fontSize: context.heightUnit * 2.6,
          ),
        ),
        SizedBox(height: context.heightUnit * 1.4),
        Obx(
          () => TotalValueCard(
            amountText: controller.balanceText,
            subtitle: AppStrings.claimAtEnd,
          ),
        ),
        SizedBox(height: context.heightUnit * 4.5),
        Text(
          AppStrings.earningThisMonth,
          style: TextStyle(
            color: AppColors.textPrimary,
            fontWeight: FontWeight.w600,
            fontSize: context.heightUnit * 2.6,
          ),
        ),
        SizedBox(height: context.heightUnit * 1.4),
        Obx(
          () => EarningsCard(
            progress: controller.progress,
            progressLabel: controller.earningsText,
          ),
        ),
        SizedBox(height: context.heightUnit * 2.0),
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
}

class _NotificationPill extends StatelessWidget {
  final VoidCallback onTap;
  const _NotificationPill({required this.onTap});

  @override
  Widget build(BuildContext context) {
    final h = context.heightUnit;
    final radius = h * AppDimensions.radiusUnit;
    final height = h * AppDimensions.pillHeightUnit;
    return Material(
      color: AppColors.primaryGreen,
      borderRadius: BorderRadius.circular(radius),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: SizedBox(
          height: height,
          child: Center(
            child: Icon(
              Icons.notifications_none_rounded,
              color: AppColors.textPrimary,
              size: h * (AppDimensions.iconUnit + 0.8),
            ),
          ),
        ),
      ),
    );
  }
}
