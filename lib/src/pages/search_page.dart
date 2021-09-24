import 'package:dartz/dartz.dart' as dartz;
import 'package:empresas_flutter/src/global_const.dart';
import 'package:empresas_flutter/src/service/service_locator.dart';
import 'package:empresas_flutter/src/stores/enterprise_store/enterprise_store.dart';
import 'package:empresas_flutter/src/widgets/shared_widget/text_field_shared_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'detail_result_company.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  FocusNode? _focusNodeSearch;

  TextEditingController? _txtSearch;

  EnterpriseStore? _enterpriseStore;

  @override
  void initState() {
    super.initState();
    _focusNodeSearch = FocusNode();
    _txtSearch = TextEditingController();
    _enterpriseStore = locator.get<EnterpriseStore>();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        body: SingleChildScrollView(
            child: Stack(
      children: [
        Column(children: [
          Container(
            width: size.width,
            height: 300,
            child: Stack(
              fit: StackFit.expand,
              children: [
                Image.asset(
                  "asset/images/fundo_search.png",
                  fit: BoxFit.fill,
                ),
                Positioned(
                  left: 1,
                  right: 100,
                  child:
                      Image.asset("asset/icons/icon1.png", fit: BoxFit.contain),
                ),
                Positioned(
                  left: 1,
                  bottom: -50,
                  child: Image.asset(
                    "asset/icons/icon2.png",
                    fit: BoxFit.contain,
                    width: 197,
                  ),
                ),
                Positioned(
                    right: 5,
                    bottom: -2,
                    child: Image.asset(
                      "asset/icons/icon3.png",
                      fit: BoxFit.fill,
                      width: 200,
                    )),
                Positioned(
                    right: -55,
                    top: -2,
                    child: Transform.rotate(
                      angle: 6,
                      child: Image.asset(
                        "asset/icons/icon3.png",
                        fit: BoxFit.fill,
                        width: 200,
                      ),
                    )),
              ],
            ),
          ),
          Observer(builder: (_) {
            if (_enterpriseStore!.isLoadingEnterprise) {
              return Padding(
                  padding: EdgeInsets.symmetric(vertical: 160),
                  child: CircularProgressIndicator(
                      valueColor:
                          AlwaysStoppedAnimation<Color>(Color(0xFFE01E69))));
            }

            if (_enterpriseStore!.enterpriseModel == null || _enterpriseStore!.enterpriseModel!.enterprises==null || _enterpriseStore?.enterpriseModel?.enterprises?.length==0) {
              return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: Text(
                      "${_enterpriseStore?.enterpriseModel?.enterprises?.length.toString()??0} resultados encontrados",
                      style: TextStyle(color: Colors.black45),
                    ),
                  );
            }
            return Padding(
              padding: EdgeInsets.symmetric(vertical: 32, horizontal: 16),
              child: ListView(
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: Text(
                      "${_enterpriseStore?.enterpriseModel?.enterprises?.length.toString()} resultados encontrados",
                      style: TextStyle(color: Colors.black45),
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  ListView.separated(
                      separatorBuilder: (_, _index) {
                        return Divider();
                      },
                      shrinkWrap: true,
                      itemCount: _enterpriseStore!
                          .enterpriseModel!.enterprises!.length,
                      physics: ClampingScrollPhysics(),
                      itemBuilder: (_, index) {
                        return GestureDetector(
                          child: Container(
                              height: 200,
                              width: 343,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: index % 2 == 0
                                      ? Color(0xFF79BBCA)
                                      : Color(0xFFEB9797),
                                  border: Border.all(
                                      width: 0, color: Colors.transparent)),
                              child: Center(
                                child: Column(
                                  //mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: size.width,
                                      height: 135,
                                      child: Image.network(
                                        IMAGE_URL +
                                            _enterpriseStore!.enterpriseModel!
                                                .enterprises![index].photo
                                                .toString(),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Text(
                                      _enterpriseStore
                                              ?.enterpriseModel!
                                              .enterprises?[index]
                                              .enterpriseName
                                              ?.toUpperCase() ??
                                          "",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 25,
                                          fontWeight: FontWeight.w600),
                                    )
                                  ],
                                ),
                              )),
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => DetailResultCompany(
                                        color: index % 2 == 0
                                            ? Color(0xFF79BBCA)
                                            : Color(0xFFEB9797),
                                        enterprise: _enterpriseStore!
                                            .enterpriseModel
                                            ?.enterprises![index],
                                      ))),
                        );
                      })
                ],
              ),
            );
          })
        ]),
        Positioned(
            top: size.height * 0.32,
            child: SizedBox(
              width: size.width,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: SharedTextFieldSearch(
                  focusNode: _focusNodeSearch!,
                  textEditingController: _txtSearch!,
                  prefixIcon: Icons.search,
                  hintText: "Pesquise por empresa",
                  onSubmitted: (value) =>
                      _enterpriseStore?.search(enterpriseName: value).then((value){
                        if(value is dartz.Left){
                          value.fold((l) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(l.message)));
                          }, (r) => null);
                        }
                      }),
                  cleanData: () {
                    _enterpriseStore?.cleanData();
                    _txtSearch?.clear();
                  },
                ),
              ),
            ))
      ],
    )));
  }
}
