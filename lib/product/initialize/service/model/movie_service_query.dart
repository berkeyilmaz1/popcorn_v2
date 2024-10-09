/// This class is used to make queries for the shop service
enum MovieServiceQuery {
  movieId;

  /// This method is used to make a query with name
  static MapEntry<String, String> makeQuery({
    required MovieServiceQuery query,
    required String value,
  }) {
    return MapEntry(query.name, value);
  }
}
