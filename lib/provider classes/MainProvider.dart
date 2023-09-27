import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

import '../ModelClass/ProductModel.dart';


class MainProvider extends ChangeNotifier{

  List<productModel> productModelList = [];

  Future <productModel> fetchProduct  () async {
    print("scsd");
    final response = await http.get(Uri.parse("https://makeup-api.herokuapp.com/api/v1/products.json?brand=maybelline"));
    print(productModel.fromJson(jsonDecode(response.body)).id+"rtrtrt");
    if(response.statusCode == 200){
      productModelList.add(productModel(
          productModel.fromJson(jsonDecode(response.body)).id,
          productModel.fromJson(jsonDecode(response.body)).brand,
          productModel.fromJson(jsonDecode(response.body)).name,
          productModel.fromJson(jsonDecode(response.body)).price,
          productModel.fromJson(jsonDecode(response.body)).rating,
          productModel.fromJson(jsonDecode(response.body)).image,
          productModel.fromJson(jsonDecode(response.body)).description
      ));
      notifyListeners();

      print(productModelList.length.toString()+"asda");
      return  productModel.fromJson(jsonDecode(response.body));

    }else
      {
        throw Exception("fail to load products");
      }

notifyListeners();


  }





}