import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/core/design/app_image.dart';
import 'package:flutter_application_1/views/sheets/country_sheet.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppInput extends StatefulWidget {
  final String url, text;
  final Color? color;
  final double width, height;
  final TextEditingController? controller;
  final onChangePhoneCode;
  final TextInputType? keyboardType;
  final String? Function(String? value)? validator;
  final bool isphone;
  const AppInput({
    super.key,
    required this.url,
    this.text = "",
    required this.width,
    required this.height,
    this.isphone = false,
    this.validator,
    this.controller,
    this.keyboardType,
    this.onChangePhoneCode,
    this.color,
  });

  @override
  State<AppInput> createState() => _AppInputState();
}

class _AppInputState extends State<AppInput> {
  var selectedCountry;
  var selectedCode = "966";
  var selectFlag = "suadi.png";
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 20,
      ),
      child: SizedBox(
        width: 343,
        height: 80,
        child: TextFormField(
          validator: widget.validator,
          controller: widget.controller,
          keyboardType: widget.keyboardType,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          inputFormatters: [
            if (widget.isphone) FilteringTextInputFormatter.digitsOnly
          ],
          decoration: InputDecoration(
            hintText: widget.text,
            prefixIcon: Padding(
                padding: const EdgeInsets.all(16.0),
                child: AppImages(
                    url: widget.url,
                    color: widget.color,
                    width: widget.width.w,
                    height: widget.height.h)),
            icon: widget.isphone
                ? IntrinsicHeight(
                    child: GestureDetector(
                      onTap: () async {
                        final result = await showModalBottomSheet(
                          context: context,
                          builder: (context) => CountrySheet(),
                        );
                        if (result != null) {
                          // selectflag = result[1];
                          selectedCode = result[0];
                          setState(() {});
                          widget.onChangePhoneCode(selectedCode);
                        }
                      },
                      child: Container(
                        height: 60.h,
                        width: 100.w,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: const Color(0xffB1B1B1),
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              AppImages(url: selectFlag, width: 32, height: 20),
                              const SizedBox(
                                height: 3,
                              ),
                              Text(
                                "+$selectedCode",
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Theme.of(context).primaryColor),
                              ),
                            ],
                          ),

                          //  DropdownButton(
                          //   hint: const Text("اختر البلد"),
                          //   items: ["USA", "EG", "AR"]
                          //       .map(
                          //         (e) => DropdownMenuItem(
                          //           value: e,
                          //           child: Column(
                          //             mainAxisAlignment: MainAxisAlignment.center,
                          //             children: [
                          //               const AppImages(
                          //                   url: "suadi.png",
                          //                   width: 32,
                          //                   height: 20),
                          //               Text(
                          //                 e,
                          //                 style: TextStyle(
                          //                     fontSize: 15,
                          //                     color:
                          //                         Theme.of(context).primaryColor),
                          //               ),
                          //             ],
                          //           ),
                          //         ),
                          //       )
                          //       .toList(),
                          //   onChanged: (val) {
                          //     setState(() {
                          //       selectedCountry = val!;
                          //     });
                          //   },
                          //   value: selectedCountry,
                          // ),
                        ),
                      ),
                    ),
                  )
                : null,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: const BorderSide(
                color: Color.fromARGB(255, 220, 218, 218),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class AppinputText extends StatefulWidget {
  final String text;
  final String? Function(String? value)? validator;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final int? maxLines;

  const AppinputText(
      {super.key,
      required this.text,
      this.validator,
      this.keyboardType,
      this.controller,
      this.maxLines});

  @override
  State<AppinputText> createState() => _AppinputTextState();
}

class _AppinputTextState extends State<AppinputText> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: widget.validator,
      controller: widget.controller,
      maxLines: widget.maxLines,
      keyboardType: widget.keyboardType,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        disabledBorder:
            UnderlineInputBorder(borderRadius: BorderRadius.circular(14)),
        enabledBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(15)),
            borderSide: BorderSide(color: Colors.grey.shade400)),
        label: Text(
          widget.text,
          style: TextStyle(fontSize: 15, color: Colors.grey.shade400),
        ),
      ),
    );
  }
}
