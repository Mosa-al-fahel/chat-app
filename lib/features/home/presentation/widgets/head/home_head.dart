import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:whishing/core/helper/extenstion.dart';
import 'package:whishing/core/widgets/field/global_form_field.dart';
import 'package:whishing/features/home/presentation/cubit/home_page_cubit.dart';

class HomeHead extends StatelessWidget {
  const HomeHead({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<HomePageCubit>();
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 6.w),
      child: Row(
        children: [
          IconButton(
              icon: Icon(
                Icons.notes_sharp,
                size: 34.r,
                color: Theme.of(context).colorScheme.tertiary,
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer();
                cubit.initDrawer();
              }),
          horizontalSpacing(2),
          Expanded(
            child: GlobalFormField(
                onChanged: (_) {
                  return cubit.filterContacts();
                },
                borderRadius: 16.r,
                highPadding: 4.h,
                hintText: 'search for contact',
                controller: cubit.searchController),
          ),
          horizontalSpacing(8),
          Icon(
            Icons.search,
            size: 34.r,
            color: Theme.of(context).colorScheme.tertiary,
          )
        ],
      ),
    );
  }
}
