import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/design/app_image.dart';

class CountrySheet extends StatelessWidget {
  CountrySheet({super.key});
  final list = [
    "966",
    "20",
    "823",
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) => GestureDetector(
        onTap: () {
          Navigator.pop(context, [list[index]]);
        },
        child: Container(
          color: Colors.transparent,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const AppImages(url: "suadi.png", width: 32, height: 20),
              const SizedBox(
                width: 16,
              ),
              Text(
                list[index],
                style: TextStyle(
                    fontSize: 15, color: Theme.of(context).primaryColor),
              ),
            ],
          ),
        ),
      ),
      itemCount: list.length,
      separatorBuilder: (context, index) => const Divider(),
    );
  }
}
