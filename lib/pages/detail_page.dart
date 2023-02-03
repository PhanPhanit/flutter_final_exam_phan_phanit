import 'package:flutter/material.dart';
import 'package:flutter_final_exam_phan_phanit/api/api_provid.dart';
import 'package:flutter_final_exam_phan_phanit/models/province.dart';
import 'package:flutter_final_exam_phan_phanit/models/province_detail.dart';

class DetailPage extends StatefulWidget {
  Province province;
  DetailPage({required this.province, super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  ProvinceDetail? provinceDetail;
  bool isReadMore = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadProvinceDetail(widget.province.id);
  }

  void loadProvinceDetail(int provinceId) async {
    provinceDetail = await ApiProvider.getProvinceDetail(provinceId);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var placeCount = provinceDetail?.placeCount;
    var name = provinceDetail?.name;
    var shortDescription = provinceDetail?.shortDescription;
    var description = provinceDetail?.description;

    return Scaffold(
      appBar: appBar(context, widget.province.name),
      body: provinceDetail == null
          ? Center()
          : SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 300,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(4),
                        child: SizedBox.fromSize(
                          size: Size.fromRadius(48), // Image radius
                          child: Image.network(
                              provinceDetail?.imageUrl as String,
                              fit: BoxFit.cover),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      "${placeCount} places",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      isReadMore == false
                          ? "$shortDescription..."
                          : "$description",
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          isReadMore = !isReadMore;
                        });
                      },
                      child: Text(
                        isReadMore == false ? "Read more..." : "Hide",
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0xFF26A250),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }

  AppBar appBar(BuildContext ctx, String provinceName) {
    return AppBar(
      backgroundColor: Color(0xFF26A250),
      leading: IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () => Navigator.pop(ctx),
      ),
      title: Text(
        provinceName,
        style: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
