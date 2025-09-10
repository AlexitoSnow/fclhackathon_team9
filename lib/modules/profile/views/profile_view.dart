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

    return Scaffold(
      backgroundColor: AppColors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile Header Section
            _buildProfileHeader(context, controller),
            SizedBox(height: h * 4),
            // Progress to Earn Trophy Section
            _buildTrophySection(context, controller),
            SizedBox(height: h * 4),
            // Friends Section
            _buildFriendsSection(context, controller),
            SizedBox(height: h * 4),
            // Monthly Badges Section
            _buildMonthlyBadgesSection(context, controller),
            SizedBox(height: h * 4),
            // Achievements Section
            _buildAchievementsSection(context, controller),
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

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: w * 5, vertical: h * 2),
      child: Obx(
        () => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile Picture and Basic Info
            Row(
              children: [
                // Profile Picture
                CircleAvatar(
                  radius: h * 6,
                  backgroundColor: AppColors.primaryGreen,
                  child: Icon(
                    Icons.person,
                    size: h * 8,
                    color: AppColors.white,
                  ),
                ),
                SizedBox(width: w * 4),
                // Name and Username
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        controller.userProfile.name,
                        style: TextStyle(
                          fontSize: h * 2.8,
                          fontWeight: FontWeight.bold,
                          color: AppColors.textPrimary,
                        ),
                      ),
                      SizedBox(height: h * 0.5),
                      Text(
                        controller.userProfile.username,
                        style: TextStyle(
                          fontSize: h * 1.8,
                          color: AppColors.textSecondary,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: h * 2),
            // Bio
            Text(
              controller.userProfile.bio,
              style: TextStyle(fontSize: h * 1.8, color: AppColors.textPrimary),
            ),
            SizedBox(height: h * 3),
            // Stats Row
            _buildStatsRow(context, controller),
            SizedBox(height: h * 3),
            // Action Buttons
            _buildActionButtons(context, controller),
          ],
        ),
      ),
    );
  }

  Widget _buildStatsRow(BuildContext context, ProfileController controller) {
    final h = context.heightUnit;

    return Obx(
      () => Row(
        children: [
          // Steps
          Expanded(
            child: Column(
              children: [
                Text(
                  '${controller.userProfile.steps}',
                  style: TextStyle(
                    fontSize: h * 3.2,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textPrimary,
                  ),
                ),
                SizedBox(height: h * 0.5),
                Text(
                  'Steps',
                  style: TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: h * 1.6,
                  ),
                ),
              ],
            ),
          ),
          // Divider
          Container(height: h * 4, width: 1, color: AppColors.trackGrey),
          // Followers
          Expanded(
            child: Column(
              children: [
                Text(
                  '${controller.userProfile.followers}',
                  style: TextStyle(
                    fontSize: h * 3.2,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textPrimary,
                  ),
                ),
                SizedBox(height: h * 0.5),
                Text(
                  'followers',
                  style: TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: h * 1.6,
                  ),
                ),
              ],
            ),
          ),
          // Divider
          Container(height: h * 4, width: 1, color: AppColors.trackGrey),
          // Following
          Expanded(
            child: Column(
              children: [
                Text(
                  '${controller.userProfile.following}',
                  style: TextStyle(
                    fontSize: h * 3.2,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textPrimary,
                  ),
                ),
                SizedBox(height: h * 0.5),
                Text(
                  'following',
                  style: TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: h * 1.6,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButtons(
    BuildContext context,
    ProfileController controller,
  ) {
    final h = context.heightUnit;
    final w = context.widthUnit;

    return Row(
      children: [
        // Edit Profile Button
        Expanded(
          child: _buildOutlinedButton(
            context,
            AppStrings.editProfile,
            controller.editProfile,
            isLightGreen: true,
          ),
        ),
        SizedBox(width: w * 3),
        // Share Profile Button
        Expanded(
          child: _buildOutlinedButton(
            context,
            AppStrings.shareProfile,
            controller.shareProfile,
            isLightGreen: false,
          ),
        ),
        SizedBox(width: w * 3),
        // Add Friend Button
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
    VoidCallback onPressed, {
    required bool isLightGreen,
  }) {
    final h = context.heightUnit;
    final textColor = isLightGreen
        ? AppColors.textSecondary
        : AppColors.primaryGreen;

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
          color: textColor,
          fontWeight: FontWeight.bold,
          fontSize: h * 1.8,
        ),
      ),
    );
  }

  Widget _buildTrophySection(
    BuildContext context,
    ProfileController controller,
  ) {
    final h = context.heightUnit;
    final w = context.widthUnit;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: w * 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Section Header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppStrings.progressToEarnTrophy,
                style: TextStyle(
                  fontSize: h * 2.4,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
              ),
              Text(
                AppStrings.learnMore,
                style: TextStyle(
                  fontSize: h * 1.8,
                  fontWeight: FontWeight.w500,
                  color: AppColors.primaryGreen,
                ),
              ),
            ],
          ),
          SizedBox(height: h * 3),
          // Progress Bar and Trophy
          Obx(() => _buildTrophyProgressCard(context, controller)),
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

    return Row(
      children: [
        // Progress Pill
        Container(
          padding: EdgeInsets.symmetric(horizontal: w * 4, vertical: h * 1.5),
          decoration: BoxDecoration(
            color: AppColors.primaryDark,
            borderRadius: BorderRadius.circular(h * 2),
          ),
          child: Text(
            controller.trophyStepsText,
            style: TextStyle(
              color: AppColors.white,
              fontSize: h * 1.8,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(width: w * 4),
        // Trophy Image and Info
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              // Trophy Icon
              Container(
                width: h * 8,
                height: h * 8,
                decoration: BoxDecoration(
                  color: const Color(0xFFCD7F32), // Bronze color
                  borderRadius: BorderRadius.circular(h * 1),
                ),
                child: Icon(
                  Icons.emoji_events,
                  color: AppColors.white,
                  size: h * 5,
                ),
              ),
              SizedBox(height: h * 1),
              // Trophy Info
              Text(
                controller.trophyProgress.stage,
                style: TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: h * 1.6,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                controller.trophyProgress.stageDescription,
                style: TextStyle(
                  color: AppColors.textSecondary,
                  fontSize: h * 1.4,
                ),
              ),
              Text(
                controller.userProfile.name,
                style: TextStyle(
                  color: AppColors.textSecondary,
                  fontSize: h * 1.4,
                ),
              ),
              SizedBox(height: h * 0.5),
              Text(
                controller.trophyProgress.stageDescription,
                style: TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: h * 1.6,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildFriendsSection(
    BuildContext context,
    ProfileController controller,
  ) {
    final h = context.heightUnit;
    final w = context.widthUnit;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: w * 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Section Header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppStrings.friends,
                style: TextStyle(
                  fontSize: h * 2.4,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
              ),
              Text(
                AppStrings.viewAll,
                style: TextStyle(
                  fontSize: h * 1.8,
                  fontWeight: FontWeight.w500,
                  color: AppColors.primaryGreen,
                ),
              ),
            ],
          ),
          SizedBox(height: h * 3),
          // Add Friend Button
          Center(
            child: GestureDetector(
              onTap: controller.addFriend,
              child: CircleAvatar(
                radius: h * 4,
                backgroundColor: AppColors.primaryDark,
                child: Icon(Icons.add, color: AppColors.white, size: h * 5),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMonthlyBadgesSection(
    BuildContext context,
    ProfileController controller,
  ) {
    final h = context.heightUnit;
    final w = context.widthUnit;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: w * 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Section Header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppStrings.monthlyBadges,
                style: TextStyle(
                  fontSize: h * 2.4,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
              ),
              Text(
                AppStrings.viewAll,
                style: TextStyle(
                  fontSize: h * 1.8,
                  fontWeight: FontWeight.w500,
                  color: AppColors.primaryGreen,
                ),
              ),
            ],
          ),
          SizedBox(height: h * 3),
          // Monthly Badges Grid
          Row(
            children: List.generate(4, (index) {
              return Container(
                width: w * 18,
                height: w * 18,
                margin: EdgeInsets.only(right: w * 3),
                decoration: BoxDecoration(
                  color: AppColors.lightSurface,
                  borderRadius: BorderRadius.circular(h * 1.5),
                ),
                child: Icon(
                  Icons.lock,
                  color: AppColors.trackGrey,
                  size: h * 4,
                ),
              );
            }),
          ),
        ],
      ),
    );
  }

  Widget _buildAchievementsSection(
    BuildContext context,
    ProfileController controller,
  ) {
    final h = context.heightUnit;
    final w = context.widthUnit;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: w * 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Section Header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppStrings.achievements,
                style: TextStyle(
                  fontSize: h * 2.4,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
              ),
              Text(
                AppStrings.viewAll,
                style: TextStyle(
                  fontSize: h * 1.8,
                  fontWeight: FontWeight.w500,
                  color: AppColors.primaryGreen,
                ),
              ),
            ],
          ),
          SizedBox(height: h * 3),
          // Achievements Grid
          Obx(
            () => Row(
              children: controller.achievements.map((achievement) {
                return Container(
                  width: w * 18,
                  height: w * 18,
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
          ),
        ],
      ),
    );
  }
}
