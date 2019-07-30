import 'package:flutter/material.dart';
import 'dart:math';

void main(){
  runApp(MaterialApp(
    home: HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // //默认一页行数
  int _defalutRowPageCount = PaginatedDataTable.defaultRowsPerPage;
  MyTable table = MyTable();
  int _sortColumnIndex = 0;
  bool _sortAscending=true;

  //排序关联_sortColumnIndex,_sortAscending
  void _sort<T>(Comparable<T> getField(Mybean s),int index,bool b){
    table._sort(getField, b);
    setState(() {
      this._sortColumnIndex=index;
      this._sortAscending=b;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Flutter DataTable'),),
      body: Container(
        alignment: Alignment.center,
        child: PaginatedDataTable(
          sortColumnIndex:_sortColumnIndex,
          sortAscending: _sortAscending,
          header:Text('Header'),
          rowsPerPage: _defalutRowPageCount,
          onRowsPerPageChanged: (value) {
            setState(() {
              _defalutRowPageCount = value;
            });
          },
          initialFirstRowIndex: 0,
          availableRowsPerPage: [
            5,10
          ],
          onPageChanged: (value){
            print('翻页： $value');
          },
          onSelectAll: table.selectAll,
          columns:[
            DataColumn(label:Text('单位'),onSort: (i,b){_sort<String>((Mybean p) =>p.a, i, b);}),
            DataColumn(label:Text('姓名'),onSort: (i,b){_sort<String>((Mybean p) =>p.b, i, b);}),
            DataColumn(label:Text('性别'),onSort: (i,b){_sort<String>((Mybean p) =>p.c, i, b);}),
            DataColumn(numeric:true,label:Text('年龄'),onSort: (i,b){_sort((Mybean p) =>p.d, i, b);}),
          ],
          source: table,

        ),

      ),
    );
  }
}

getDate(){
  List<Mybean> list = List<Mybean>();
  for(int i = 0; i < 50; i++){
    String sex = Random().nextInt(2) > 0 ? '男' : '女';
    list.add(Mybean('高三五班','学生${i + 1}',sex,Random().nextInt(3) + 15));
  }
  return list;
}


class MyTable extends DataTableSource{
  //获取数据集合
  List<Mybean> dataList = getDate();

  int _selectCount=0;//当前选中的行数
  @override
  DataRow getRow(int index) {
    //根据索引获取内容行
    if (index >= dataList.length || index < 0) throw FlutterError('兄弟，取错数据了吧');
    //如果索引不在商品列表里面，抛出一个异常
    final Mybean bean = dataList[index];
    return DataRow.byIndex(
        cells: <DataCell>[
          DataCell(Text('${bean.a}')),
          DataCell(Text('${bean.b}')),
          DataCell(Text('${bean.c}')),
          DataCell(Text('${bean.d}')),
        ],
        selected: bean.selected,
        index: index,
        onSelectChanged: (isSelected) {
          selectOne(index, isSelected);
        }
    );

  }
  @override//是否行数 不确定
  bool get isRowCountApproximate => false;

  @override//有多少行
  // int get rowCount => dataList.length;
  int get rowCount => dataList.length;

  @override//选中的行数
  int get selectedRowCount => _selectCount;

  //选中单个
  void selectOne(int index,bool isSelected){
    final Mybean bean = dataList[index];
    if (bean.selected != isSelected) {
      //如果选中就选中数量加一，否则减一
      _selectCount = _selectCount += isSelected ? 1 : -1;
      bean.selected = isSelected;
      //更新
      notifyListeners();
    }
  }
  //选中全部   选中所有数据， 不使用此方法点击全选 累加 当前页面所有
  void selectAll(bool checked) {
    for (Mybean bean in dataList) {
      bean.selected = checked;
    }
    _selectCount = checked ? dataList.length : 0;
    notifyListeners(); //通知监听器去刷新
  }
  //排序,
  void _sort<T>(Comparable<T> getField(Mybean shop),bool b){
    dataList.sort((Mybean s1,Mybean s2){
      if(b){//两个项进行交换
        final Mybean temp=s1;
        s1=s2;
        s2=temp;
      }
      final Comparable<T> s1Value=getField(s1);
      final Comparable<T> s2Value=getField(s2);
      return Comparable.compare(s1Value, s2Value);
    });
    notifyListeners();
  }
}

class Mybean {
  final String a;
  final String b;
  final String c;
  final int d;
  bool selected = false; //默认为未选中
  Mybean(
      this.a,
      this.b,
      this.c,
      this.d,
      );
}