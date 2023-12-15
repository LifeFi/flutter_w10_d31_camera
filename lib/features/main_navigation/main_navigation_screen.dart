import 'package:flutter/material.dart';
import 'package:flutter_w10_d31_camera/constants/sizes.dart';
import 'package:flutter_w10_d31_camera/features/activity/views/activity_screen.dart';
import 'package:flutter_w10_d31_camera/features/home/views/home_screen.dart';
import 'package:flutter_w10_d31_camera/features/main_navigation/widgets/nav_tab.dart';
import 'package:flutter_w10_d31_camera/features/main_navigation/widgets/show_bottom_tap_bar.dart';
import 'package:flutter_w10_d31_camera/features/post/view/post_screen.dart';
import 'package:flutter_w10_d31_camera/features/search/views/search_screen.dart';
import 'package:flutter_w10_d31_camera/features/users/views/user_profile_screen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class MainNavigationScreen extends StatefulWidget {
  static const String routeName = "mainNavigation";
  final String tab;

  const MainNavigationScreen({
    super.key,
    this.tab = "home",
  });

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _selectedIndex = 0;

  final List<String> _tabs = [
    "home",
    "search",
    "post",
    "activity",
    "profile",
  ];

  Future<void> _onTap(int index) async {
    if (index == 2) {
      final bool isPosted;
      isPosted = await _showPostModal();
      if (isPosted) {
        setState(() {
          _selectedIndex = 0;
        });
      }
    } else {
      context.go("/${_tabs[index]}");
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  Future<bool> _showPostModal() async {
    final bool isPosted;
    isPosted = await showModalBottomSheet(
          isScrollControlled: true,
          elevation: 0,
          context: context,
          builder: (context) => const PostScreen(),
          backgroundColor: Colors.white,
          clipBehavior: Clip.hardEdge,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(Sizes.size16),
              topRight: Radius.circular(Sizes.size16),
            ),
          ),
        ) ??
        false;
    return isPosted;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Offstage(
            offstage: _selectedIndex != 0,
            child: const HomeScreen(),
          ),
          Offstage(offstage: _selectedIndex != 1, child: const SearchScreen()),
          Offstage(
            offstage: _selectedIndex != 2,
            child: const Placeholder(
              child: Center(
                child: Text(
                  "Post",
                  style: TextStyle(
                    fontSize: Sizes.size28,
                  ),
                ),
              ),
            ),
          ),
          Offstage(
            offstage: _selectedIndex != 3,
            child: const ActivityScreen(),
          ),
          Offstage(
            offstage: _selectedIndex != 4,
            child: const UserProfileScreen(),
          ),
          ValueListenableBuilder(
              valueListenable: showBottomTabBar,
              builder: (context, value, child) {
                return Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: AnimatedSlide(
                    offset: Offset(
                      0,
                      value ? 0 : 1.0,
                    ),
                    duration: const Duration(milliseconds: 300),
                    child: Container(
                      height: Sizes.size80,
                      padding: const EdgeInsets.only(
                        top: Sizes.size20,
                        bottom: Sizes.size32,
                      ),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          NavTab(
                            isSelected: _selectedIndex == 0,
                            icon: FontAwesomeIcons.house,
                            selectedIcon: FontAwesomeIcons.house,
                            onTap: () => _onTap(0),
                          ),
                          NavTab(
                            isSelected: _selectedIndex == 1,
                            icon: FontAwesomeIcons.magnifyingGlass,
                            selectedIcon: FontAwesomeIcons.magnifyingGlass,
                            onTap: () => _onTap(1),
                          ),
                          NavTab(
                            isSelected: _selectedIndex == 2,
                            icon: FontAwesomeIcons.penToSquare,
                            selectedIcon: FontAwesomeIcons.penToSquare,
                            onTap: () => _onTap(2),
                          ),
                          NavTab(
                            isSelected: _selectedIndex == 3,
                            icon: FontAwesomeIcons.heart,
                            selectedIcon: FontAwesomeIcons.solidHeart,
                            onTap: () => _onTap(3),
                          ),
                          NavTab(
                            isSelected: _selectedIndex == 4,
                            icon: FontAwesomeIcons.user,
                            selectedIcon: FontAwesomeIcons.userLarge,
                            onTap: () => _onTap(4),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              })
        ],
      ),
    );
  }
}
