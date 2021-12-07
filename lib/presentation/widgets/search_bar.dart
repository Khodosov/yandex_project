import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yandex_project/application/search/search_bloc.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 8, right: 8),
          child: TextFormField(
            controller: controller,
            decoration: const InputDecoration(
              focusColor: Colors.white,
              fillColor: Colors.white,
              hoverColor: Colors.white,
              border: InputBorder.none
            ),
            onFieldSubmitted: (text) {
              BlocProvider.of<SearchBloc>(context).add(SearchEvent.searchByName(name: controller.text));
            },
          ),
        ),
      ),
    );
  }
}
