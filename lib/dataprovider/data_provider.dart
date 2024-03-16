import 'package:dio_json/models/user_model.dart';
import 'package:dio_json/services/service.dart';
import 'package:riverpod/riverpod.dart';

final userDataProider = FutureProvider<List<UserModel>>((ref) async {
  return ref.watch(userProvider).getUsers();
});
