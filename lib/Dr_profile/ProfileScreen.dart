import 'package:firebase_2/Datebase/databse.dart';
import 'package:firebase_2/data_list.dart';
import 'package:firebase_2/shared_color/gradient_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import '../MyNavigationBar.dart';
import '../Nav_drawer/Nav_drawer.dart';
import 'package:get/get.dart';
import 'package:firebase_2/locale/locale_controller.dart';
class ProfileScreen extends StatefulWidget {
  //const ProfileScreen({required Key key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}


class _ProfileScreenState extends State<ProfileScreen> {

  @override
  Widget build(BuildContext context) {
    Locale_controller controllerLang =Get.find();

    List RoomsName =
    [
      "A1".tr,
      "A2".tr,
      "A3".tr,
      "A4".tr,
      "A5".tr,
      "B1".tr,
      "B2".tr,
      "B3".tr,
      "B4".tr,
      "B5".tr
    ];

    return Scaffold(
      drawer: NavDrawer(),
      appBar: AppBar(),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: gradientColor(),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(child: Image.asset("asset/icons/male-avatar.png")),
              ),
               Text(
                '${usersData[0]['name']}',
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
              const SizedBox(height: 12,),
              Expanded(
                child: SingleChildScrollView(
                  child: ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) => buttonWithIcon(
                        backGround: Colors.white,
                        txt: RoomsName[index],
                        imagePath: "asset/images/bed.png",
                        onPress: () {}),
                    itemCount: RoomsName.length,
                    separatorBuilder: (context, index) =>
                    const SizedBox(height: 15),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buttonWithIcon({
    Color backGround = Colors.white,
    required String txt,
    required Function() onPress,
    required String imagePath,
  }) =>
      ElevatedButton.icon(
        onPressed: () {
          GetPatients(database, txt);
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MyNavigationBar(),
              ));
        },
        icon: CircleAvatar(
          radius: 25,
          backgroundColor: const Color(0xFF32A5F8),
          // 0xFF for spcifying  transparency
          child: Image.asset(
            imagePath,
            matchTextDirection: true,
            width: 40,
            height: 40,
          ),
        ),
        label: Text(
          txt,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            color: Color(0xff041e3e),
            fontSize: 22.0,
          ),
        ),
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(double.infinity, 45),
          alignment: AlignmentDirectional.centerStart,
          primary: backGround,
          padding: const EdgeInsetsDirectional.only(start: 0.0),
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        ),
      );
}
