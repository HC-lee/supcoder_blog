import 'package:supcoder_blog/entity/user_entity.dart';

import 'package:flutter/material.dart';

class UserCardView extends StatefulWidget {
  final UserEntity userEntity;

  UserCardView(this.userEntity);

  @override
  State<StatefulWidget> createState() {
    return _UserCardViewState(userEntity);
  }
}


class _UserCardViewState extends State<UserCardView>{
  UserEntity userEntity;

  _UserCardViewState(this.userEntity);

  @override
  void initState() {
    super.initState();
    new Future.delayed(const Duration(seconds: 1),(){
      setState(() {
        userEntity.name = "变了";
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      //四周10大小外边距
      margin: EdgeInsets.all(10.0),
      height: 120.0,
      width: 500.0,
      decoration: new BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(6)),
        color: Colors.white,
        border: new Border.all(color: Colors.amber,width: 0.3)
      ),

      child: Text(userEntity.name),
    );
  }
}