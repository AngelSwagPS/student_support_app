// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:student_support_app/login_page.dart';
import 'colors.dart' as color;
import 'components/mybutton.dart';

class StudentDetails{
  final String? studentId;
  final String? userName;
  final String? userEmail;
  final String? year;
  final String? classCode;
  final String? isAdmin;

  const StudentDetails({
    required this.studentId,
    required this.userName,
    required this.userEmail,
    required this.year,
    required this.classCode,
    required this.isAdmin,
  });
}

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
late Future<String?> studentName;
late Future<StudentDetails?> student0Details;

  @override
  void initState()  {
    super.initState();

    studentName = getStudentName();
    student0Details = getStudentDetails();
  }

  Future<void> removeSavedData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.clear();
  }

  void signUserOut(BuildContext context) {
     removeSavedData();
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LoginPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: color.AppColor.homePageBackground,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: color.AppColor.fontColor,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        color: color.AppColor.homePageBackground,
        padding: EdgeInsets.only(left: 15, right: 15),
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //PROFILE IMAGE
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Container(
                width: 180,
                height: 180,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle, // set the shape to circle
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(
                      100), // set the border radius to half of the container size
                  child: Image.asset(
                    'assets/images/profileImage.jpg',
                    fit: BoxFit.cover, // scale the image to cover the container
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            //UserName
            FutureBuilder <StudentDetails?>(
              future: student0Details,
              builder: ((context, snapshot){
                if(snapshot.hasData){
                  StudentDetails? student0Details = snapshot.data;
                  return SizedBox(
                    height: 340,
                    child: Card(
                          margin: EdgeInsets.all(5.0),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                          color: color.AppColor.cardColor,
                          child: ListView(
                            scrollDirection: Axis.vertical,
                            children: [
                              ListTile(
                                title: Text('Username',
                                    style: TextStyle(
                                    decoration: TextDecoration.none,
                                    fontSize: 17,
                                    fontFamily: 'SFProLight',
                                    color: color.AppColor.fontColor)),
                                dense: true,
                                visualDensity: VisualDensity(vertical: 2),
                                subtitle: Text(student0Details!.userName.toString(),
                                    style: TextStyle(
                                    decoration: TextDecoration.none,
                                    fontSize: 14,
                                    fontFamily: 'SFProLight',
                                    color: color.AppColor.fontColor)),
                              ),
                              Divider(color: color.AppColor.supportingText),
                              ListTile(
                                title: Text('User-email',
                                    style: TextStyle(
                                    decoration: TextDecoration.none,
                                    fontSize: 17,
                                    fontFamily: 'SFProLight',
                                    color: color.AppColor.fontColor)),
                                dense: true,
                                visualDensity: VisualDensity(vertical: 2),
                                subtitle: Text(student0Details.userEmail.toString(),
                                    style: TextStyle(
                                        decoration: TextDecoration.none,
                                        fontSize: 14,
                                        fontFamily: 'SFProLight',
                                        color: color.AppColor.fontColor)),
                              ),
                              Divider(color: color.AppColor.supportingText),
                              ListTile(
                                title: Text('Year',
                                    style: TextStyle(
                                    decoration: TextDecoration.none,
                                    fontSize: 17,
                                    fontFamily: 'SFProLight',
                                    color: color.AppColor.fontColor)),
                                dense: true,
                                visualDensity: VisualDensity(vertical: 2),
                                subtitle: Text(student0Details.year.toString(),
                                    style: TextStyle(
                                    decoration: TextDecoration.none,
                                    fontSize: 14,
                                    fontFamily: 'SFProLight',
                                    color: color.AppColor.fontColor)),
                              ),
                              Divider(color: color.AppColor.supportingText),
                              ListTile(
                                title: Text('Class code',
                                    style: TextStyle(
                                    decoration: TextDecoration.none,
                                    fontSize: 17,
                                    fontFamily: 'SFProLight',
                                    color: color.AppColor.fontColor)),
                                dense: true,
                                visualDensity: VisualDensity(vertical: 2),
                                subtitle: Text(student0Details.classCode.toString(),
                                    style: TextStyle(
                                    decoration: TextDecoration.none,
                                    fontSize: 14,
                                    fontFamily: 'SFProLight',
                                    color: color.AppColor.fontColor)),
                              ),
                              Divider(color: color.AppColor.supportingText),
                              ListTile(
                                title: Text('StudentID',
                                    style: TextStyle(
                                    decoration: TextDecoration.none,
                                    fontSize: 17,
                                    fontFamily: 'SFProLight',
                                    color: color.AppColor.fontColor)),
                                dense: true,
                                visualDensity: VisualDensity(vertical: 2),
                                subtitle: Text(student0Details.studentId.toString(),
                                    style: TextStyle(
                                    decoration: TextDecoration.none,
                                    fontSize: 14,
                                    fontFamily: 'SFProLight',
                                    color: color.AppColor.fontColor)),
                              ),
                            ],
                          ),
                        ),
                  );
                }else if(snapshot.hasError){
                  //WHat happens when error
                  return Text(
                    "Hi There,",
                    style: TextStyle(
                        decoration: TextDecoration.none,
                        fontFamily: 'SFProLight',
                        fontSize: 20,
                        color: color.AppColor.fontColor),
                  );
                }
                //What happens while loading
                return Text(
                  "Hello",
                  style: TextStyle(
                      decoration: TextDecoration.none,
                      fontFamily: 'SFProLight',
                      fontSize: 30,
                      color: color.AppColor.fontColor),
                );
              }),

            ),
            SizedBox(
              height: 50,
            ),
            GestureDetector(
              onTap: () => signUserOut(context),
              child: Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      padding:
                          EdgeInsets.symmetric(vertical: 23, horizontal: 20),
                      decoration: BoxDecoration(
                        color: color.AppColor.cardColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.logout,
                            color: Colors.blueAccent,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Logout",
                            style: TextStyle(
                              fontFamily: 'SFProRegular',
                              fontSize: 17,
                              color: color.AppColor.fontColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

Future<String?> getStudentName() async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  String? name =  sharedPreferences.getString('username');
  print(name);
  print("GOt Name");
  return name;
}

Future<StudentDetails?> getStudentDetails() async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  String? user0Name =  sharedPreferences.getString('username');
  String? user0Email =  sharedPreferences.getString('userEmail');
  String? year0 =  sharedPreferences.getString('year');
  String? class0Code =  sharedPreferences.getString('classCode');
  String? is0Admin =  sharedPreferences.getString('isAdmin');
  String? student0Id =  sharedPreferences.getString('studentId');

  StudentDetails student = StudentDetails(
      studentId: student0Id,
      userName: user0Name,
      year: year0,
      classCode: class0Code,
      isAdmin: is0Admin,
      userEmail: user0Email
  );

  return student;
}

}
