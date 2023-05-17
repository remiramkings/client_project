import 'package:client_project/models/grid_tile_data.dart';
import 'package:flutter/material.dart';

class GridCard extends StatelessWidget{
  GridTileData gridTileData;
  GridCard({required this.gridTileData});
  
  @override
  Widget build(BuildContext context) {
   return SizedBox(
       height: 100,
       width: 100,
       child: Column(
         children: [
           SizedBox(
             height: 20,
           ),
           Container(

               height: 60,
               width: 60,
               decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(30),
                   color: gridTileData.backgroundColor),
               padding: const EdgeInsets.all(8),
               child: gridTileData.image!=null?Image.asset(gridTileData.image!): Icon(

                 gridTileData.icon,
                 color: Colors.white,
                 size: 40,
               )

           ),
           SizedBox(height: 10),
           Text(gridTileData.title,
               style:
               TextStyle(fontSize: 15, color: Colors.teal)),
         ],
       ),
     );
  }

}