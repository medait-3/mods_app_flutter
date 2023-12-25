class ApiResponse {
  final bool name;
  ApiResponse({
    required this.name,
  });

  factory ApiResponse.fromJson(Map<String, dynamic> json) {
    return ApiResponse(
      name: json['name'] ?? '',
    );
  }
}
