import 'package:agrilink/features/user_auth/presentation/widgets/chatDetailPage.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  final String receiverUserEmail;
  const ChatPage({
    super.key,
    required this.receiverUserEmail,
  });

  @override
  State<ChatPage> createState() => _ChatPageState();
}

// List<ChatMessage> messages = [
//   ChatMessage(messageContent: "Hello, Will", messageType: "receiver"),
//   ChatMessage(messageContent: "How have you been?", messageType: "receiver"),
//   ChatMessage(
//       messageContent: "Hey Kriss, I am doing fine dude. wbu?",
//       messageType: "sender"),
//   ChatMessage(messageContent: "ehhhh, doing OK.", messageType: "receiver"),
//   ChatMessage(
//       messageContent: "Is there any thing wrong?", messageType: "sender"),
// ];

class _ChatPageState extends State<ChatPage> {
  final user = FirebaseAuth.instance.currentUser!;

  //sign user out method
  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                // topLeft: Radius.circular(5),
                // topRight: Radius.circular(5),
                bottomRight: Radius.circular(10))),
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: const Color.fromARGB(255, 141, 201, 170),
        flexibleSpace: SafeArea(
          child: Container(
            padding: const EdgeInsets.only(right: 16),
            child: Row(
              children: <Widget>[
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(
                  width: 2,
                ),
                const CircleAvatar(
                  backgroundImage: AssetImage("assets/images/profile.png"),
                  maxRadius: 20,
                ),
                const SizedBox(
                  width: 12,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        widget.receiverUserEmail,
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Text(
                        "Online",
                        style: TextStyle(
                            color: Colors.grey.shade600, fontSize: 13),
                      ),
                    ],
                  ),
                ),
                const Icon(
                  Icons.call,
                  color: Colors.black54,
                ),
              ],
            ),
          ),
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 210, 230, 215),
      body: Stack(
        children: <Widget>[
          ListView.builder(
            itemCount: messages.length,
            shrinkWrap: true,
            padding: const EdgeInsets.only(top: 10, bottom: 10),
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return Container(
                padding: const EdgeInsets.only(
                    left: 14, right: 14, top: 10, bottom: 10),
                child: Align(
                  alignment: (messages[index].messageType == "receiver"
                      ? Alignment.topLeft
                      : Alignment.topRight),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: (messages[index].messageType == "receiver"
                          ? Colors.grey.shade200
                          : Colors.blue[200]),
                    ),
                    padding: const EdgeInsets.all(16),
                    child: Text(
                      messages[index].messageContent,
                      style: const TextStyle(fontSize: 15),
                    ),
                  ),
                ),
              );
            },
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              padding: const EdgeInsets.only(left: 10, bottom: 10, top: 10),
              height: 60,
              width: double.infinity,
              color: Colors.white,
              child: Row(
                children: <Widget>[
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        color: Colors.lightBlue,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: const Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  const Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                          hintText: "Write message...",
                          hintStyle: TextStyle(color: Colors.black54),
                          border: InputBorder.none),
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  FloatingActionButton(
                    onPressed: () {},
                    backgroundColor: Colors.blue,
                    elevation: 0,
                    child: const Icon(
                      Icons.send,
                      color: Colors.white,
                      size: 18,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}



// ListView.builder(
//               itemCount: chatUsers.length,
//               shrinkWrap: true,
//               padding: const EdgeInsets.only(top: 16),
//               physics: const NeverScrollableScrollPhysics(),
//               itemBuilder: (context, index) {
//                 return ConversationList(
//                   name: chatUsers[index].name,
//                   messageText: chatUsers[index].messageText,
//                   imageUrl: chatUsers[index].imagePath,
//                   time: chatUsers[index].time,
//                   isMessageRead: (index == 0 || index == 3) ? true : false,
//                 );
//               },
//             ),



//chat risiri kushanda
  // // build message list
  // Widget _buildMessageList(){
  //   return StreamBuilder(stream: _chatService.getMessages(widget.receiverUserID, _auth.currentUser!.uid),
  //   builder: (context, snapshot){
  //     if (snapshot.hasError){
  //       return Text('Error${snapshot.error}');
  //     }
  //     if (snapshot.connectionState == ConnectionState.waiting){
  //       return const Text('Loading...');
  //     }

  //     return ListView(
  //       children: snapshot.data!.docs
  //       .map((document) => _buidMessageItem(document))
  //       .toList(),
  //       );
  //   });
  // }

  // //build message item
  // Widget _buidMessageItem(DocumentSnapshot document){
  //   Map<String, dynamic> data = document.data() as Map<String, dynamic>;

  //   //align message to left or right depending on sender
  //   var alignment = (data['senderId'] == _auth.currentUser!.email) ? Alignment.centerRight : Alignment.centerLeft;

  //   return Container (alignment: alignment,
  //   child: Column(children: [
  //     Text(data['message']),
  //   ]),);
    
  // }

  // //build message input
  // Widget _buildMessageInput(){
  //   return Row(children: [
  //     // textfield
  //     Expanded(child: MyTextField(
  //       controller: _messageController, 
  //       hintText: "Type a message", obscureText: false,
  //       ),
  //     ),

  //     //send button
  //     IconButton(
  //       onPressed: sendMessage,
  //       icon: const Icon(Icons.send,size: 30,),
  //       color: Colors.black,
        
  //     ),
  //   ],);
  // }
