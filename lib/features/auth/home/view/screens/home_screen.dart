import 'package:flutter/material.dart';


import '../../../../../core/result_api/result_api.dart';
import '../../data/api/api.dart';
import '../../data/models/success_response.dart';


import '../widgets/image_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const routeName = 'HomeScreen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Articles>articles=[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff202020),
      appBar: AppBar(
        backgroundColor: Color(0xff1877F2),
        title: Text('News App', style: Theme.of(context).textTheme.bodyLarge),
        centerTitle: true,
      ),
      // body: FutureBuilder(future: Api.getNews(), builder: (context, snapshot) {
      //   if(snapshot.connectionState==ConnectionState.waiting) {
      //     return Center(child: CircularProgressIndicator());
      //   }
      //
      //   if(snapshot.hasError) {
      //     return Center(child: Text(snapshot.error.toString()));
      //   }
      //   List<Articles> data=snapshot.data?.articles??[];
      //
      //   return ListView.builder(
      //     itemBuilder: (context, index) {
      //       return ImageItemWidget(
      //         image: data[index].urlToImage,
      //         title: data[index].title,
      //         onTap: () {},
      //       );
      //     },
      //     itemCount:data.length,
      //   );
      // },)
    );
  }
  void fetchNews()async{
    var result=await Api.getNews();
    switch(result) {
      case Success<SuccessResponseModel>():
        articles=result.data?.articles??[];

      case Error<SuccessResponseModel>():

    }

}


String dummyImage =
    'https://images.theconversation.com/files/651621/original/file-20250226-32-jxjhmy.jpg?ixlib=rb-4.1.0&rect=0%2C0%2C5991%2C3997&q=20&auto=format&w=320&fit=clip&dpr=2&usm=12&cs=strip';