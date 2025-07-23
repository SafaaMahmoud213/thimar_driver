import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

import '../../../core/design/app_button.dart';
import '../../../core/design/app_image.dart';
import '../../../core/design/app_input.dart';
import '../../../core/logic/helper_method.dart';
import '../../main/home_nav/pages/my_account_home/view.dart';

class MyProfileView extends StatefulWidget {
  const MyProfileView({super.key});

  @override
  State<MyProfileView> createState() => _MyProfileViewState();
}

class _MyProfileViewState extends State<MyProfileView> {
  final formKey = GlobalKey<FormState>();
  XFile? image;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          " البيانات الشخصية",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).primaryColor,
          ),
        ),
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            padding: const EdgeInsets.all(14),
            margin: const EdgeInsets.all(8),
            width: 32,
            height: 32,
            decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(15)),
            child: const AppImages(
              url: "arro.png",
              width: 5,
              height: 5,
            ),
          ),
        ),
      ),
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                children: [
                  if (image == null)
                    const AppImages(
                      url: "pers.png",
                      width: 88,
                      height: 88,
                    ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20, right: 30),
                    child: IconButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) => SimpleDialog(
                            title: const Text("Choose Image Source"),
                            children: [
                              TextButton(
                                onPressed: () async {
                                  image = await ImagePicker()
                                      .pickImage(source: ImageSource.gallery);
                                  setState(() {});
                                },
                                child: const Text("Get From Gallery"),
                              ),
                              TextButton(
                                onPressed: () async {
                                  image = await ImagePicker()
                                      .pickImage(source: ImageSource.camera);
                                  setState(() {});
                                },
                                child: const Text("Get From Camera"),
                              ),
                            ],
                          ),
                        );
                      },
                      icon: const Icon(
                        Icons.camera_alt_rounded,
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
              Text(
                "محمد علي",
                style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor),
              ),
              Text(
                "96654787856+",
                style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: 342,
                height: 55,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Colors.grey.shade300)),
                child: Row(
                  children: [
                    Container(
                      width: 165,
                      height: 42,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Theme.of(context).primaryColor,
                      ),
                      child: const Center(
                        child: Text(
                          "البيانات الشخصية",
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                      ),
                    ),
                    Container(
                      width: 165,
                      height: 42,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white,
                      ),
                      child: Center(
                        child: Text(
                          "بيانات السيارة",
                          style: TextStyle(
                              color: Colors.grey.shade500, fontSize: 15),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              AppInput(
                  url: "user.png",
                  text: "اسم المستخدم",
                  keyboardType: TextInputType.text,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "يجب ادخال اسم المستخدم صحيح";
                    }
                    return null;
                  },
                  width: 16,
                  height: 20),
              AppInput(
                url: "phone.png",
                text: " رقم الجوال",
                keyboardType: TextInputType.phone,
                width: 19,
                height: 20,
                isphone: true,
                validator: (value) {
                  if (value!.isEmpty) {
                    return " يجب ادخال رقم الجوال صحيح  ";
                  } else if (value.length < 10) {
                    return " يجب ان يتكون من 11 رقم ";
                  }
                  return null;
                },
              ),
              AppInput(
                url: "city.png",
                color: Theme.of(context).primaryColor,
                text: "المدينة",
                keyboardType: TextInputType.text,
                validator: (value) {
                  if (value!.isEmpty) {
                    return " يجب ان لا تكون المدينة فارغه";
                  }
                  return null;
                },
                width: 19,
                height: 20,
              ),
              AppInput(
                url: "lock.png",
                color: Theme.of(context).primaryColor,
                text: "كلمة المرور",
                keyboardType: TextInputType.text,
                validator: (value) {
                  if (value!.isEmpty) {
                    return " يجب ان لا تكون كلمه المرور فارغه";
                  }
                  return null;
                },
                width: 19,
                height: 20,
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: AppButton(
                    text: "تعديل البيانات",
                    onpress: () {
                      if (formKey.currentState!.validate()) {
                        navigateTo(const MyAccountView());
                      }
                    },
                    width: 350,
                    height: 60),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
