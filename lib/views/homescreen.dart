import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/getDataController.dart';

class MyCustomWidget extends StatefulWidget {
  @override
  State<MyCustomWidget> createState() => _MyCustomWidgetState();
}

class _MyCustomWidgetState extends State<MyCustomWidget> {
  final getDataController = Get.put(GetDataController());

  @override
  void initState() {
    // TODO: implement initState
    getDataController.getDataFromApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          title: Text('GetX List'),
        ),
        body: !getDataController.isLoading.value
            ? ListView.builder(
                itemCount: getDataController.getDataModel.value.people?.length,
                itemBuilder: (context, index) {
                  return Card(
                      child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          getDataController
                              .getDataModel.value.people![index].craft,
                        ),
                        Text(
                          getDataController
                              .getDataModel.value.people![index].name,
                        ),
                      ],
                    ),
                  ));
                })
            : Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
