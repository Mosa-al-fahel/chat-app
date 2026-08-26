import 'package:flutter/material.dart';
import 'package:whishing/core/domain/user_entity.dart';
import 'package:whishing/core/helper/extenstion.dart';
import 'package:whishing/core/routing/routs.dart';
import 'package:whishing/core/widgets/contact_structure.dart';

class ContactsList extends StatelessWidget {
  const ContactsList({super.key, required this.friendsList});
  final List<UserEntity> friendsList;

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
        itemBuilder: (context, index) => ContactStructure(
              userData: friendsList[index],
              isFriend: true,
              contactFunction: () => context.pushNamed(AppRoutes.chat,
                  arguments: friendsList[index]),
            ),
        itemCount: friendsList.length);
  }
}
