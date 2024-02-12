import 'package:flutter_nfc_task/base/base_bloc.dart';
import 'package:rxdart/rxdart.dart';

class DashboardMainBloc extends BaseBloc {
  final selectedIndexSubject = BehaviorSubject<int>.seeded(0);
}
