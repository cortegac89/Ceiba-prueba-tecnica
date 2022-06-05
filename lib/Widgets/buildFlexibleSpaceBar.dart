import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../Screen/AlbumsScreen.dart';

Widget buildIconButton(
    BuildContext context, String text, IconData icon, Function launchWebsite) {
  return Column(
    children: [
      CircleAvatar(
          radius: MediaQuery.of(context).size.height * 0.03,
          backgroundColor: Colors.white,
          child: IconButton(
            icon: Icon(
              icon,
              color: Theme.of(context).primaryColor,
              size: MediaQuery.of(context).size.height * 0.03,
            ),
            onPressed: launchWebsite,
          )),
      SizedBox(
        height: MediaQuery.of(context).size.height * 0.01,
      ),
      Text(
        text,
        style: TextStyle(
            color: Colors.white,
            fontSize: MediaQuery.of(context).size.height * 0.015),
      )
    ],
  );
}

Widget buildWorkAt(BuildContext context, Size screenSize, String name,
    String catchPhrase, String bs) {
  return Column(
    children: [
      Icon(Icons.business_center,
          color: Colors.white, size: screenSize.height * 0.03),
      SizedBox(
        width: screenSize.height * 0.010,
      ),
      Text(
        name,
        style: TextStyle(
          color: Theme.of(context).accentColor,
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
      Text(
        catchPhrase,
        style:
            TextStyle(color: Colors.white, fontSize: screenSize.height * 0.015),
      ),
      Text(
        bs,
        style:
            TextStyle(color: Colors.white, fontSize: screenSize.height * 0.015),
      ),
    ],
  );
}

FlexibleSpaceBar buildFlexibleSpaceBar(
  int id,
  Color color,
  BuildContext context,
  Size screenSize,
  userInfo,
) {
  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      print("object");
      throw 'Could not launch $url';
    }
  }

  return FlexibleSpaceBar(
    background: Container(
        decoration: BoxDecoration(color: color),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceAround,
            //   children: [
            Container(
              padding: const EdgeInsets.only(top: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Hero(
                    tag: id,
                    child: CircleAvatar(
                      radius: screenSize.height * 0.06,
                      backgroundImage: AssetImage(id.isEven
                          ? 'assets/image/woman.jpg'
                          : 'assets/image/man.jpg'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      userInfo.username,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: screenSize.height * 0.025,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),

            //   ],
            // ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.location_on,
                    color: Theme.of(context).accentColor,
                    size: screenSize.height * 0.02,
                  ),
                  InkWell(
                    onTap: () => _launchURL(
                        'https://www.google.com/maps/search/${userInfo.lat},${userInfo.lng}'),
                    child: Text(
                      userInfo.city,
                      style: TextStyle(
                        fontSize: screenSize.height * 0.02,
                        color: Theme.of(context).accentColor,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  )
                ],
              ),
            ),
            buildWorkAt(
              context,
              screenSize,
              userInfo.companyName,
              userInfo.catchPhrase,
              userInfo.bs,
            ),
            SizedBox(
              height: screenSize.height * 0.03,
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buildIconButton(context, "Email", Icons.email,
                      () => _launchURL('mailto:${userInfo.email}')),
                  buildIconButton(context, "Phone", Icons.phone,
                      () => _launchURL('tel:${userInfo.phone}')),
                  buildIconButton(context, "Website", Icons.web,
                      () => _launchURL('https://${userInfo.website}')),
                  buildIconButton(
                    context,
                    "Albums",
                    Icons.photo_album,
                    () => Navigator.of(context).pushNamed(
                      AlbumsScreen.routeName,
                      arguments: AlbumsScreen(
                        userId: userInfo.id,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        )),
  );
}
