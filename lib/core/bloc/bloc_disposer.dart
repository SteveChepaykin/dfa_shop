import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

typedef BlocCreator<T extends Bloc> = T Function(BuildContext context);

typedef Builder<T extends Bloc> = Widget Function(BuildContext context, T bloc);

class BlocDisposer<T extends Bloc> extends StatefulWidget {
  const BlocDisposer({
    super.key,
    required this.create,
    required this.builder,
  });

  final BlocCreator<T> create;
  final Builder<T> builder;

  @override
  State<BlocDisposer<T>> createState() => _BlocDisposerState<T>();
}

class _BlocDisposerState<T extends Bloc> extends State<BlocDisposer<T>> {
  late final T bloc;

  @override
  void initState() {
    bloc = widget.create(context);
    super.initState();
  }

  @override
  void dispose() {
    bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(context, bloc);
  }
}
