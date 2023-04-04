import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:multi_select_flutter/dialog/mult_select_dialog.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:multiple_search_selection/multiple_search_selection.dart';
import 'package:provider/provider.dart';
import 'package:recipefinder/Models/Datas.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Provider.of<Datas>(context, listen: false).fetchData();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var dataProvider = Provider.of<Datas>(context, listen: true);
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          toolbarHeight: 50,
          leading: FloatingActionButton(
              elevation: 0,
              backgroundColor: Colors.white,
              onPressed: () => Navigator.pop(context),
              child: const Icon(
                Icons.arrow_back,
                color: Colors.blue,
              )),
          title: Text('b'),
        ),
        body: dataProvider.isLoading
            ? Center(child: CircularProgressIndicator())
            : Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Container(
                            height: 500,
                            child: MultiSelectDialogField<Data>(
                                separateSelectedItems: true,
                                dialogHeight: height * 0.4,
                                onConfirm: (p0) {},
                                searchable: true,
                                items: [
                                  ...Provider.of<Datas>(context, listen: true)
                                      .ingredients
                                      .map((e) => MultiSelectItem(e, e.name!))
                                ],
                                initialValue: []))
                      ],
                    ),
                  ),
                  ElevatedButton(onPressed: () {}, child: Text('Submit'))
                ],
              ));
  }
}
