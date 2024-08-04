import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutterofflinepractice/models/store_model.dart';
import 'package:hive/hive.dart';

class HomeModelView extends ChangeNotifier {

  List<StoreModel> stores=[];

  TextEditingController StoreNameController=TextEditingController();

  




  HomeModelView(){


    getStores();
  }


  void getStores(){

    var box=Hive.box<StoreModel>("storeBox");

    print("length ${box.values.toList().length}");


    stores=[...(box.values.toList())];
    notifyListeners();






  }

  void AddStoreClick(BuildContext context){


    showDialog(context: context, builder: (BuildContext contextDialog){
      GlobalKey<FormState> key=GlobalKey<FormState>();

      String storeName="";

      


      return  AlertDialog(

        content: Column(children: [


          Form(key: key, child: Column(children: [TextFormField(

            validator: (value){


              bool result=!(value==null || value.length==0);

              return result?null:"empty field";
            },


            
            controller: StoreNameController,
            onChanged: (value){


              StoreNameController.text=value;
            },
            onSaved: (value){

              storeName=value!;
            },
            decoration: InputDecoration(label: Text("Store Name:"),icon:Icon(Icons.store)),),
            
          
          
          ],)),

          MaterialButton(

            color: Colors.red,

            child: Text("add store",style: TextStyle(color: Colors.white),),
            onPressed: (){

              if(key.currentState!.validate()){


                key.currentState!.save();


                AddStore(storeName, contextDialog);
              }



          })
        ],),
      );
    });
  }


  Future<void> AddStore(String StoreName,BuildContext context) async{

    Box box=Hive.box<StoreModel>("storeBox");

    StoreModel store=StoreModel(name: StoreName);

    await box.add(store);

    stores=[...stores,store];
    notifyListeners();
    StoreNameController.text="";

    Navigator.pop(context);
    




  }
}