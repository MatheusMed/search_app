import 'package:search/core/failure/search_failure.dart';
import 'package:search/data/adapters/search_entities_adapters.dart';
import 'package:search/core/services/dio_services.dart';

import '../../domain/entities/search_entities.dart';

abstract class ISearchDatasource {
  Future<List<SearchEntities>> search({required String query});
}

class SearchDatasource implements ISearchDatasource {
  final DioServices _dioServices;
  SearchDatasource(this._dioServices);

  @override
  Future<List<SearchEntities>> search({required String query}) async {
    try {
      final resp = await _dioServices.dio().get(query);

      final data = (resp.data as List)
          .map((search) => SearchEntitiesAdapters.fromMap(search))
          .toList();
      return data;
    } catch (e) {
      throw SearchFailure(message: e.toString());
    }
  }
}
