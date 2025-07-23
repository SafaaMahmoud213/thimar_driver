import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/design/app_button.dart';
import 'package:flutter_application_1/core/design/app_input.dart';

class PaySheet extends StatelessWidget {
  const PaySheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Center(
            child: Text(
              "المبلغ المستحق من العميل",
              style: TextStyle(
                fontSize: 20,
                color: Colors.grey,
              ),
            ),
          ),
          Center(
            child: Text(
              "ر.س220",
              style: TextStyle(
                fontSize: 20,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          const AppinputText(text: "اكتب المبلغ المستلم من العميل"),
          const SizedBox(
            height: 29,
          ),
          const AppButton(text: "تأكيد")
        ],
      ),
    );
  }
}
