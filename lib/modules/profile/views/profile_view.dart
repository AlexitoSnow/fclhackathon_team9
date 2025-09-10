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
      body: Obx(() {
        // Show error snackbar if there's an error
        if (controller.errorMessage.isNotEmpty) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            Get.snackbar(
              'Error',
              controller.errorMessage,
              backgroundColor: Colors.red.shade100,
              colorText: Colors.red.shade800,
              snackPosition: SnackPosition.TOP,
              margin: const EdgeInsets.all(16),
              borderRadius: 8,
            );
          });
        }

        return RefreshIndicator(
          onRefresh: controller.refreshProfile,
          color: AppColors.primaryGreen,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics(),
            ),
            child:
                controller.isLoading &&
                    controller.userProfile.name == 'Krystal Patel'
                ? _buildLoadingState(context)
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Profile Header Section
                      _buildProfileHeader(context, controller),
                      //Info Section
                      _buildInfoSection(context, controller),
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
      }),
    );
  }

  Widget _buildProfileHeader(
    BuildContext context,
    ProfileController controller,
  ) {
    final h = context.heightUnit;
    final w = context.widthUnit;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: w * 5, vertical: h * 2),
      decoration: BoxDecoration(
        color: AppColors.lightSurface,
        borderRadius: BorderRadius.circular(h),
      ),
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
                  backgroundImage: NetworkImage(
                    controller.userProfile.avatarUrl,
                  ),
                  child: null,
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
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: h * 2),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoSection(BuildContext context, ProfileController controller) {
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
                // Name and Username
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '@${controller.userProfile.username}',
                        style: TextStyle(
                          fontSize: h * 1.8,
                          fontWeight: FontWeight.w500,
                          color: AppColors.black,
                        ),
                      ),
                      // Bio
                      Text(
                        controller.userProfile.bio,
                        style: TextStyle(
                          fontSize: h * 1.8,
                          color: AppColors.textPrimary,
                        ),
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
              ],
            ),
            SizedBox(height: h * 2),
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
      onPressed: () {
        Get.snackbar("In development", "This feature is not available yet");
      },
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
                    '${controller.userProfile.steps} Steps',
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: h * 1.4,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Expanded(
                  child: LinearProgressIndicator(
                    value: controller.userProfile.steps / 25_000,
                    minHeight: h * 2.5,
                    backgroundColor: AppColors.white,
                    valueColor: AlwaysStoppedAnimation(AppColors.primaryGreen),
                  ),
                ),
                // End Point - Trophy
                _buildTrophyIcon(context, controller),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTrophyIcon(BuildContext context, ProfileController controller) {
    final h = context.heightUnit;

    return Container(
      padding: EdgeInsets.only(left: h, top: h * 3),
      child: Column(
        children: [
          Image.asset(
            'assets/images/trophy.png',
            width: h * 8,
            height: h * 8,
            fit: BoxFit.contain,
          ),
          // Target Steps below trophy
          Text(
            '25K Steps',
            style: TextStyle(
              color: const Color(0xFF1A363D), // Dark teal like in image
              fontSize: h,
              fontWeight: FontWeight.w800,
            ),
          ),
        ],
      ),
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

  Widget _buildLoadingState(BuildContext context) {
    final h = context.heightUnit;
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.8,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(color: AppColors.primaryGreen),
            SizedBox(height: h * 2.0),
            Text(
              'Loading profile...',
              style: TextStyle(
                color: AppColors.textSecondary,
                fontSize: h * 2.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
