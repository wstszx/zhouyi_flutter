class PaginatedResponse<T> {
  final List<T> items;
  final int total;
  final int page;
  final int limit;

  PaginatedResponse({
    required this.items,
    required this.total,
    required this.page,
    required this.limit,
  });

  factory PaginatedResponse.fromJson(Map<String, dynamic> json, T Function(dynamic) fromJson) {
    final items = (json['items'] as List).map((item) => fromJson(item)).toList();
    return PaginatedResponse<T>(
      items: items,
      total: json['total'],
      page: json['page'],
      limit: json['limit'],
    );
  }
}