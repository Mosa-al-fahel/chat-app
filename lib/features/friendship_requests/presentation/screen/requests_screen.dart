import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:whishing/core/helper/extenstion.dart';
 import 'package:whishing/core/themes/textstyles.dart';
import 'package:whishing/features/friendship_requests/presentation/widget/requests_bloc_builder.dart';

class RequestsScreen extends StatelessWidget {
  const RequestsScreen({super.key});

  @override
  Widget build(context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () => context.pop(false),
              icon: Icon(
                Icons.arrow_back_ios,
                color: Theme.of(context).colorScheme.onTertiary,
                size: 35.r,
                
              )),
          title: Text(
            'Requests for you',
            style: TextStyles.blackFont18Medium.copyWith(color: Theme.of(context).colorScheme.onTertiary),
          ),
        ),
        body: const RequestsBlocBuilder());
    // body: const SafeArea(
    //   child: RequestsBlocBuilder(),
    // ));
  }
}
