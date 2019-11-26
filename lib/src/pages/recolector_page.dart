import 'package:flutter/material.dart';

import '../models/user.dart';

class RecolectorPage extends StatelessWidget {
  final List<User> list;

  const RecolectorPage({Key key, this.list}) : super(key: key);

  @override
  Widget build(BuildContext context) {
//     return list.isEmpty
//         ? Center(
//             child: CircularProgressIndicator(backgroundColor: Colors.white),
//           )
//         : ListView.builder(
//             itemCount: list.length,
//             itemBuilder: (BuildContext context, int index) {
//               return Padding(
//                 padding: EdgeInsets.all(10.0),
//                 child: Card(
//                   child: Padding(
//                     padding: EdgeInsets.symmetric(
//                       horizontal: 15.0,
//                       vertical: 20.0,
//                     ),
//                     child: ListTile(
// //                      leading: CircleAvatar(
// //                        radius: 25.0,
// //                        backgroundImage: NetworkImage(
// //                          list[index].photoURL,
// //                        ),
// //                      ),
//                       title: Text(
//                         list[index].name,
//                         style: Theme.of(context).textTheme.title,
//                       ),
//                     ),
//                   ),
//                 ),
//               );
//             },
//           );

    return Container(color: Colors.yellow);
  }
}
