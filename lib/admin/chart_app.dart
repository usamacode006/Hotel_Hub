import 'package:flutter/material.dart';
import 'package:hotel_hub/admin/admin_categories.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final chatMsgTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.redAccent),
        elevation: 0,
        bottom: PreferredSize(
          preferredSize: Size(25, 2),
          child: Container(
            child: LinearProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              backgroundColor: Colors.lightGreen[100],
            ),
            decoration: BoxDecoration(
              // color: Colors.blue,

              // borderRadius: BorderRadius.circular(20)
            ),
            constraints: BoxConstraints.expand(height: 1),
          ),
        ),
        backgroundColor: Colors.white10,
        // leading: Padding(
        //   padding: const EdgeInsets.all(12.0),
        //   child: CircleAvatar(backgroundImage: NetworkImage('https://cdn.clipart.email/93ce84c4f719bd9a234fb92ab331bec4_frisco-specialty-clinic-vail-health_480-480.png'),),
        // ),
        title: Center(
          child: Text(
            'Message',
            style: TextStyle(
                fontFamily: 'Poppins', fontSize: 20, color: Colors.redAccent),
          ),
        ),
        leading: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AdminCategories()),
            );
          },
          child: Icon(Icons.arrow_back_ios_sharp),
        ),
        actions: <Widget>[
          GestureDetector(
            child: Padding(
              padding: EdgeInsets.only(right: 24.0),
              child: Icon(
                Icons.keyboard_backspace,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          //UserChatStream(),
          Container(
            padding: EdgeInsets.symmetric(vertical: 80, horizontal: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: Material(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.white,
                    elevation: 5,
                    child: Padding(
                      padding:
                      const EdgeInsets.only(left: 8.0, top: 2, bottom: 2),
                      child: TextField(
                        onChanged: (value) {
                          //messageText = value;
                        },
                        controller: chatMsgTextController,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 20.0),
                          hintText: 'Type your message here...',
                          hintStyle:
                          TextStyle(fontFamily: 'Poppins', fontSize: 14),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                ),
                MaterialButton(
                    shape: CircleBorder(),
                    color: Colors.redAccent,
                    onPressed: () {
                      chatMsgTextController.clear();
                      // _firestore
                      //     .collection('User')
                      //     .doc(FirebaseAuth.instance.currentUser!.uid)
                      //     .collection('messages')
                      //     .add({
                      //   'assignWorkerEmail': assignWorkerEmail,
                      //   'text': messageText,
                      //   'timestamp': DateTime.now().millisecondsSinceEpoch,
                      //   'senderEmail': email
                      // });
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Icon(
                        Icons.send,
                        color: Colors.white,
                      ),
                    )
                  // Text(
                  //   'Send',
                  //   style: kSendButtonTextStyle,
                  // ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
//
// class UserChatStream extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder<QuerySnapshot>(
//       stream: _firestore
//           .collection('User')
//           .doc(FirebaseAuth.instance.currentUser!.uid)
//           .collection('messages')
//           .orderBy('timestamp')
//           .snapshots(),
//       builder: (context, snapshot) {
//         if (snapshot.hasData) {
//           final messages = snapshot.data!.docs.reversed;
//           List<UserMessageBubble> messageWidgets = [];
//           for (var message in messages) {
//             final msgText = message.get('text');
//             final msgSender = message.get('senderEmail');
//             // final msgSenderEmail = message.data['senderemail'];
//             final currentUser = loggedInUser.email;
//             // print('MSG'+msgSender + '  CURR'+currentUser);
//             final msgBubble = UserMessageBubble(
//               msgText: msgText,
//               msgSender: msgSender,
//               user: currentUser == msgSender,
//             );
//             messageWidgets.add(msgBubble);
//           }
//           return Expanded(
//             child: ListView(
//               reverse: true,
//               padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
//               children: messageWidgets,
//             ),
//           );
//         } else {
//           return Center(
//             child:
//             CircularProgressIndicator(backgroundColor: Colors.lightGreen),
//           );
//         }
//       },
//     );
//   }
// }

class UserMessageBubble extends StatelessWidget {
  final String msgText;
  final String msgSender;
  final bool user;
  const UserMessageBubble(
      {required this.msgText, required this.msgSender, required this.user});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Column(
        crossAxisAlignment:
        user ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              // msgSender,
              '',
              style: TextStyle(
                  fontSize: 13, fontFamily: 'Poppins', color: Colors.black87),
            ),
          ),
          Material(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(50),
              topLeft: user ? Radius.circular(50) : Radius.circular(0),
              bottomRight: Radius.circular(50),
              topRight: user ? Radius.circular(0) : Radius.circular(50),
            ),
            color: user ? Colors.redAccent : Colors.white,
            elevation: 5,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Text(
                msgText,
                style: TextStyle(
                  color: user ? Colors.white : Colors.redAccent,
                  fontFamily: 'Poppins',
                  fontSize: 15,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


