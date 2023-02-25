import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zw_/base/bloc_provider/base_state.dart';

abstract class BaseCubit<T extends BaseState> extends Cubit<T>{
  BaseCubit(T t) : super(t);

}