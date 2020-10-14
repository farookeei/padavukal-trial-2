import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:padavukal/screens/aboutUs.dart';
<<<<<<< HEAD
=======
import 'package:padavukal/screens/course_screen/courses_screen.dart';
>>>>>>> 3da2de9cfda49440711107c1db1d5f445c33b44a
import 'package:padavukal/screens/razorpay/razorpay.dart';
import 'package:padavukal/widgets/buttons/popbutton.dart';

import 'package:share/share.dart';

class ProfileScreen extends StatelessWidget {
  static const routeName = "profile";
  @override
  Widget build(BuildContext context) {
    // User currentUser =
    //     Provider.of<UserProvider>(context, listen: false).currentUser;

    return Scaffold(
      // appBar: AppBar(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                overflow: Overflow.visible,
                children: [
                  Image.asset(
                    "assets/images/onboardtop.png",
                    height: 180,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      PopupButton(),
                      IconButton(
                          icon: Icon(
                            Icons.settings,
                            color: Colors.black,
                          ),
                          onPressed: () {})
                    ],
                  ),
                  Positioned(
                      left: 50,
                      right: 50,
                      top: 50,
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: 40,
                            child: Icon(
                              MdiIcons.account,
                              size: 40,
                            ),
                          ),
                          SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.010),
                          Text(
                            // currentUser.name, //* have to change
                            "User",
                            style: Theme.of(context).textTheme.headline5,
                          )
                        ],
                      )),
                ],
              ),
              Info(icon: MdiIcons.phone, title: "987654321"),
              Info(icon: MdiIcons.email, title: "email"),
              // currentUser.email
              // Info(
              //   icon: MdiIcons.syncIcon,
              //   title: "Change Course",
              //   onPressed: () =>
              //       Navigator.of(context).pushNamed(CourseScreen.routeName),
              // ),
              Info(
                icon: MdiIcons.syncIcon,
                title: "Get Premium Package",
                onPressed: () =>
                    Navigator.of(context).pushNamed(RazorPay.routeName),
              ),
              Info(icon: MdiIcons.messageAlert, title: "Terms and Conditions"),
              Info(
                icon: MdiIcons.information,
                title: "About us",
                onPressed: () =>
                    Navigator.of(context).pushNamed(AboutUs.routeName),
              ),
              Info(icon: MdiIcons.phoneDial, title: "Contact us"),
              Info(icon: MdiIcons.hand, title: "Help"),
              Info(
                icon: MdiIcons.redo,
                title: "Share Application",
                onPressed: () => share(context),
              ),
            ],
          ),
        ),
      ),
      // bottomNavigationBar: TabsScreen(),
    );
  }
}

void share(BuildContext context) {
  final RenderBox box = context.findRenderObject();
  Share.share('Hey,Check our this app https://example.com',
      sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size);
}

class Info extends StatelessWidget {
  final String title;
  final IconData icon;
  final Function onPressed;

  Info({
    this.icon,
    this.onPressed,
    this.title,
  });
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        child: Icon(icon),
      ),
      title: Text(
        title,
        style: Theme.of(context).textTheme.bodyText1,
      ),
      onTap: onPressed,
    );
  }
}
