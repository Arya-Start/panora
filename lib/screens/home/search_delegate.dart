import 'package:flutter/material.dart';
import 'package:panora/provider/response_provider.dart';

class SearchDeleGate extends SearchDelegate {
  final ResponseProvider response;
  SearchDeleGate({this.response});
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        tooltip: 'Clear',
        icon: AnimatedIcon(
          icon: AnimatedIcons.menu_close,
          progress: transitionAnimation,
        ),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  String get searchFieldLabel => 'book,author etc';

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      tooltip: 'Back',
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container(
      child: Center(
        child: Text(query),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    response.fetchData(query);
    return Container(
      child: response.isHas()
          ? Center(
              child: Text(
                  '${response.getAllData().getAuthors.length}\n ${response.getAllData().getBooks.length}'),
            )
          : Center(
              child: Text('No Data'),
            ),
    );
  }
}
