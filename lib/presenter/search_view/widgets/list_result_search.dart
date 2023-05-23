import 'package:flutter/material.dart';
import 'package:search/presenter/search_view/widgets/view_link_web.dart';

import '../../../domain/entities/search_entities.dart';

class ListResultSearch extends StatelessWidget {
  final ValueNotifier<bool> loading;
  final ValueNotifier<List<SearchEntities>> listaSearch;
  const ListResultSearch({
    Key? key,
    required this.loading,
    required this.listaSearch,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: ValueListenableBuilder(
          valueListenable: loading,
          builder: (context, loading, _) {
            return loading == true
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : ValueListenableBuilder(
                    valueListenable: listaSearch,
                    builder: (context, listaSearch, child) {
                      return listaSearch.isNotEmpty
                          ? ListView.builder(
                              shrinkWrap: true,
                              itemCount: listaSearch.length,
                              itemBuilder: (context, index) {
                                var search = listaSearch[index];
                                return ListTile(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              ViewLinkWeb(link: search.link),
                                        ));
                                  },
                                  title: Text(search.title),
                                  subtitle: Text(search.link),
                                );
                              },
                            )
                          : const SizedBox();
                    },
                  );
          }),
    );
  }
}
