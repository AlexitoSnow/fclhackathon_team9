import 'package:dio/dio.dart';
import 'package:fclhackathon_team9/core/services/api_service.dart';
import 'package:fclhackathon_team9/core/services/api_exceptions.dart';
import 'package:fclhackathon_team9/modules/profile/models/profile_api_models.dart';

class ProfileApiService {
  static ProfileApiService? _instance;
  final ApiService _apiService = ApiService.instance;

  static ProfileApiService get instance =>
      _instance ??= ProfileApiService._internal();

  ProfileApiService._internal();

  /// Fetch profile data from the API
  /// GET /profile
  Future<ProfileApiResponse> fetchProfile() async {
    try {
      final response = await _apiService.get('/profile');

      if (response.statusCode == 200 && response.data != null) {
        return ProfileApiResponse.fromJson(
          response.data as Map<String, dynamic>,
        );
      } else {
        throw ApiException(
          'Failed to fetch profile: ${response.statusCode}',
          statusCode: response.statusCode,
        );
      }
    } on DioException catch (e) {
      throw ApiException(
        _getErrorMessage(e),
        statusCode: e.response?.statusCode,
        originalException: e,
      );
    } catch (e) {
      throw ApiException(
        'Unexpected error while fetching profile: $e',
        originalException: e,
      );
    }
  }

  String _getErrorMessage(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return 'Connection timeout - please check your internet connection';
      case DioExceptionType.sendTimeout:
        return 'Send timeout - please try again';
      case DioExceptionType.receiveTimeout:
        return 'Receive timeout - please try again';
      case DioExceptionType.badResponse:
        return 'Server error: ${error.response?.statusCode} - ${error.response?.statusMessage}';
      case DioExceptionType.cancel:
        return 'Request was cancelled';
      case DioExceptionType.connectionError:
        return 'Connection error - please check if the server is running on localhost:8080';
      case DioExceptionType.unknown:
        return 'Unknown error: ${error.message}';
      default:
        return 'Network error occurred';
    }
  }
}
