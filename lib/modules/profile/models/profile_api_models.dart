class ProfileApiResponse {
  final String name;
  final String imgUrl;
  final String bio;
  final String username;
  final double followers;
  final double following;
  final double steps;

  const ProfileApiResponse({
    required this.name,
    required this.imgUrl,
    required this.bio,
    required this.username,
    required this.followers,
    required this.following,
    required this.steps,
  });

  factory ProfileApiResponse.fromJson(Map<String, dynamic> json) {
    return ProfileApiResponse(
      name: json['name'] as String,
      imgUrl: json['img_url'] as String,
      bio: json['bio'] as String,
      username: json['username'] as String,
      followers: (json['followers'] as num).toDouble(),
      following: (json['following'] as num).toDouble(),
      steps: (json['steps'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'img_url': imgUrl,
      'bio': bio,
      'username': username,
      'followers': followers,
      'following': following,
      'steps': steps,
    };
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ProfileApiResponse &&
        other.name == name &&
        other.imgUrl == imgUrl &&
        other.bio == bio &&
        other.username == username &&
        other.followers == followers &&
        other.following == following &&
        other.steps == steps;
  }

  @override
  int get hashCode =>
      name.hashCode ^
      imgUrl.hashCode ^
      bio.hashCode ^
      username.hashCode ^
      followers.hashCode ^
      following.hashCode ^
      steps.hashCode;

  @override
  String toString() {
    return 'ProfileApiResponse(name: $name, imgUrl: $imgUrl, bio: $bio, username: $username, followers: $followers, following: $following, steps: $steps)';
  }
}
