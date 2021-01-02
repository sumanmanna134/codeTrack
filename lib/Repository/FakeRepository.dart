import 'package:code_track/Model/DataModel.dart';

class FakeRepository{
  static List<DataModel> data = [
    DataModel(serviceName: "Push Notification", time: "9:58 PM" , date: "Mon, 31 Aug" , name: "Project #31"),
    DataModel(serviceName: "Backed Integration", time: "9:58 PM" , date: "Mon, 31 Aug" , name: "Project #42"),
    DataModel(serviceName: "Release 1 integration", time: "9:48 PM" , date: "Mon, 31 Aug", name: "Project #34"),
    DataModel(serviceName: "Fix Code Bugs", time: "9:32 PM" , date: "Mon, 31 Aug",  name: "Project #46"),
  ];
}