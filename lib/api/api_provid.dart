import 'dart:convert';

import 'package:flutter_final_exam_phan_phanit/models/province.dart';
import 'package:flutter_final_exam_phan_phanit/models/province_detail.dart';
import 'package:http/http.dart' as http;

class ApiProvider {
  static Future<List<Province>> getProvinces() async {
    const url =
        "https://tests3bk.s3.ap-southeast-1.amazonaws.com/provinces.json";
    final uri = Uri.parse(url);
    final response = await http.get(uri);

    List<Province> provinces = [];

    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      for (var item in jsonData) {
        Province province = Province(
            item['id'], item['name'], item['imageUrl'], item['placeCount']);
        provinces.add(province);
      }
      return provinces;
    } else {
      return provinces;
    }
  }

  static Future<ProvinceDetail> getProvinceDetail(int provinceId) async {
    var url =
        "https://tests3bk.s3.ap-southeast-1.amazonaws.com/province/$provinceId.json";
    final uri = Uri.parse(url);
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body) as Map<String, dynamic>;
      return ProvinceDetail(
        jsonData['id'],
        jsonData['name'],
        jsonData['imageUrl'],
        jsonData['placeCount'],
        jsonData['shortDescription'],
        jsonData['description'],
      );
    } else {
      throw Exception("Fail to fetch data from internet");
    }
  }
}
