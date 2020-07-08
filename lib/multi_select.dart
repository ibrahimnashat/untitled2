import 'package:flutter/material.dart';

class MultiSelect extends StatefulWidget {
  final List data;
  final String title;
  final Function(List) getSelectd;

  MultiSelect({this.data, this.getSelectd, this.title});

  @override
  _MultiSelectState createState() => _MultiSelectState();
}

class _MultiSelectState extends State<MultiSelect> {
  Color _normalSelect = Colors.white54;
  Color _activeSelect = Colors.white;
  int _lastSelect = -1;

  @override
  void initState() {
    super.initState();
    widget.data.forEach((element) {
      _selected.add(false);
    });
  }

  List<bool> _selected = new List();
  List<dynamic> _selectedObjects = new List();
  bool _showMultiSelect = false;

  @override
  Widget build(BuildContext context) {
    return !_showMultiSelect
        ? Container(
            height: MediaQuery.of(context).size.height * 0.045,
            width: MediaQuery.of(context).size.width,
            color: Color(0xff116B7B),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    widget.title,
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
                InkWell(
                  onTap: () {
                    _showMultiSelect = true;
                    setState(() {});
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Icon(
                      Icons.keyboard_arrow_down,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                )
              ],
            ),
          )
        : Container(
            padding: EdgeInsets.all(15),
            height: (widget.data.length * 35).toDouble(),
            color: Color(0xff116B7B),
            child: Column(
              children: [
                Expanded(
                  child: GridView(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 5,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10),
                    children: widget.data.asMap().entries.map((e) {
                      return Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: _lastSelect == e.key
                                ? _activeSelect
                                : _normalSelect),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: InkWell(
                            onTap: () {
                              _lastSelect = e.key;
                              _selected[e.key] = !_selected[e.key];
                              _selectedObjects.contains(widget.data[e.key])
                                  ? _selectedObjects.remove(e.value)
                                  : _selectedObjects.add(e.value);
                              setState(() {});
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Image(
                                      image: AssetImage("assets/news_carve.png"),
                                      height: 15,
                                      width: 20,
                                    ),
                                    SizedBox(width: 6,),
                                    Text(
                                      e.value,
                                      style: TextStyle(
                                          color: _lastSelect == e.key
                                              ? Color(0xff116B7B)
                                              : Color(0xffffffff),
                                          fontSize: 14),
                                    ),
                                  ],
                                ),
                                Image(
                                  image: _selected[e.key]
                                      ? AssetImage("assets/selected_pin.png")
                                      : AssetImage("assets/un_selected_pin.png"),
                                  height: 20,
                                  width: 20,
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
                FlatButton(
                    shape: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: BorderSide(color: Colors.white, width: 1)),
                    onPressed: () {
                      widget.getSelectd(_selectedObjects);
                      _showMultiSelect = false;
                      setState(() {});
                    },
                    child: Text(
                      "تم",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ))
              ],
            ),
          );
  }
}
