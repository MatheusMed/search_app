import 'package:flutter/material.dart';
import 'package:search/core/failure/search_failure.dart';

import '../../../domain/entities/search_entities.dart';
import '../../../domain/usescases/search_usescases.dart';

class SearchControllers extends ChangeNotifier {
  final ISearchUsescases _iSearchUsescases;

  SearchControllers(this._iSearchUsescases);

  final listaSearch = ValueNotifier(<SearchEntities>[]);
  final loading = ValueNotifier(false);

  final textSearchController = TextEditingController();

  search(String query) async {
    try {
      loading.value = true;
      final listSearch = await _iSearchUsescases.search(query: query);

      listaSearch.value = listSearch;
      loading.value = false;
      notifyListeners();
    } catch (e) {
      throw SearchFailure(message: e.toString());
    }
  }
}
