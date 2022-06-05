import 'package:flutter/material.dart';


class MovieSearchDelegate extends SearchDelegate {

  @override
  // TODO: implement searchFieldLabel
  String get searchFieldLabel =>'Search by Name';

  @override
  List<Widget> buildActions(BuildContext context) {
    // TODO: implement buildActions
   return [
     IconButton(
       icon: Icon(Icons.clear),
     onPressed: () => query = '',

     )
   ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
      close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    return Text('buildResults');
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    if (query.isEmpty) {
      return Container(
        child: Center(
          child: Icon(Icons.announcement_rounded, color: Colors.black38, size: 130,),
        ),
      );
    }

    return Container();

  }
  
}