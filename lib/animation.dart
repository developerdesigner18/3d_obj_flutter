import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cube/flutter_cube.dart';
import 'package:google_fonts/google_fonts.dart';

class animationtype extends StatefulWidget {
  const animationtype({super.key});

  @override
  State<animationtype> createState() => _animationtypeState();
}

class _animationtypeState extends State<animationtype> {
  Object? personView;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    personView = Object(fileName: "assets/uploads_files_2008615_piper-cub.obj");
    personView!.position.setValues(0, 0, 5);

    personView!.rotation.setValues(0, 90, 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(0, 0, 0, 0),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            colors: [
              Color(0xffc6c6e9),
              Color(0xff2a2c45),
            ],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 25, right: 25, top: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color:
                            Color.fromARGB(255, 255, 255, 255).withOpacity(0.4),
                      ),
                      height: 55,
                      width: 55,
                      child: const Icon(
                        Icons.menu,
                        color: Color(0xff2a2c45),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color:
                            Color.fromARGB(255, 255, 255, 255).withOpacity(0.4),
                      ),
                      height: 55,
                      width: 55,
                      child: const Icon(
                        Icons.settings,
                        color: Color(0xff2a2c45),
                      ),
                    ),
                  ],
                ),
                Center(
                    child: Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Text("Animation",
                      style: GoogleFonts.akayaKanadaka(fontSize: 25)),
                )),
                const SizedBox(
                  height: 20,
                ),
                FadeInDown(
                  child: Container(
                    height: 500,
                    width: MediaQuery.of(context).size.width,
                    child: Cube(
                      onSceneCreated: ((Scene scene) {
                        personView!.children;
                        personView!.backfaceCulling;
                        personView!.lighting;
                        scene.world.add(personView!);
                        scene.camera.zoom = 5;
                      }),
                    ),
                  ),
                ),

                /////////button/////////
                CustomeBtn()
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget CustomeBtn() {
  return Center(
    child: InkWell(
      onTap: () {
        print("object ------> ");
      },
      child: Container(
        height: 50,
        width: 130,
        // ignore: sort_child_properties_last
        child: Center(
          child: Text(
            "Click",
            style: GoogleFonts.poppins(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: Colors.white.withOpacity(0.5),
            ),
          ),
        ),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            begin: Alignment.bottomCenter,
            colors: [
              Color(0xff2a2c45),
              Color(0xff2a2c45),
            ],
          ),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
            bottomLeft: Radius.circular(15),
          ),
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(61, 255, 255, 255).withOpacity(0.2),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
      ),
    ),
  );
}
