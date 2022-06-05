import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Search/search_delegate.dart';

Widget buildMainUi(
    {BuildContext context,
    String heading,
    Widget body,
    EdgeInsetsGeometry padding}) {
  final screenSize = MediaQuery.of(context).size;
  return Container(
    color: Theme.of(context).primaryColor,
    child: CustomScrollView(slivers: <Widget>[
      SliverAppBar(
        forceElevated: false,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.search_outlined),
            onPressed: () => showSearch(context: context, delegate: MovieSearchDelegate() ),
          )
        ],
        floating: true,
        expandedHeight: screenSize.height * 0.20,
        centerTitle: true,
        flexibleSpace: Container(
          alignment: Alignment.center,
          padding: padding,
          child: Text(
            heading,
            style: GoogleFonts.lato(
              textStyle: TextStyle(
                fontSize: screenSize.height * 0.07,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
      Container(child: body)
    ]),
  );
}
