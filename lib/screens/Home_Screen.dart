import 'package:displaylistproduct/provider%20classes/MainProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    String rupees ="5000";
    MainProvider mainProvider= Provider.of<MainProvider>(context, listen: false);
    mainProvider.fetchProduct();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: Icon(Icons.menu,color: Colors.white),
        title: Text("List of Products",style: TextStyle(color: Colors.white)),
        actions: [
          Icon(Icons.search,color: Colors.white)
        ],
      ),
      body: Consumer<MainProvider>(
        builder: (context,value,child) {
          return ListView.builder(
            itemCount: value.productModelList.length,
              itemBuilder: (context, index) {
              var items =value.productModelList[index];
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 50,vertical: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.black12
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: width,
                        height: height/2.5,
                          child: ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                              child: Image.network(items.image,fit: BoxFit.fill,))
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 50),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(items.brand,style: TextStyle(color: Colors.black,fontSize: 25)),
                              Text(items.name,style: TextStyle(fontSize: 18,color: Colors.grey)),
                              Text("₹${items.price} /-",style: TextStyle(color: Colors.black,fontSize: 20)),
                              Text(items.description),
                            ],
                          ),
                        ),
                      )



                    ],
                  ),
                );
              },);
        }
      ),
    );
  }
}
