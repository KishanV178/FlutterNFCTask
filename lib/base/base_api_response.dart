abstract class BaseApiResponse<T> {
  String? status;
  T? data;
  String? message;

  void fromJson(Map<String, dynamic> data) {
    status = data['status'];
    data = data['data'];
    message = data['message'];
  }
}
