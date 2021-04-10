import 'package:chat_ui/models/message_model.dart';
import 'package:chat_ui/models/user_model.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  final User user;

  ChatScreen({this.user});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {

  _buildMessage(Message message,bool isMe){
    final Container msg =  Container(
      width: MediaQuery.of(context).size.width * 0.75,
      decoration: BoxDecoration(
        color:isMe ? Theme.of(context).accentColor : Color(0xffFFEFEE),
        borderRadius: BorderRadius.all(Radius.circular(25.0)),
      ),
      padding: EdgeInsets.symmetric(horizontal: 25,vertical: 15.0),
      margin: isMe ? EdgeInsets.only(top : 8.0,bottom: 8.0,left: 80.0) : EdgeInsets.only(top:8.0,bottom: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(message.time,
            style: TextStyle(
                color: Colors.blueGrey,
                fontSize: 16,
                fontWeight: FontWeight.w600
            ),),
          SizedBox(height: 8.0,),
          Text(message.text,
              style: TextStyle(
                  color: Colors.blueGrey,
                  fontSize: 16,
                  fontWeight: FontWeight.w600)
          ),
        ],
      ),
    );

    if(isMe){
      return msg;
    }

    return Row(
      children: [
        msg,
        IconButton(
          icon: message.isLiked ? Icon(Icons.favorite) : Icon(Icons.favorite_border),
          onPressed: () {},
          iconSize: 30,
          color: message.isLiked ? Theme.of(context).primaryColor : Colors.blueGrey,
        ),
      ],
    );
  }

  _buildMessageComposer(){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      height: 70,
      color: Colors.white,
      child: Row(
        children: [
          IconButton(icon: Icon(Icons.photo), onPressed: (){}, iconSize: 25,color: Theme.of(context).primaryColor,),
          Expanded(child: TextField(
            decoration: InputDecoration.collapsed(
              hintText: 'Send a Message'
            ),
          )),
          IconButton(icon: Icon(Icons.send), onPressed: (){}, iconSize: 25,color: Theme.of(context).primaryColor,)
        ],
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        elevation: 0,
        title: Text(widget.user.name,
        style: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.w600,
        ),),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.more_horiz),
            onPressed: () {},
            iconSize: 30,
            color: Colors.white,
          ),
        ],
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),//Click anywhere and the keyboard should disappear
        child: Column(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30)),
                  color: Colors.white,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30)),
                  child: ListView.builder(
                    reverse: true, //reversing the order of the widgets
                    padding: EdgeInsets.only(top: 15),
                    itemCount: messages.length,
                    itemBuilder: (BuildContext context,int index){
                      final Message message = messages[index];
                      final bool isMe = message.sender.id == currentUser.id;
                      return _buildMessage(message,isMe);
                    },
                  ),
                ),
              ),
            ),
            _buildMessageComposer(),
          ],
        ),
      ),
    );
  }
}
