import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:listview_api/Src/Data.dart';
import 'DetailsPage.dart';

class ListViewPage extends StatefulWidget {
  const ListViewPage({Key? key}) : super(key: key);

  @override
  State<ListViewPage> createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {
  @override
  void initState(){
    var fetchData = Provider.of<Data>(context,listen: false);
    fetchData.getListData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    context.read<Data>().getListData();
    return Scaffold(
      appBar: AppBar(
        title: Text('Hello World!'),
        centerTitle: true,
      ),
      body: RefreshIndicator(
        onRefresh: _onRefresh,
        child: Center(
          child: Consumer<Data>(
            builder: (context,value,child){
              return value.data.isEmpty ? const CircularProgressIndicator() : ListView.builder(
                itemCount: value.data.length,
                itemBuilder: (context,i){
                  return ListTile(
                    title: Text(value.data[i].id),
                    subtitle: Text(value.data[i].author),
                    trailing: Icon(Icons.more_vert_rounded),
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context)=>detailsPage(
                            id: (value.data[i].id),
                            url: (value.data[i].url),
                            author: (value.data[i].author),
                            width: (value.data[i].width),
                            height: (value.data[i].height))));
                    },
                  );
                });
            }
          ),
        ),
      ),
    );
  }



  Future<void> _onRefresh() async{
    await Future.delayed(const Duration(seconds: 2));
    await context.read<Data>().getListData();
    setState(() {

    });
  }
}