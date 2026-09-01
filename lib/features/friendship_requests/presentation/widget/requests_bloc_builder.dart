import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whishing/core/widgets/states/dialog_display.dart';
import 'package:whishing/features/friendship_requests/presentation/cubit/requests_cubit.dart';
import 'package:whishing/features/friendship_requests/presentation/widget/requests_state_view.dart';

class RequestsBlocBuilder extends StatelessWidget {
  const RequestsBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RequestsCubit, RequestsState>(
        builder: (context, state) => AnimatedSwitcher(
              transitionBuilder: (child, animation) =>
                  ScaleTransition(scale: animation, child: child),
              switchInCurve: Curves.easeOutExpo,
              duration: const Duration(milliseconds: 450),
              child: _buildAnimatedSwitcher(state, context),
            ));
  }
}

Widget _buildAnimatedSwitcher(RequestsState state, BuildContext context) {
  switch (state.pageState) {
    case RequestsPageState.loading:
      return loadingRequestsView();
    case RequestsPageState.success:
      return RequestsList(requestsList: state.requestsList);
    case RequestsPageState.empty:
      return emptyRequestsView(context);
    case RequestsPageState.failure:
      return GlobalDialogDisplay(
        text: state.getRequestsError!.message!,
        isItError: true,
      );
    default:
      return const SizedBox.shrink();
  }
}
