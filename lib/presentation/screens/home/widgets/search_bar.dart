import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yandex_project/application/search/search_bloc.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.width / 7,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        margin: const EdgeInsets.all(8),
        color: Colors.white,
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.only(left: 8, right: 8),
          child: TextFormField(
            decoration: const InputDecoration(
              icon: Icon(Icons.search),
              focusColor: Colors.white,
              fillColor: Colors.white,
              hoverColor: Colors.white,
              border: InputBorder.none
            ),
            onFieldSubmitted: (text) {
              BlocProvider.of<SearchBloc>(context).add(SearchEvent.searchByName(name: text));
            },
          ),
        ),
      ),
    );
  }
}
