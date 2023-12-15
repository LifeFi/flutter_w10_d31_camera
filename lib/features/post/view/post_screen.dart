import 'dart:developer';
import 'dart:io';

import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_w10_d31_camera/constants/gaps.dart';
import 'package:flutter_w10_d31_camera/constants/sizes.dart';
import 'package:flutter_w10_d31_camera/features/home/views/widgets/feeds_data.dart';
import 'package:flutter_w10_d31_camera/features/post/view/camera_screen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

final Map<String, dynamic> user = {
  "id": random.integer(1000000),
  "name": faker.person.name(),
  "avatar": faker.image.image(
    keywords: ["avatar", "profile"],
    height: 80,
    width: 80,
    random: true,
  ),
};

class PostScreen extends StatefulWidget {
  static const String routeName = "post";
  static const String routeURL = "/post";

  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  final TextEditingController _controller = TextEditingController();
  final List<dynamic> _photos = [];

  _onScaffoldTap() {
    FocusScope.of(context).unfocus();
  }

  _onCancelTap() {
    Navigator.of(context).pop(false);
  }

  _onPhotoTap() async {
    final result = await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const CameraScreen(),
      ),
    );
    if (result == null) return;
    _photos.addAll([...result]);
    debugPrint(result.toString());
    if (_photos.isNotEmpty) print(_photos[0].path);
    setState(() {});
  }

  _onPostTap() {
    feedsData.post(
      id: user["id"],
      name: user["name"],
      avatar: user["avatar"],
      content: _controller.text,
      images:
          _photos.isNotEmpty ? _photos.map((item) => item.path).toList() : [],
    );

    Navigator.of(context).pop(true);
  }

  @override
  void initState() {
    super.initState();
    _controller.addListener(
      () {
        setState(() {});
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  bool _isEnablePost() {
    return _controller.value.text.isNotEmpty;
  }

  _onDeleteTap(int index) {
    _photos.removeAt(index);
    setState(() {});
  }

  _onDeleteAllTap() {
    _photos.clear();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.9,
      child: GestureDetector(
        onTap: _onScaffoldTap,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            surfaceTintColor: Colors.white,
            leadingWidth: 100,
            leading: GestureDetector(
                onTap: _onCancelTap,
                child: Container(
                  width: Sizes.size40,
                  padding: const EdgeInsets.only(
                    left: Sizes.size18,
                    top: Sizes.size18,
                  ),
                  child: const Text(
                    "Cancel",
                    style: TextStyle(fontSize: Sizes.size18),
                  ),
                )),
            title: const Text(
              "New thread",
              style: TextStyle(
                fontSize: Sizes.size18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: Sizes.size10,
            ),
            child: Stack(
              children: [
                ListView(
                  children: [
                    const Divider(
                      thickness: 0.5,
                    ),
                    Gaps.v10,
                    IntrinsicHeight(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: Colors.grey,
                                    width: 1.5,
                                  ),
                                ),
                                child: CircleAvatar(
                                  radius: Sizes.size20,
                                  foregroundImage: NetworkImage(user["avatar"]),
                                ),
                              ),
                              Expanded(
                                child: VerticalDivider(
                                  color: Colors.grey.shade300,
                                  thickness: 2.5,
                                  indent: Sizes.size10,
                                  endIndent: Sizes.size10,
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: Colors.grey,
                                    width: 1.5,
                                  ),
                                ),
                                child: CircleAvatar(
                                  radius: Sizes.size8,
                                  foregroundImage: NetworkImage(user["avatar"]),
                                  child: const CircleAvatar(
                                    backgroundColor: Colors.red,
                                    radius: Sizes.size8,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Gaps.h10,
                          Expanded(
                            child: Stack(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      user["name"],
                                      style: const TextStyle(
                                        fontSize: Sizes.size16,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    TextField(
                                      controller: _controller,
                                      autofocus: true,
                                      maxLines: null,
                                      decoration: const InputDecoration(
                                        isDense: true,
                                        hintText: "Start a thread...",
                                        hintStyle: TextStyle(
                                          color: Colors.grey,
                                        ),
                                        border: InputBorder.none,
                                      ),
                                      cursorColor:
                                          Theme.of(context).primaryColor,
                                    ),
                                    Gaps.v10,
                                    if (_photos.isNotEmpty)
                                      SizedBox(
                                        height: 200,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        child: ListView(
                                          scrollDirection: Axis.horizontal,
                                          children: [
                                            for (var index = 0;
                                                index < _photos.length;
                                                index++)
                                              Stack(
                                                children: [
                                                  Container(
                                                    width: 270,
                                                    height: 200,
                                                    margin:
                                                        const EdgeInsets.only(
                                                      top: 10,
                                                      right: 10,
                                                    ),
                                                    clipBehavior: Clip.hardEdge,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                    ),
                                                    child: Image.file(
                                                      File(_photos[index].path),
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                  Positioned(
                                                    top: Sizes.size16,
                                                    right: Sizes.size16,
                                                    child: GestureDetector(
                                                      onTap: () =>
                                                          _onDeleteTap(index),
                                                      child: Container(
                                                        padding:
                                                            EdgeInsets.zero,
                                                        alignment:
                                                            Alignment.center,
                                                        width: Sizes.size24,
                                                        height: Sizes.size24,
                                                        decoration:
                                                            const BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
                                                          color: Colors.grey,
                                                        ),
                                                        child: const FaIcon(
                                                          FontAwesomeIcons
                                                              .xmark,
                                                          color: Colors.white,
                                                          size: Sizes.size14,
                                                        ),
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                          ],
                                        ),
                                      )
                                    else
                                      Container(),
                                    Gaps.v10,
                                    GestureDetector(
                                      onTap: _onPhotoTap,
                                      child: const FaIcon(
                                        FontAwesomeIcons.paperclip,
                                        size: Sizes.size24,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    Gaps.v40,
                                  ],
                                ),
                                if (_photos.isNotEmpty)
                                  Positioned(
                                    right: Sizes.size6,
                                    top: Sizes.size4,
                                    child: GestureDetector(
                                      onTap: () => _onDeleteAllTap(),
                                      child: const FaIcon(
                                        FontAwesomeIcons.xmark,
                                        color: Colors.grey,
                                        size: Sizes.size16,
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Gaps.v80,
                  ],
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    color: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      vertical: Sizes.size20,
                      horizontal: Sizes.size20,
                    ),
                    // height: 100,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Text("Anyone can reply"),
                        GestureDetector(
                          onTap: _isEnablePost() ? _onPostTap : null,
                          child: Text(
                            "Post",
                            style: TextStyle(
                              color: _isEnablePost()
                                  ? Theme.of(context).primaryColor
                                  : Colors.grey,
                              fontSize: Sizes.size18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
