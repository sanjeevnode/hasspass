import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hashpass/src/core/core.dart';
import 'package:hashpass/src/domain/domain.dart';
import 'package:hashpass/src/ui/routes/app_router.dart';

class App extends StatelessWidget {
  const App({
    super.key,
    required AppCubit appCubit,
  }) : _appCubit = appCubit;

  final AppCubit _appCubit;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AppCubit>.value(value: _appCubit),
      ],
      child: const _AppView(),
    );
  }
}

class _AppView extends StatefulWidget {
  const _AppView();

  @override
  State<_AppView> createState() => _AppViewState();
}

class _AppViewState extends State<_AppView> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(builder: (context, state) {
      return MaterialApp(
        scaffoldMessengerKey: Toast.scaffoldKey,
        theme: AppTheme.standard,
        title: 'HashPass',
        debugShowCheckedModeBanner: false,
        builder: (context, widget) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(
              textScaler: TextScaler.noScaling,
            ),
            child: Stack(
              children: [
                ScrollConfiguration(
                  behavior: const ScrollBehaviorModified(),
                  child: widget!,
                ),
              ],
            ),
          );
        },
        onGenerateRoute: AppRouter.onGenerateRoute,
        home: const Placeholder(),
      );
    });
  }
}
