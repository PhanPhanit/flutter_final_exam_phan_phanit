import 'package:flutter/material.dart';
import 'package:flutter_final_exam_phan_phanit/api/api_provid.dart';
import 'package:flutter_final_exam_phan_phanit/components/province_item.dart';
import 'package:flutter_final_exam_phan_phanit/models/province.dart';
import 'package:flutter_final_exam_phan_phanit/utils/constants.dart';

class HomeNav extends StatefulWidget {
  const HomeNav({super.key});

  @override
  State<HomeNav> createState() => _HomeNavState();
}

class _HomeNavState extends State<HomeNav> {
  List<Province> provinces = [];
  bool isLoading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadProvinceList();
  }

  void loadProvinceList() async {
    setState(() {
      isLoading = true;
    });
    provinces = await ApiProvider.getProvinces();
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: provinces.length,
      itemBuilder: (context, index) {
        Province province = provinces[index];
        return ProvinceItem(
          province: province,
        );
      },
    );
  }
}
