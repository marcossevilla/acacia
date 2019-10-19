import 'package:flutter/material.dart';
import 'package:plants_app/src/models/recolector.dart';
import 'package:plants_app/src/networking/recolector_network.dart';

class RecolectorPage extends StatefulWidget {
  @override
  _RecolectorPageState createState() => _RecolectorPageState();
}

class _RecolectorPageState extends State<RecolectorPage> {
  Recolector recolector;
  List<Recolector> _recolectors = List();
  RecolectorNetwork _recolectorNetwork = RecolectorNetwork();

  _fetchRecolectors() async {
    // var data = await _recolectorNetwork.getRecolector('marcos');
    var data = await _recolectorNetwork.getAllRecolectors();
    setState(() {
      // recolector = data;
      // _recolectors.add(recolector);
      _recolectors = data;
    });
  }

  @override
  void initState() {
    super.initState();
    _fetchRecolectors();
  }

  @override
  void setState(fn) {
    if (this.mounted) {
      super.setState(fn);
    }
  }

  @override
  Widget build(BuildContext context) {
    return _recolectors.isEmpty
        ? Center(
            child: CircularProgressIndicator(backgroundColor: Colors.white),
          )
        : ListView.builder(
            itemCount: _recolectors.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: EdgeInsets.all(10.0),
                child: Card(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 15.0,
                      vertical: 20.0,
                    ),
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 25.0,
                        backgroundImage: NetworkImage(
                          _recolectors[index].photoURL,
                        ),
                      ),
                      title: Text(
                        _recolectors[index].name,
                        style: Theme.of(context).textTheme.title,
                      ),
                    ),
                  ),
                ),
              );
            },
          );
  }
}
