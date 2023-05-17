import 'package:flutter/material.dart';
import '../models/grid_tile_data.dart';

class GridDataService{
  List<GridTileData> getGridTileData(){
    return [
      GridTileData(title: ('New Client'), icon: Icons.flash_on, backgroundColor: Colors.deepPurple),
      GridTileData(title: ('Product List'), icon: Icons.list, backgroundColor: Colors.pink)

    ];
  }
}