import 'package:listinha/src/shared/models/configuration_model.dart';
import 'package:listinha/src/shared/models/task_model.dart';
import 'package:realm/realm.dart';

class RealmService {}

LocalConfiguration config = Configuration.local(
  [
    ConfigurationModel.schema,
    Task.schema,
    TaskBoard.schema,
  ],
  initialDataCallback: (realm) {
    realm.add(ConfigurationModel('system'));
  },
  path: './relm/realm.db',
);
