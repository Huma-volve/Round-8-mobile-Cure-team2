import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/base_state.dart';
import '../error/exceptions.dart';

class BaseBlocConsumer<B extends BlocBase<BaseState<S>>, S>
    extends StatelessWidget {
  final Widget Function(S? data)? builder;
  final Widget Function()? loadingBuilder;
  final Widget Function(S data)? successBuilder;
  final Widget Function(AppException error)? failureBuilder;
  final Widget Function()? emptyBuilder;
  final void Function(S? data)? onSuccess;
  final void Function()? onLoading;
  final void Function(AppException error)? onFailure;
  final void Function()? onEmpty;
  final B? bloc;

  const BaseBlocConsumer({
    super.key,
    this.bloc,
    this.builder,
    this.loadingBuilder,
    this.successBuilder,
    this.failureBuilder,
    this.emptyBuilder,
    this.onSuccess,
    this.onLoading,
    this.onFailure,
    this.onEmpty,
  });

  @override
  Widget build(BuildContext context) {
    final B cubit = bloc ?? context.read<B>();
    return BlocConsumer<B, BaseState<S>>(
      bloc: cubit,
      listener: (context, state) {
        if (state.isLoading && onLoading != null) {
          onLoading!();
        } else if (state.isSuccess && onSuccess != null) {
          onSuccess!(state.data);
        } else if (state.isFailure && onFailure != null) {
          onFailure!(state.error!);
        } else if (state.isEmpty && onEmpty != null) {
          onEmpty!();
        }
      },
      builder: (context, state) {
        if (builder != null) return builder!(state.data);

        if (state.isLoading) {
          return loadingBuilder?.call() ?? const SizedBox.shrink();
        }

        if (state.isSuccess && state.data != null) {
          return successBuilder?.call(state.data as S) ?? const SizedBox.shrink();
        }

        if (state.isFailure) {
          return failureBuilder?.call(state.error!) ?? const SizedBox.shrink();
        }

        if (state.isEmpty) {
          return emptyBuilder?.call() ?? const SizedBox.shrink();
        }

        return const SizedBox.shrink();
      },
    );
  }
}