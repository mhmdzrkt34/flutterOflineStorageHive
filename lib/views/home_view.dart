import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutterofflinepractice/components/store_component.dart';
import 'package:flutterofflinepractice/model_views/home_model_view.dart';
import 'package:flutterofflinepractice/models/store_model.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return HomeViewState();
  }



}

class HomeViewState extends State<HomeView> {



  @override
  Widget build(BuildContext context) {


    return MultiProvider(providers: [ChangeNotifierProvider.value(value: GetIt.instance.get<HomeModelView>())],

    child: Scaffold(



      appBar: AppBar(

        title: Text("Stores"),
      ),
      body: storesSelector(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),

        foregroundColor: Colors.white,
        backgroundColor: Colors.red,
        onPressed: (){

          GetIt.instance.get<HomeModelView>().AddStoreClick(context);



      }),
    ),
    
    
    
    );

  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies

    if(!ModalRoute.of(context)!.isCurrent){



    }
    super.didChangeDependencies();
  }


  Selector<HomeModelView,List<StoreModel>> storesSelector(){


    return Selector<HomeModelView,List<StoreModel>>(selector: (context,provider)=>provider.stores,
    
    shouldRebuild: (previous,next)=>!identical(previous, next),

    builder: (context,stores,child){


      if(stores.length==0){


        return Center(child: Text("there is no stores"),);
      }

      return ListView.builder(
        itemCount: stores.length,
        itemBuilder: (BuildContext context,int index){

          return StoreComponent(store: stores[index],);





      });

    


        
      



    },
    );
  }
}