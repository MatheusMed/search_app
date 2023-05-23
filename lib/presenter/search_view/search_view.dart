import 'package:flutter/material.dart';
import 'package:search/core/services/dio_services.dart';
import 'package:search/domain/usescases/search_usescases.dart';
import 'package:search/presenter/search_view/controllers/search_controllers.dart';
import 'package:search/presenter/search_view/widgets/list_result_search.dart';

import '../../data/datasource/search_datasource.dart';
import '../../data/repositories/search_repository_data.dart';

class SearchView extends StatefulWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  final controller = SearchControllers(
    SearchUsescases(SearchRepositoryData(
      SearchDatasource(
        DioServices(),
      ),
    )),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search View'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: controller.textSearchController,
            ),
          ),
          OutlinedButton(
            onPressed: () {
              if (controller.textSearchController.text.isNotEmpty) {
                controller.search(controller.textSearchController.text);
              }
            },
            child: const Text('Pesquisar'),
          ),
          ListResultSearch(
            loading: controller.loading,
            listaSearch: controller.listaSearch,
          )
        ],
      ),
    );
  }
}
