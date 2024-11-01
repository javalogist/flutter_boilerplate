abstract class ApiClient {
 String contentType = "application/json";
 String accept = "application/json";

  Future<dynamic> getRequest(String endpoint, {Map<String, dynamic>? queryParameters});
  Future<dynamic> postRequest(String endpoint, {dynamic data});
  Future<dynamic> putRequest(String endpoint, {dynamic data});
  Future<dynamic> deleteRequest(String endpoint, {Map<String, dynamic>? queryParameters});
}


