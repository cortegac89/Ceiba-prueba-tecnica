import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/dataProvider.dart';
import '../Screen/UserScreen.dart';
import '../Widgets/Post/usersPostWidgets.dart';

import '../Widgets/mainUiWidget.dart';

class UsersScreen extends StatelessWidget {
  static const routeName = '/users';
  @override
  Widget build(BuildContext context) {
    final userData = Provider.of<DataProvider>(context);
    final screenSize = MediaQuery.of(context).size;

    return buildMainUi(
        context: context,
        body: SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, i) => UserCards(
              screenSize: screenSize,
              name: userData.userInfo[i].name,
              phone: userData.userInfo[i].phone,
              email: userData.userInfo[i].email,
              id: userData.userInfo[i].id,
              userInfo: userData.userInfo[i],
            ),
            childCount: userData.userInfo.length,
          ),
        ),
        heading: "Users",
        padding: const EdgeInsets.only(left: 18.0, top: 40, bottom: 20));
  }
}

class UserCards extends StatelessWidget {
  const UserCards({
    Key key,
    @required this.screenSize,
    this.name,
    this.phone,
    this.email,
    this.id,
    this.userInfo,
    this.userAddress,
    this.userlocations,
    this.userCompany,
  }) : super(key: key);

  final Size screenSize;
  final String name;
  final String phone;
  final String email;
  final int id;
  final userInfo;
  final userAddress;
  final userlocations;
  final userCompany;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => {
        Navigator.of(context).push(
          PageRouteBuilder<Null>(
            pageBuilder: (BuildContext context, Animation<double> animation,
                Animation<double> secondaryAnimation) {
              return AnimatedBuilder(
                  animation: animation,
                  builder: (BuildContext context, Widget child) {
                    return Opacity(
                      opacity: animation.value,
                      child: UserScreen(
                        userInfo: userInfo,
                        id: id,
                      ),
                    );
                  });
            },
            transitionDuration: Duration(milliseconds: 600),
          ),
        )
      },
      child: Card(
        shape: StadiumBorder(),
        elevation: 5,
        child: Hero(
          tag: id,
          child: Container(
            padding: const EdgeInsets.all(12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: userDetails(
                      context,
                      screenSize,
                      Theme.of(context).primaryColor,
                      screenSize.height * 0.053,
                      screenSize.height * 0.050,
                      name,
                      phone,
                      email,
                      id),
                ),
                Padding(
                    padding: const EdgeInsets.only(right: 12.0),
                    child: Icon(Icons.arrow_forward_ios_rounded)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
