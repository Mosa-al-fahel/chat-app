import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whishing/features/home/presentation/cubit/home_page_cubit.dart';
import 'package:whishing/features/home/presentation/widgets/failure_view.dart';
import 'package:whishing/features/home/presentation/widgets/suggusted_people/exploring_loading_view.dart';
import 'package:whishing/features/home/presentation/widgets/suggusted_people/suggestied_people_list.dart';

class SuggestionBlocBuilder extends StatelessWidget {
  const SuggestionBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomePageCubit, HomePageStates>(
        builder: (context, state) {
      return AnimatedSwitcher(
          transitionBuilder: (child, animation) =>
              ScaleTransition(scale: animation, child: child),
          switchInCurve: Curves.easeOutExpo,
          duration: const Duration(milliseconds: 450),
          child: _buildAnimiatedSwitcher(state, context));
    });
  }
}

Widget _buildAnimiatedSwitcher(HomePageStates state, BuildContext context) {
  switch (state.suggestedState) {
    case PageStates.loading:
      return exploredPeopleloadingView(context);
    case PageStates.failure:
      return notifyDialog(
          state.suggustedError!.message!, 'FAILED_TO_EXPLORE', context);
    case PageStates.success:
      return SuggustedPeopleList(suggestionsList: state.suggustedList);
    default:
      return const SizedBox.shrink();
  }
}

class SuggestionGridBlocBuilder extends StatelessWidget {
  const SuggestionGridBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomePageCubit, HomePageStates>(
        builder: (context, state) {
      if (state.suggestedState == PageStates.success) {
        return SuggustedPeopleGrid(suggestionsList: state.suggustedList);
      }
      if (state.suggestedState == PageStates.loading) {
        return exploredPeopleloadingGridView();
      }
      if (state.suggestedState == PageStates.emptySearch) {
        return SizedBox.shrink();
      }
      return SizedBox.shrink();
    });
  }
}
