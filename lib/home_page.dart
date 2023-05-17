import 'package:client_project/grid_card.dart';
import 'package:client_project/interfaces/user_auth_service.dart.dart';
import 'package:client_project/services/grid_data_service.dart';
import 'package:flutter/material.dart';

import 'components/nav_drawer.dart';
import 'models/grid_tile_data.dart';

class HomePage extends StatefulWidget {
  final UserAuthService userAuthService;
  GridDataService gridDataService;

  HomePage({required this.gridDataService, required this.userAuthService});
  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  bool switchVal = false;
  List<GridTileData> gridData = [];

  loadData() {
    setState(() {
      gridData = GridDataService().getGridTileData();
    });
  }

  @override
  initState() {
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavDrawer(userAuthService: widget.userAuthService),
        appBar: AppBar(
          title: Row(
            children: [
              Expanded(
                  flex: 1,
                  child:
                      switchVal == false ? Text('Off Duty') : Text('ON Duty')),
              Switch(
                  value: switchVal,
                  onChanged: (bool value) {
                    setState(() {
                      switchVal = value;
                    });
                  }),
              Icon(Icons.add_alert),
              Icon(Icons.more_vert)
            ],
          ),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(48.0),
            child: Container(
              height: 20,
              alignment: Alignment.centerLeft,
              width: double.infinity,
              color: Colors.blue[900],
              child: Text(
                '   Welcome',
                style:
                    TextStyle(color: Colors.white, fontStyle: FontStyle.italic),
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            child: Column(children: [
              GridView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: gridData.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, childAspectRatio: 1 / 0.7),
                itemBuilder: (BuildContext context, int index) {
                  return new Card(
                    child: GridCard(gridTileData: gridData[index]),

                    //just for testing, will fill with image later
                  );
                },
              ),
            ]),
          ),
        ));
  }
}
