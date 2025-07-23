import 'package:flutter/material.dart';
import 'package:flutter_application_1/views/my_account/contact_us/bloc/bloc.dart';
import 'package:flutter_application_1/views/my_account/contact_us/bloc/event.dart';
import 'package:flutter_application_1/views/my_account/contact_us/bloc/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:kiwi/kiwi.dart';

import '../../../core/design/app_button.dart';
import '../../../core/design/app_failed.dart';
import '../../../core/design/app_image.dart';
import '../../../core/design/app_loading.dart';
import '../../../core/design/map_style.dart';
import '../../../core/logic/helper_method.dart';
import '../../main/home_nav/pages/my_account_home/view.dart';

class ContactUsView extends StatefulWidget {
  const ContactUsView({super.key});

  @override
  State<ContactUsView> createState() => _ContactUsViewState();
}

class _ContactUsViewState extends State<ContactUsView> {
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final bloc = KiwiContainer().resolve<ContactUsBloc>()
      ..add(GetContactUsEvent());
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "تواصل معنا ",
          style: TextStyle(
            fontSize: 20,
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
          padding: const EdgeInsets.all(18.0),
          child: BlocBuilder(
              bloc: bloc,
              builder: (context, state) {
                if (state is ContactUsSuccessStates) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const SizedBox(
                        height: 88,
                      ),
                      SizedBox(
                        width: 342.w,
                        height: 210.h,
                        child:
                            Stack(alignment: Alignment.bottomLeft, children: [
                          GoogleMap(
                            initialCameraPosition: CameraPosition(
                              target: LatLng(state.list.lat, state.list.lng),
                              zoom: 15,
                            ),
                            markers: {
                              Marker(
                                  markerId: const MarkerId("value"),
                                  icon:
                                      BitmapDescriptor.defaultMarkerWithHue(22),
                                  position: const LatLng(31.0545, 30.441))
                            },
                            onMapCreated: (controller) {
                              controller.setMapStyle(mapStyle);
                            },
                          ),
                          Container(
                            padding: const EdgeInsets.all(8),
                            width: 312.w,
                            height: 129.h,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(14),
                                color: Colors.white,
                                border:
                                    Border.all(color: Colors.grey.shade200)),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    AppImages(
                                      url: "location.png",
                                      width: 12,
                                      height: 15,
                                      color: Theme.of(context).primaryColor,
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    Text(
                                      state.list.location,
                                      style: TextStyle(
                                          fontSize: 10.sp, color: Colors.black),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 16,
                                ),
                                Row(
                                  children: [
                                    const AppImages(
                                      url: "phone.png",
                                      width: 12,
                                      height: 15,
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    Text(
                                      state.list.phone,
                                      style: TextStyle(
                                          fontSize: 12.sp, color: Colors.black),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 16,
                                ),
                                Row(
                                  children: [
                                    const AppImages(
                                      url: "user.png",
                                      width: 12,
                                      height: 15,
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    Text(
                                      state.list.email,
                                      style: TextStyle(
                                          fontSize: 12.sp, color: Colors.black),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ]),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Center(
                        child: Text(
                          "أو يمكنك إرسال رسالة ",
                          style: TextStyle(
                              fontSize: 13.sp,
                              color: Theme.of(context).primaryColor),
                        ),
                      ),
                      SizedBox(
                        height: 32.h,
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "يجب ادخال الاسم صحيحا";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            hintText: "الإسم",
                            border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.grey.shade50),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10.r),
                                ))),
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "يجب ادخال رقم الموبايل صحيحا";
                          }
                          return null;
                        },
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                            hintText: "رقم الموبايل",
                            border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.grey.shade50),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.r)))),
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      TextFormField(
                        maxLines: 2,
                        decoration: InputDecoration(
                            hintText: "الموضوع",
                            border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.grey.shade50),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.r)))),
                      ),
                      SizedBox(
                        height: 22.h,
                      ),
                      AppButton(
                        text: "إرسال",
                        onpress: () {
                          if (formKey.currentState!.validate()) {
                            navigateTo(const MyAccountView());
                          }
                        },
                      )
                    ],
                  );
                } else if (state is ContactUsFailedStates) {
                  return Appfailed(
                    msg: state.msg,
                  );
                }
                return const AppLoading();
              }),
        ),
      ),
    );
  }
}
