import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_w10_d31_camera/constants/gaps.dart';
import 'package:flutter_w10_d31_camera/constants/sizes.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PrivacyScreen extends StatefulWidget {
  static const String routeName = "privacy";
  static const String routeURL = "privacy";
  const PrivacyScreen({super.key});

  @override
  State<PrivacyScreen> createState() => _PrivacyScreenState();
}

class _PrivacyScreenState extends State<PrivacyScreen> {
  bool _isPrivateProfile = false;

  void _onToggleIsPrivateProfile(bool? newValue) {
    if (newValue == null) return;
    setState(() {
      _isPrivateProfile = newValue;
    });
  }

  _onBackTap() {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leadingWidth: Sizes.size80,
        leading: Navigator.canPop(context)
            ? GestureDetector(
                onTap: _onBackTap,
                child: const Row(
                  children: [
                    Gaps.h10,
                    FaIcon(
                      FontAwesomeIcons.chevronLeft,
                      size: Sizes.size16,
                    ),
                    Text(
                      " Back",
                      style: TextStyle(fontSize: Sizes.size18),
                    ),
                  ],
                ),
              )
            : Container(),
        title: const Text(
          "Privacy",
          style: TextStyle(fontSize: Sizes.size18, fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView(
        children: [
          Divider(
            indent: Sizes.size10,
            endIndent: Sizes.size10,
            color: Colors.grey.shade300,
          ),
          SwitchListTile.adaptive(
            value: _isPrivateProfile,
            onChanged: _onToggleIsPrivateProfile,
            activeColor: Colors.black,
            title: const Row(
              children: [
                FaIcon(
                  FontAwesomeIcons.lock,
                  size: Sizes.size18,
                ),
                Gaps.h10,
                Text(
                  "Private Profile",
                  style: TextStyle(
                    fontSize: Sizes.size16,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            title: const Row(
              children: [
                FaIcon(
                  FontAwesomeIcons.at,
                  size: Sizes.size18,
                ),
                Gaps.h10,
                Text(
                  "Mentions",
                  style: TextStyle(
                    fontSize: Sizes.size16,
                  ),
                ),
              ],
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Everyone",
                  style: TextStyle(
                    fontSize: Sizes.size16,
                    color: Colors.grey.shade400,
                  ),
                ),
                Gaps.h10,
                FaIcon(
                  FontAwesomeIcons.chevronRight,
                  size: Sizes.size16,
                  color: Colors.grey.shade400,
                )
              ],
            ),
          ),
          ListTile(
            title: const Row(
              children: [
                FaIcon(
                  FontAwesomeIcons.bellSlash,
                  size: Sizes.size18,
                ),
                Gaps.h10,
                Text(
                  "Muted",
                  style: TextStyle(
                    fontSize: Sizes.size16,
                  ),
                ),
              ],
            ),
            trailing: FaIcon(
              FontAwesomeIcons.chevronRight,
              size: Sizes.size16,
              color: Colors.grey.shade400,
            ),
          ),
          ListTile(
            title: const Row(
              children: [
                FaIcon(
                  FontAwesomeIcons.eyeSlash,
                  size: Sizes.size18,
                ),
                Gaps.h10,
                Text(
                  "Hidden Words",
                  style: TextStyle(
                    fontSize: Sizes.size16,
                  ),
                ),
              ],
            ),
            trailing: FaIcon(
              FontAwesomeIcons.chevronRight,
              size: Sizes.size16,
              color: Colors.grey.shade400,
            ),
          ),
          ListTile(
            title: const Row(
              children: [
                FaIcon(
                  FontAwesomeIcons.userGroup,
                  size: Sizes.size18,
                ),
                Gaps.h10,
                Text(
                  "Profiles you follow",
                  style: TextStyle(
                    fontSize: Sizes.size16,
                  ),
                ),
              ],
            ),
            trailing: FaIcon(
              FontAwesomeIcons.chevronRight,
              size: Sizes.size16,
              color: Colors.grey.shade400,
            ),
          ),
          Divider(
            indent: Sizes.size10,
            endIndent: Sizes.size10,
            color: Colors.grey.shade300,
          ),
          ListTile(
            title: const Text(
              "Other privacy settings",
              style: TextStyle(
                fontSize: Sizes.size16,
              ),
            ),
            subtitle: const Text(
              "Some settings, like restrict, apply to both Threads and Instagram and can be managed on Instagram.",
              style: TextStyle(
                fontSize: Sizes.size16,
                color: Colors.grey,
              ),
            ),
            trailing: FaIcon(
              FontAwesomeIcons.arrowUpRightFromSquare,
              size: Sizes.size16,
              color: Colors.grey.shade400,
            ),
          ),
          ListTile(
            title: const Row(
              children: [
                FaIcon(
                  FontAwesomeIcons.circleXmark,
                  size: Sizes.size18,
                ),
                Gaps.h10,
                Text(
                  "Blocked profiles",
                  style: TextStyle(
                    fontSize: Sizes.size16,
                  ),
                ),
              ],
            ),
            trailing: FaIcon(
              FontAwesomeIcons.arrowUpRightFromSquare,
              size: Sizes.size16,
              color: Colors.grey.shade400,
            ),
          ),
          ListTile(
            title: const Row(
              children: [
                FaIcon(
                  FontAwesomeIcons.heartCircleXmark,
                  size: Sizes.size18,
                ),
                Gaps.h10,
                Text(
                  "Hide likes",
                  style: TextStyle(
                    fontSize: Sizes.size16,
                  ),
                ),
              ],
            ),
            trailing: FaIcon(
              FontAwesomeIcons.arrowUpRightFromSquare,
              size: Sizes.size16,
              color: Colors.grey.shade400,
            ),
          ),
        ],
      ),
    );
  }
}
