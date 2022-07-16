import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'navigationbar_provider.dart';

class BottomNavigationBarGm extends StatefulWidget {
  const BottomNavigationBarGm({Key? key}) : super(key: key);

  @override
  _BottomNavigationBarGmState createState() => _BottomNavigationBarGmState();
}

class _BottomNavigationBarGmState extends State<BottomNavigationBarGm> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width,
      height: 80,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // CustomPaint(
          //   size: Size(size.width, 80),
          //   painter: BNBCustomPainter(),
          // ),
          // Center(
          //   heightFactor: 0.6,
          //   child: FloatingActionButton(
          //       backgroundColor: Colors.lightGreen,
          //       child: Image.asset('images/recyle_logo2.jpg'),
          //       elevation: 0.1,
          //       onPressed: () {
          //         context.read<BottomNavigationProvider>().setCotrollervalue();
          //
          //         Navigator.push(
          //           context,
          //           MaterialPageRoute(
          //               builder: (context) => ChoosePlasticAndCalculate()),
          //         );
          //
          //       }),
          // ),
          Container(
            width: size.width,
            height: 80,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
                //color: Colors.lightGreen,
                color: Color(0xFFF1F3F4),
                boxShadow: const [
                  BoxShadow(offset: Offset(0, -1), blurRadius: 1),
                ]),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Consumer<NavProvider>(
                  builder: (context, notifier, child) => IconButton(
                    icon: Icon(
                      Icons.home,
                      color: notifier.selectedIndex == 0
                          ? Colors.redAccent
                          : Colors.grey.shade400,
                    ),
                    onPressed: () {
                      // setBottomBarIndex(0);
                      context.read<NavProvider>().onItemTapped(0);
                      context.read<NavProvider>().navToGM(context);
                    },
                    splashColor: Colors.white,
                  ),
                ),
                Consumer<NavProvider>(
                  builder: (context, notifier, child) => IconButton(
                      icon: Icon(
                        Icons.add_box,
                        color: notifier.selectedIndex == 1
                            ? Colors.redAccent
                            : Colors.grey.shade400,
                      ),
                      onPressed: () {
                        //setBottomBarIndex(1);
                        context.read<NavProvider>().onItemTapped(1);
                        context.read<NavProvider>().navToGM(context);
                      }),
                ),
                // Container(
                //   width: size.width * 0.20,
                // ),
                Consumer<NavProvider>(
                  builder: (context, notifier, child) => IconButton(
                      icon: Icon(
                        Icons.person,
                        color: notifier.selectedIndex == 2
                            ? Colors.redAccent
                            : Colors.grey.shade400,
                      ),
                      onPressed: () {
                        //setBottomBarIndex(2);
                        context.read<NavProvider>().onItemTapped(2);
                        context.read<NavProvider>().navToGM(context);
                      }),
                ),
                Consumer<NavProvider>(
                  builder: (context, notifier, child) => IconButton(
                      icon: Icon(
                        Icons.delete_forever,
                        color: notifier.selectedIndex == 3
                            ? Colors.redAccent
                            : Colors.grey.shade400,
                      ),
                      onPressed: () {
                        //setBottomBarIndex(3);
                        context.read<NavProvider>().onItemTapped(3);
                        context.read<NavProvider>().navToGM(context);
                      }),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
