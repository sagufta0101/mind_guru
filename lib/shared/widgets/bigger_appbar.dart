import 'package:endurance_app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../model/profile_model.dart';

class OrangeAppbar extends StatelessWidget {
  Patient? profileInfo;
  OrangeAppbar({Key? key, this.profileInfo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        toolbarHeight: 150,
        shadowColor: Colors.grey.shade100,
        backgroundColor: CustomColors.elevatedButtonColor,
        elevation: 1,
        title: Column(
          children: [
            Text(
              'My Account',
              style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontWeight: FontWeight.normal,
                  fontSize: 14),
            ),
            SizedBox(
              height: 20,
            ),
            ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.person_outlined,
                  color: CustomColors.elevatedButtonColor,
                ),
                radius: 30,
              ),
              title: Text(
                profileInfo != null
                    ? "${profileInfo?.firstName} ${profileInfo?.lastName}"
                    : 'Dr. Ashwin',
                style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 16),
              ),
              subtitle: Text(
                profileInfo?.address ?? '9988726172',
                style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: 12),
              ),
              trailing: InkWell(
                onTap: () {
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //       builder: (context) => EditProfile(),
                  //     ));
                },
                child: Container(
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Icon(
                        Icons.edit_note_rounded,
                        color: Colors.white,
                      ),
                    )),
              ),
            ),
          ],
        ),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40))));
  }
}
