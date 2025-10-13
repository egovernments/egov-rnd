// Importing necessary packages and files
import "package:dio/dio.dart"; // Dio package for HTTP requests
import '../utils/envConfig.dart';
import 'api_interceptors.dart';

// The DioClient class for managing the Dio instance
class DioClient {
  late Dio _dio; // Private instance of Dio

  // Singleton instance of DioClient
  static final DioClient _instance = DioClient._internal();

  // Factory constructor for DioClient
  factory DioClient() {
    return _instance;
  }

  // Private constructor of DioClient
  DioClient._internal() {
    init(); // Initialize the Dio client during construction
  }

  // Getter method to access the Dio instance
  Dio get dio => _dio;

  // Initialization method for the Dio client
  void init() {
    _dio = Dio()
      ..interceptors.addAll([
        AuthTokenInterceptor(), // Custom interceptor for handling authentication tokens
      ])
      ..options = BaseOptions(
        connectTimeout: Duration(
          milliseconds: envConfig.variables.connectTimeout,
        ),
        sendTimeout: Duration(
          milliseconds: envConfig.variables.sendTimeout,
        ),
        receiveTimeout: Duration(
          milliseconds: envConfig.variables.receiveTimeout,
        ),
        baseUrl: envConfig.variables
            .baseUrl, // Base URL for API endpoints from the environment configuration
      );

    _dio.options.baseUrl = envConfig.variables.baseUrl;
  }
}
