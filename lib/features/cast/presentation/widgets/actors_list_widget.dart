import 'package:cinemahub/core/enums/usecase_status.dart';
import 'package:cinemahub/features/cast/presentation/cubit/cast_cubit.dart';
import 'package:cinemahub/features/cast/presentation/cubit/cast_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/widgets/horizontal_list_view.dart';
import '../../domain/entities/actor.dart';
import 'actor_widget.dart';

class ActorsListWidget extends StatelessWidget {
  const ActorsListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return HorizontalListView<CastCubit, CastState, Actor>(
      mapState: (state) => state.when(
        initial: () => (status: UsecaseStatus.initial, error: null, items: const []),
        loading: () => (status: UsecaseStatus.loading, error: null, items: const []),
        success: (actors) => (status: UsecaseStatus.success, error: null, items: actors),
        error: (error) => (status: UsecaseStatus.failure, error: error, items: const []),
      ),
      sectionTitle: "Cast",
      height: 230.h,
      itemSpacing: 32.w,
      itemBuilder: (item) => ActorWidget(item),
      skeleton: ActorWidget.skeleton(),
    );
  }
}
