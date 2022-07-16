import 'package:flutter/material.dart';

class GmList extends StatefulWidget {
  const GmList({Key? key}) : super(key: key);

  @override
  _GmListState createState() => _GmListState();
}

class _GmListState extends State<GmList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(slivers: [
        SliverAppBar(
            backgroundColor: Colors.white,
            expandedHeight: 200,
            floating: true,
            pinned: true,

            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                'images/remind.jpg',
                fit: BoxFit.cover,
              ),
            ),
            // leading: IconButton(
            //   icon: Icon(Icons.arrow_back),
            //   onPressed: () {
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(builder: (context) => HomePage()),
            //     );
            //   },
            // ),
//           actions: [
//             Icon(Icons.settings),
//             SizedBox(width: 12),
//
// ]
          ),

        buildImages(context),
      ]),
      //bottomNavigationBar: BottomNavigationBarWorker(),
    );

  }

  Widget buildImages(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          Container(
            // height: MediaQuery
            //     .of(context)
            //     .size
            //     .height / 1.366,
            // width: MediaQuery
            //     .of(context)
            //     .size
            //     .width / 0.6,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
                //color: Colors.lightGreen,
                color: Color(0xFFF1F3F4),
                boxShadow: const [
                  BoxShadow(offset: Offset(0, -10), blurRadius: 25),
                ]),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                    child: Center(
                      child: Text(
                        'LIST',
                        style: TextStyle(
                            fontSize: 18,
                            letterSpacing: 1,
                            color: Colors.lightGreen),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8, 20, 0, 0),
                    child: Card(
                      color: Color(0xFFF4F5FC),
                      shape: RoundedRectangleBorder(
                        side: BorderSide(color: Colors.lightGreen, width: 1),
                      ),
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CircleAvatar(
                            child: Image.asset('images/male.png'),
                            backgroundColor: Colors.white,
                            radius: 40,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.height / 40.55,
                          ),
                          SizedBox(
                            width: 110,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  //margin: EdgeInsets.only(right: 120),
                                  child: Text(
                                    'Usama Ali',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.lightGreen),
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Container(
                                  //margin: EdgeInsets.only(left: 5),

                                  child: Text(
                                    '+92315678912',
                                    style: TextStyle(fontSize: 15),
                                  ),
                                ),
                                // SizedBox(
                                //   height: 20,
                                // )
                              ],
                            ),
                          ),
                          SizedBox(
                              width:40
                          ),

                          Container(
                            // margin: EdgeInsets.only(right: 20),

                            child: Flexible(
                              child: Column(
                                children: const [
                                  Text(
                                    'Attock',
                                    //textAlign: TextAlign.right,
                                    style: TextStyle(
                                        color: Colors.lightGreen,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  // Text('= 22.5Km'),
                                  // SizedBox(
                                  //   height: 20,
                                  // )
                                ],
                              ),
                            ),
                          ),
                          // SizedBox(
                          //   width: context
                          //       .read<DetailScreenProvider>()
                          //       .cart_screen_icon(
                          //           MediaQuery.of(context).size.height),
                          // ),
                          // Container(
                          //   alignment: Alignment.centerRight,
                          //   child: Icon(
                          //     Icons.delete_forever,
                          //     color: Colors.lightGreen,
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          ElevatedButton(onPressed:(){},
              child: Text('Logout'),

          )
        ],
      ),
    );
  }
}


