import '../../domain/entities/search_entities.dart';

class SearchEntitiesAdapters {
  static SearchEntities fromMap(dynamic map) {
    return SearchEntities(
      title: map["title"] ?? "No title",
      link: map["link"] ?? "No Link",
    );
  }
}
