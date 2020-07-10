import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:twitter_desktop/screens/home/components/sidebar/navigation/item.dart';
import 'package:twitter_desktop/screens/home/components/sidebar/navigation/widget.dart';
import 'package:twitter_desktop/screens/home/components/sidebar/top_area.dart';
import 'package:twitter_desktop/view_model/navigation_item.dart';

class Sidebar extends StatefulWidget {
  final double width;

  const Sidebar({
    Key key,
    this.width,
  }) : super(key: key);

  @override
  _SidebarState createState() => _SidebarState();
}

class _SidebarState extends State<Sidebar> {
  int _currentIndex = 0;

  final _navigation = <NavigationItem>[
    NavigationItem(
      isSelected: true,
      icon: FeatherIcons.home,
      label: 'Home',
    ),
    NavigationItem(
      icon: FeatherIcons.compass,
      label: 'Explore',
    ),
    NavigationItem(
      icon: FeatherIcons.bell,
      label: 'Notifications',
    ),
    NavigationItem(
      icon: FeatherIcons.mail,
      label: 'Messages',
    ),
    NavigationItem(
      icon: FeatherIcons.bookmark,
      label: 'Bookmarks',
    ),
    NavigationItem(
      icon: FeatherIcons.user,
      label: 'Profile',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFF303741),
        boxShadow: [
          BoxShadow(
            blurRadius: 10,
            color: Colors.black.withOpacity(.05),
          ),
        ],
      ),
      width: widget.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SidebarTopArea(
            padding: const EdgeInsets.all(15),
          ),
          SizedBox(
            height: 35,
          ),
          NavigationBar(
            selectedIndex: _currentIndex,
            children: [
              for (int i = 0; i < _navigation.length; i++)
                NavigationBarItem(
                  isSelected: i == _currentIndex,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 15,
                  ),
                  icon: Icon(
                    _navigation[i].icon,
                  ),
                  label: _navigation[i].label,
                  onTap: () {
                    setState(() {
                      _currentIndex = i;
                    });
                  },
                ),
              NavigationBarItem(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 15,
                ),
                icon: Icon(
                  FeatherIcons.moreVertical,
                ),
                label: 'More',
                onTap: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}
