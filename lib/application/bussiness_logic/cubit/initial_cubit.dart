import 'package:ader/application/presentation/routes/routes.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'initial_state.dart';
part 'initial_cubit.freezed.dart';

@injectable
class InitialCubit extends Cubit<InitialState> {
  FlutterSecureStorage secureStorage;
  InitialCubit(this.secureStorage) : super(const InitialState.initial());

  Future<String> nextScreenRoute() async {
    // final value = await secureStorage.read(key: 'token');
    // if (value == null) {
    //   return Routes.login;
    // } else {
      return Routes.bottomNavigation;
    
  }
}