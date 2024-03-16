import 'package:dio_json/models/user_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../dataprovider/data_provider.dart';

class MyHomePage extends ConsumerWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final _data = ref.watch(userDataProider);
    return Scaffold(
      appBar: AppBar(
        title: Text("riverpod"),
      ),
      body: _data.when(
          data: (_data) {
            List<UserModel> userList = _data.map((e) => e).toList();
            return Column(
              children: [
                Expanded(
                    child: ListView.builder(
                        itemCount: userList.length,
                        itemBuilder: (_, index) {
                          return Card(
                            color: Colors.blue,
                            elevation: 4,
                            margin: EdgeInsets.symmetric(vertical: 10),
                            child: ListTile(
                              title: Text(
                                userList[index].firstname,
                                style: const TextStyle(color: Colors.white),
                              ),
                              subtitle: Text(
                                userList[index].lastname,
                                style: const TextStyle(color: Colors.white),
                              ),
                              trailing: CircleAvatar(
                                backgroundImage:
                                    NetworkImage(userList[index].avatar),
                              ),
                            ),
                          );
                        }))
              ],
            );
          },
          error: (err, s) => Text(err.toString()),
          loading: () => const Center(
                child: CircularProgressIndicator(),
              )),
    );
  }
}
