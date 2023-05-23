
import '../entities/search_entities.dart';

abstract class ISearchRepositoryDomain {
  Future<List<SearchEntities>> search({required String query});
}
