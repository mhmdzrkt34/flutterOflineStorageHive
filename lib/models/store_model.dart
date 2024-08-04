import 'package:flutterofflinepractice/models/car_model.dart';
import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';


part 'store_model.g.dart';
@HiveType(typeId: 2)
class StoreModel extends HiveObject {


  @HiveField(0)

   late String id;



  @HiveField(1)

   late String name;

  @HiveField(2)


  List<CarModel> cars=[];



  StoreModel({required this.name}){


    id=const Uuid().v1();

  
  }
  







}