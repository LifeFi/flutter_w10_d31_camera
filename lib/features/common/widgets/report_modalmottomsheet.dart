import 'package:flutter/material.dart';
import 'package:flutter_w10_d31_camera/constants/gaps.dart';
import 'package:flutter_w10_d31_camera/constants/sizes.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ReportModalbottomsheet extends StatelessWidget {
  const ReportModalbottomsheet({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.7,
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Sizes.size10,
          ),
          child: ListView(
            children: [
              const Text(
                "Report",
                style: TextStyle(
                  fontSize: Sizes.size20,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              Gaps.v10,
              const Divider(
                thickness: 0.5,
              ),
              ListTile(
                title: const Text(
                  "Why Are you reporting this thread?",
                  style: TextStyle(
                    fontSize: Sizes.size16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  "Your report is anonymous, except if you're reporting an intellectual property infringement. If someone is in immediate danger, call the local emergency services - don't wait.",
                  style: TextStyle(
                    fontSize: Sizes.size14,
                    color: Colors.grey.shade700,
                  ),
                ),
              ),
              const Divider(),
              const ListTile(
                title: Text(
                  "I Just don't like it",
                  style: TextStyle(
                    fontSize: Sizes.size16,
                  ),
                ),
                trailing: FaIcon(
                  FontAwesomeIcons.angleRight,
                  color: Colors.grey,
                  size: Sizes.size20,
                ),
              ),
              const Divider(),
              const ListTile(
                title: Text(
                  "It's unlawful content under NetzDG",
                  style: TextStyle(
                    fontSize: Sizes.size16,
                  ),
                ),
                trailing: FaIcon(
                  FontAwesomeIcons.angleRight,
                  color: Colors.grey,
                  size: Sizes.size20,
                ),
              ),
              const Divider(),
              const ListTile(
                title: Text(
                  "It's spam",
                  style: TextStyle(
                    fontSize: Sizes.size16,
                  ),
                ),
                trailing: FaIcon(
                  FontAwesomeIcons.angleRight,
                  color: Colors.grey,
                  size: Sizes.size20,
                ),
              ),
              const Divider(),
              const ListTile(
                title: Text(
                  "Hate speech or symbols",
                  style: TextStyle(
                    fontSize: Sizes.size16,
                  ),
                ),
                trailing: FaIcon(
                  FontAwesomeIcons.angleRight,
                  color: Colors.grey,
                  size: Sizes.size20,
                ),
              ),
              const Divider(),
              const ListTile(
                title: Text(
                  "Nudity or sexual activity",
                  style: TextStyle(
                    fontSize: Sizes.size16,
                  ),
                ),
                trailing: FaIcon(
                  FontAwesomeIcons.angleRight,
                  color: Colors.grey,
                  size: Sizes.size20,
                ),
              ),
              const Divider(),
            ],
          ),
        ),
      ),
    );
  }
}
