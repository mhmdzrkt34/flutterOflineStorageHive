

import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';

part 'car_model.g.dart';


@HiveType(typeId: 1)
class CarModel extends HiveObject{


  @HiveField(0)

  late String id;


  @HiveField(1)

  late String name;


  @HiveField(2)

  late String brand;


  CarModel({

    required this.name,
    required this.brand
  }){

    id=const Uuid().v1();
  }





}