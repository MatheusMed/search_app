import 'package:search/data/datasource/search_datasource.dart';
import 'package:search/domain/entities/search_entities.dart';

import '../../domain/repositories/search_repository_domain.dart';

class SearchRepositoryData implements ISearchRepositoryDomain {
  final ISearchDatasource _iSearchDatasource;

  SearchRepositoryData(this._iSearchDatasource);
  @override
  Future<List<SearchEntities>> search({required String query}) async {
    return await _iSearchDatasource.search(query: query);
  }
}
