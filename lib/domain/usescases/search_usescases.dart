import 'package:search/domain/entities/search_entities.dart';

import '../repositories/search_repository_domain.dart';

abstract class ISearchUsescases {
  Future<List<SearchEntities>> search({required String query});
}

class SearchUsescases implements ISearchUsescases {
  final ISearchRepositoryDomain _iSearchRepository;

  SearchUsescases(this._iSearchRepository);

  @override
  Future<List<SearchEntities>> search({required String query}) async {
    return await _iSearchRepository.search(query: query);
  }
}
