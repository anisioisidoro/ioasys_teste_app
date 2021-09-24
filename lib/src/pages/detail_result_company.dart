import 'package:empresas_flutter/src/modules/enterprise/domain/entities/enterprise.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../global_const.dart';

class DetailResultCompany extends StatelessWidget {
  final Enterprise? enterprise;
  final Color? color;

  const DetailResultCompany({Key? key, this.enterprise, this.color})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        brightness: Brightness.light,
        automaticallyImplyLeading: false,
        toolbarHeight: 115,
        flexibleSpace: Padding(
          padding: const EdgeInsets.symmetric(vertical: 40),
          child: Row(
            children: [
              GestureDetector(
                child: Container(
                    margin: EdgeInsets.only(left: 16.49),
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(color: Color(0xFFF5F5F5)),
                    child: Center(
                        child: Icon(
                      Icons.arrow_back,
                      color: Color(0xFFE01E69),
                    ))),
                onTap: () => Navigator.pop(context),
              ),
              SizedBox(width: 2),
              Container(
                width: 320,
                child: Text(enterprise?.enterpriseName?.toUpperCase() ?? "",
                    maxLines: 1,
                    overflow: TextOverflow.clip,
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w500,
                    )),
              )
            ],
          ),
        ),
      ),
      body: Container(
        color: Colors.white,
        child: ListView(
          children: [
            SizedBox(
              height: 15,
            ),
            Container(
              height: 270,
              width: size.width,
              color: color,
              child: Column(
                children: [
                  Container(
                    width: size.width,
                    height: 200,
                    child: Image.network(
                      IMAGE_URL + enterprise!.photo.toString(),
                      fit: BoxFit.fill,
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    enterprise?.enterpriseName?.toUpperCase() ?? "",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.w600),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16),
              padding: EdgeInsets.symmetric(vertical: 24),
              width: 328,
              child: Text(
                enterprise?.description ?? "",
                textAlign: TextAlign.left,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
