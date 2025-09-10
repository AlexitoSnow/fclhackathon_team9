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
          _buildTrophyProgressCard(context, controller),
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
      height: h * 20,
      padding: EdgeInsets.all(h * 2),
      decoration: BoxDecoration(
        color: const Color(0xFFE8EDEE), // Light grey background like in image
        borderRadius: BorderRadius.circular(h * 2.5),
      ),
      child: Column(
        children: [
          // Progress Route - Horizontal white track
          Expanded(
            child: Row(
              children: [
                // Start Point - Current Steps (0 Steps pill)
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: w * 2.5,
                    vertical: h * 1,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFF1A363D), // Dark teal like in image
                    borderRadius: BorderRadius.circular(h * 2.5),
                  ),
                  child: Text(
                    '0 Steps',
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: h * 1.4,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(width: w * 1),
                // Progress Path - White horizontal track
                Expanded(
                  child: Container(
                    height: h * 0.6,
                    decoration: BoxDecoration(
                      color: AppColors.white, // White track like in image
                      borderRadius: BorderRadius.circular(h * 0.3),
                    ),
                  ),
                ),
                SizedBox(width: w * 1),
                // End Point - Trophy
                _buildTrophyIcon(context, controller),
              ],
            ),
          ),
          SizedBox(height: h * 1),
          // Target Steps below trophy
          Text(
            '2.5M Steps',
            style: TextStyle(
              color: const Color(0xFF1A363D), // Dark teal like in image
              fontSize: h * 1.6,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTrophyIcon(BuildContext context, ProfileController controller) {
    final h = context.heightUnit;

    return Column(
      children: [
        // Trophy Top - Dark circular metallic part
        Container(
          width: h * 5,
          height: h * 5,
          decoration: BoxDecoration(
            color: const Color(0xFF2C3E50), // Dark metallic like in image
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                blurRadius: h * 0.8,
                offset: Offset(0, h * 0.3),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Bronze Stage',
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: h * 0.9,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              Text(
                'Complete 2.5M Steps',
                style: TextStyle(color: AppColors.white, fontSize: h * 0.7),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        SizedBox(height: h * 0.2),
        // Trophy Base - Wooden base with metallic plaque
        Container(
          width: h * 4,
          height: h * 1.8,
          decoration: BoxDecoration(
            color: const Color(0xFF8B4513), // Brown wood base
            borderRadius: BorderRadius.circular(h * 0.3),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: h * 0.5,
                offset: Offset(0, h * 0.2),
              ),
            ],
          ),
          child: Stack(
            children: [
              // Metallic plaque on front
              Positioned(
                top: h * 0.2,
                left: h * 0.3,
                right: h * 0.3,
                child: Container(
                  height: h * 1.2,
                  decoration: BoxDecoration(
                    color: const Color(0xFFCD7F32), // Bronze metallic
                    borderRadius: BorderRadius.circular(h * 0.2),
                    border: Border.all(
                      color: const Color(0xFFB8860B), // Gold border
                      width: 0.5,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'Krystal Patel',
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: h * 0.7,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
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
