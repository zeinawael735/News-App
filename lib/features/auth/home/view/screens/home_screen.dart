import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/features/auth/home/repository/data_source/home_data_source_imp.dart';
import 'package:news_app/features/auth/home/repository/repo/home_repo_imp.dart';


import '../../../../../core/result_api/result_api.dart';
import '../../data/api/api.dart';
import '../../data/models/success_response.dart';


import '../../view_model/home_cubit.dart';
import '../../view_model/home_state.dart';
import '../widgets/image_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const routeName = 'HomeScreen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Articles>articles = [];
  String? messageError ;
  bool isLoading = true;
  @override
  void initState() {
    super.initState();
    fetchNews();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(
        HomeRepoImp(HomeDataSourceImp())
      )..fetchNews(),
      child: Scaffold(
        backgroundColor: Color(0xff202020),
        appBar: AppBar(
          backgroundColor: Color(0xff1877F2),
          title: Text('News App', style: Theme
              .of(context)
              .textTheme
              .bodyLarge),
          centerTitle: true,
        ),
         body:BlocBuilder<HomeCubit, HomeState>(
           builder: (BuildContext context, state) {
             switch(state) {
               case HomeInitial():
                 return SizedBox.shrink();

               case HomeLoading():
                 return Center(child: CircularProgressIndicator());

               case HomeSuccess():
                 return ListView.builder(
                   itemCount: state.articles.length,
                   itemBuilder: (context, index) {
                     return ImageItemWidget(
                       image: state.articles[index].urlToImage ,
                       title: state.articles[index].title ,
                       onTap: () {},
                     );
                   },
                 );

               case HomeError():
                 return Center(child: Text(state.messageError));

             }
             },

         )









      ),
    );
  }

  void fetchNews() async {
    var result = await Api.getNews();
    switch (result) {
      case Success<SuccessResponseModel>():
        articles = result.data?.articles ?? [];

      case Error<SuccessResponseModel>():
        messageError=result.messageError;
    }
    isLoading=false;
    setState(() {

    });

  }
}


String dummyImage =
    'https://images.theconversation.com/files/651621/original/file-20250226-32-jxjhmy.jpg?ixlib=rb-4.1.0&rect=0%2C0%2C5991%2C3997&q=20&auto=format&w=320&fit=clip&dpr=2&usm=12&cs=strip';
/*
 return
*/
