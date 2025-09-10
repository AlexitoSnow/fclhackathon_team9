import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fclhackathon_team9/core/constants/app_colors.dart';
import 'package:fclhackathon_team9/core/constants/app_strings.dart';
import 'package:fclhackathon_team9/modules/profile/controllers/profile_controller.dart';
import 'package:fclhackathon_team9/utils/extensions/context_extensions.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final ProfileController controller = Get.put(ProfileController());
    final h = context.heightUnit;
    final w = context.widthUnit;

    return Scaffold(
      backgroundColor: AppColors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(w * 5, h * 2, w * 5, h * 1.5),
              child: Text(
                AppStrings.myProfile,
                style: TextStyle(
                  color: AppColors.textPrimary,
                  fontWeight: FontWeight.bold,
                  fontSize: h * 2.8,
                ),
              ),
            ),
            _buildProfileHeader(context, controller),
            _buildProfileDetails(context, controller),
            SizedBox(height: h * 3),
            _buildSection(
              context: context,
              title: AppStrings.progressToEarnTrophy,
              actionText: AppStrings.learnMore,
              child: _buildTrophyProgressCard(context, controller),
            ),
            SizedBox(height: h * 3),
            _buildSection(
              context: context,
              title: AppStrings.friends,
              actionText: AppStrings.viewAll,
              child: _buildFriendsSection(context),
            ),
            SizedBox(height: h * 3),
            _buildSection(
              context: context,
              title: AppStrings.monthlyBadges,
              actionText: AppStrings.viewAll,
              child: const SizedBox.shrink(), // Placeholder
            ),
            SizedBox(height: h * 3),
            _buildSection(
              context: context,
              title: AppStrings.achievements,
              actionText: AppStrings.viewAll,
              child: _buildAchievements(context, controller),
            ),
            SizedBox(height: h * 5),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileHeader(
    BuildContext context,
    ProfileController controller,
  ) {
    final h = context.heightUnit;
    final w = context.widthUnit;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: w * 4),
      padding: EdgeInsets.symmetric(horizontal: w * 5, vertical: h * 2),
      decoration: BoxDecoration(
        color: AppColors.lightSurface,
        borderRadius: BorderRadius.circular(h * 2),
      ),
      child: Obx(
        () => Row(
          children: [
            CircleAvatar(
              radius: h * 5,
              backgroundColor: AppColors.primaryGreen,
              // Placeholder for user image
              child: Icon(Icons.person, size: h * 6, color: AppColors.white),
            ),
            SizedBox(width: w * 4),
            Text(
              controller.userProfile.name,
              style: TextStyle(
                fontSize: h * 2.5,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileDetails(
    BuildContext context,
    ProfileController controller,
  ) {
    final h = context.heightUnit;
    final w = context.widthUnit;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: w * 6, vertical: h * 2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Obx(
            () => Text(
              controller.userProfile.username,
              style: TextStyle(
                color: AppColors.textSecondary,
                fontSize: h * 1.8,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          SizedBox(height: h * 0.5),
          Obx(
            () => Text(
              controller.userProfile.bio,
              style: TextStyle(color: AppColors.textPrimary, fontSize: h * 1.8),
            ),
          ),
          SizedBox(height: h * 2.5),
          _buildStatsRow(context, controller),
          SizedBox(height: h * 2.5),
          _buildActionButtons(context, controller),
        ],
      ),
    );
  }

  Widget _buildStatsRow(BuildContext context, ProfileController controller) {
    return Obx(
      () => Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildStatItem(context, controller.stepsText, AppStrings.stepsGoal),
          _buildStatItem(
            context,
            controller.followersText,
            AppStrings.followers,
          ),
          _buildStatItem(
            context,
            controller.followingText,
            AppStrings.following,
          ),
        ],
      ),
    );
  }

  Widget _buildStatItem(BuildContext context, String value, String label) {
    final h = context.heightUnit;
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(
            fontSize: h * 2.2,
            fontWeight: FontWeight.bold,
            color: AppColors.textPrimary,
          ),
        ),
        SizedBox(height: h * 0.5),
        Text(
          label,
          style: TextStyle(color: AppColors.textSecondary, fontSize: h * 1.6),
        ),
      ],
    );
  }

  Widget _buildActionButtons(
    BuildContext context,
    ProfileController controller,
  ) {
    final h = context.heightUnit;
    return Row(
      children: [
        Expanded(
          child: _buildOutlinedButton(
            context,
            AppStrings.editProfile,
            controller.editProfile,
          ),
        ),
        SizedBox(width: context.widthUnit * 2),
        Expanded(
          child: _buildOutlinedButton(
            context,
            AppStrings.shareProfile,
            controller.shareProfile,
          ),
        ),
        SizedBox(width: context.widthUnit * 2),
        GestureDetector(
          onTap: controller.addFriend,
          child: Container(
            height: h * 5,
            width: h * 5,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(h * 1.5),
              border: Border.all(color: AppColors.primaryGreen, width: 1.5),
            ),
            child: Icon(
              Icons.person_add_alt_1_outlined,
              color: AppColors.primaryGreen,
              size: h * 2.5,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildOutlinedButton(
    BuildContext context,
    String label,
    VoidCallback onPressed,
  ) {
    final h = context.heightUnit;
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        side: const BorderSide(color: AppColors.primaryGreen, width: 1.5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(h * 1.5),
        ),
        padding: EdgeInsets.symmetric(vertical: h * 1.2),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: AppColors.primaryGreen,
          fontWeight: FontWeight.bold,
          fontSize: h * 1.8,
        ),
      ),
    );
  }

  Widget _buildSection({
    required BuildContext context,
    required String title,
    required String actionText,
    required Widget child,
  }) {
    final h = context.heightUnit;
    final w = context.widthUnit;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: w * 6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: h * 2.2,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
              ),
              Text(
                actionText,
                style: TextStyle(
                  fontSize: h * 1.8,
                  fontWeight: FontWeight.w500,
                  color: AppColors.primaryGreen,
                ),
              ),
            ],
          ),
          SizedBox(height: h * 1.5),
          child,
        ],
      ),
    );
  }

  Widget _buildTrophyProgressCard(
    BuildContext context,
    ProfileController controller,
  ) {
    final h = context.heightUnit;
    final w = context.widthUnit;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: w * 4, vertical: h * 2),
      decoration: BoxDecoration(
        color: AppColors.lightSurface,
        borderRadius: BorderRadius.circular(h * 1.5),
      ),
      child: Obx(
        () => Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: w * 3, vertical: h * 1),
              decoration: BoxDecoration(
                color: AppColors.primaryDark,
                borderRadius: BorderRadius.circular(h * 1),
              ),
              child: Text(
                controller.trophyStepsText,
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: h * 1.6,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            // Placeholder for badge
            Column(
              children: [
                Icon(Icons.shield, color: AppColors.trackGrey, size: h * 4),
                Text(
                  controller.trophyProgress.stage,
                  style: TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: h * 1.4,
                  ),
                ),
                Text(
                  controller.trophyProgress.stageDescription,
                  style: TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: h * 1.4,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFriendsSection(BuildContext context) {
    final h = context.heightUnit;
    return CircleAvatar(
      radius: h * 3.5,
      backgroundColor: AppColors.primaryDark,
      child: Icon(Icons.add, color: AppColors.white, size: h * 4),
    );
  }

  Widget _buildAchievements(
    BuildContext context,
    ProfileController controller,
  ) {
    final h = context.heightUnit;
    final w = context.widthUnit;
    return Obx(
      () => Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: controller.achievements.map((achievement) {
          return Container(
            width: w * 15,
            height: w * 15,
            margin: EdgeInsets.only(right: w * 3),
            decoration: BoxDecoration(
              color: achievement.isUnlocked
                  ? AppColors.primaryGreen
                  : AppColors.lightSurface,
              borderRadius: BorderRadius.circular(h * 1.5),
            ),
            child: Icon(
              achievement.isUnlocked ? Icons.check : Icons.lock,
              color: achievement.isUnlocked
                  ? AppColors.primaryDark
                  : AppColors.trackGrey,
              size: h * 4,
            ),
          );
        }).toList(),
      ),
    );
  }
}
