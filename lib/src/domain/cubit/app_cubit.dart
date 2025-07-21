import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hashpass/src/domain/domain.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit({
    required UserRepository userRepository,
  })  : _userRepository = userRepository,
        super(const AppState());

  final UserRepository _userRepository;

  Future<void> init() async {}
}
