import 'package:chat_ui/models/message_model.dart';
import 'package:chat_ui/screens/chat_screen.dart';
import 'package:flutter/material.dart';

class RecentChats extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(30.0), topRight: Radius.circular(30.0))
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(30.0), topRight: Radius.circular(30.0)),
              child: ListView.builder(
                itemCount: chats.length,
                itemBuilder: (BuildContext context, int index){
                  final Message chat = chats[index];
                  return GestureDetector(
                    onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ChatScreen(user: chat.sender,))),
                    child: Container(
                      decoration: BoxDecoration(
                        color: chat.unread ? Color(0xffFFEFEE) : Colors.white,
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(20),
                          topRight: Radius.circular(20)
                        )
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                      margin: EdgeInsets.only(top: 5,bottom: 5,right: 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                radius: 35,
                                backgroundImage: AssetImage(chat.sender.imageUrl),
                              ),
                              SizedBox(width: 10,),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    chat.sender.name,
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15.0
                                  ),),
                                  SizedBox(height: 5.0,),
                                  Container(
                                    width: MediaQuery.of(context).size.width * 0.45,
                                    child: Text(
                                      chat.text,
                                      style: TextStyle(
                                        color: Colors.blueGrey,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15.0),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Text(chat.time,
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 15,
                                fontWeight: FontWeight.bold
                              ),),
                              SizedBox(height: 5,),
                              chat.unread ? Container(
                                width: 40,
                                height: 20,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30.0),
                                  color: Theme.of(context).primaryColor
                                ),
                                alignment: Alignment.center,
                                child: Text('new',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold
                                )),
                              ) : Text("")
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
        )
    );
  }
}
