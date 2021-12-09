import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yandex_project/application/search/search_bloc.dart';
import 'package:yandex_project/constants.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.width / 7,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppConstants.bigRadius)),
        margin: const EdgeInsets.all(8),
        elevation: 5,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 8, right: 8),
            child: TextFormField(
              cursorHeight: 15,
              cursorColor: Theme.of(context).iconTheme.color,
              decoration:  InputDecoration(
                icon: Icon(Icons.search, color: Theme.of(context).iconTheme.color,),
                border: InputBorder.none
              ),
              onFieldSubmitted: (text) {
                BlocProvider.of<SearchBloc>(context).add(SearchEvent.searchByName(name: text));
              },
            ),
          ),
        ),
      ),
    );
  }
}
