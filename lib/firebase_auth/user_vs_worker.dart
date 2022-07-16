import 'package:flutter/material.dart';
import 'package:hotel_hub/admin/categories.dart';
import 'package:hotel_hub/auth_screens/register.dart';



class UserVsWorker extends StatefulWidget {
  const UserVsWorker({Key? key}) : super(key: key);

  @override
  _UserVsWorkerState createState() => _UserVsWorkerState();
}

class _UserVsWorkerState extends State<UserVsWorker> {
  @override
  double hei=0;
  double wid=0;
  @override
  Widget build(BuildContext context) {
    hei=MediaQuery.of(context).size.height;
    wid=MediaQuery.of(context).size.width;
    print(hei);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              InkWell(
                onTap: () {

                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Register(" ","User")),
                  );
                },
                child: Card(

                  shape: RoundedRectangleBorder(
                      side: BorderSide(
                          color: Colors.redAccent
                      )
                  ),
                  child: Column(
                    children: [
                      Image.asset('images/user.jpg',
                        height: hei/2.466,
                        fit: BoxFit.contain,
                      ),

                      Text('Continue as a User',
                        style: TextStyle(
                            fontSize: 25,
                            color: Colors.redAccent
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Categories()),
                  );
                },
                child: Card(
                  shape: RoundedRectangleBorder(
                      side: BorderSide(
                          color: Colors.redAccent
                      )
                  ),
                  child: Column(
                    children: [
                      Image.asset('images/worker.jpg',
                        height: hei/2.466,
                        fit: BoxFit.contain,
                      ),

                      Text('Continue as a Worker',
                        style: TextStyle(
                            fontSize: 25,
                            color: Colors.redAccent
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
