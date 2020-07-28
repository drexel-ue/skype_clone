import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:skype_clone/resources/firebase/firebase_repository.dart';
import 'package:skype_clone/resources/firebase/firebase_repository_impl.dart';
import 'package:skype_clone/ui/widgets.dart/custom_app_bar.dart';
import 'package:skype_clone/ui/widgets.dart/custom_tile.dart';
import 'package:skype_clone/utils/skype_colors.dart';
import 'package:skype_clone/utils/utils.dart';

class ChatListScreen extends StatefulWidget {
  const ChatListScreen({Key key}) : super(key: key);

  @override
  _ChatListScreenState createState() => _ChatListScreenState();
}

class _ChatListScreenState extends State<ChatListScreen> {
  FirebaseRepository _firebaseRepository;
  String _currentUserId;
  String _initials = '';

  @override
  void initState() {
    super.initState();
    _firebaseRepository = FirebaseRepositoryImpl();
    _firebaseRepository.getCurrentUser().then((FirebaseUser user) {
      setState(() {
        _currentUserId = user.uid;
        _initials = Utils.getInitials(user.displayName);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SkypeColors.blackColor,
      appBar: _customAppBar(),
      body: _ChatListContainer(_currentUserId),
      floatingActionButton: NewChatButton(),
    );
  }

  CustomAppBar _customAppBar() {
    return CustomAppBar(
      leading: IconButton(
        icon: Icon(
          Icons.notifications,
          color: Colors.white,
        ),
        onPressed: () {},
      ),
      title: _UserCircle(_initials),
      centerTitle: true,
      actions: [
        IconButton(
          icon: Icon(
            Icons.search,
            color: Colors.white,
          ),
          onPressed: () {},
        ),
        IconButton(
          icon: Icon(
            Icons.more_vert,
            color: Colors.white,
          ),
          onPressed: () {},
        ),
      ],
    );
  }
}

class _UserCircle extends StatelessWidget {
  const _UserCircle(this.initials, {Key key}) : super(key: key);

  final String initials;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 40,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: SkypeColors.separatorColor,
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Text(
            initials,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: SkypeColors.lightBlueColor,
              fontSize: 13,
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Container(
              height: 12,
              width: 12,
              decoration: BoxDecoration(
                color: SkypeColors.onlineDotColor,
                shape: BoxShape.circle,
                border: Border.all(
                  color: SkypeColors.blackColor,
                  width: 2,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class NewChatButton extends StatelessWidget {
  const NewChatButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: SkypeColors.fabGradient,
        shape: BoxShape.circle,
      ),
      padding: const EdgeInsets.all(15),
      child: const Icon(
        Icons.edit,
        color: Colors.white,
        size: 25,
      ),
    );
  }
}

class _ChatListContainer extends StatefulWidget {
  _ChatListContainer(this.currentUserId, {Key key}) : super(key: key);

  final String currentUserId;

  @override
  __ChatListContainerState createState() => __ChatListContainerState();
}

class __ChatListContainerState extends State<_ChatListContainer> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(10),
      itemCount: 2,
      itemBuilder: (BuildContext context, int index) {
        return CustomTile(
          mini: false,
          onTap: () {},
          title: Text(
            'title',
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'Arial',
              fontSize: 19,
            ),
          ),
          subtitle: Text(
            'subtitle',
            style: TextStyle(
              color: SkypeColors.greyColor,
              fontSize: 19,
            ),
          ),
          leading: Container(
            constraints: BoxConstraints(maxHeight: 60, maxWidth: 60),
            child: Stack(
              alignment: Alignment.center,
              children: [
                CircleAvatar(
                  maxRadius: 30,
                  backgroundColor: Colors.green,
                  backgroundImage: NetworkImage('https://watchmojo.com/uploads/thumbs720/WM-Film-Top10-Funniest-Chucky-Moments_J2D6K9-3.jpg'),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    height: 12,
                    width: 12,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: SkypeColors.onlineDotColor,
                      border: Border.all(color: SkypeColors.blackColor, width: 2),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
