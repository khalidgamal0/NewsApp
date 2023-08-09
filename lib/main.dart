
import 'package:firstproject/shared/network/remote/dio_heliper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:firstproject/shared/network/local/cache_helper.dart';
import 'layout/newsapp/cubit/cubit.dart';
import 'layout/newsapp/cubit/states.dart';
import 'layout/newsapp/news_app.dart';
import 'shared/block-observer.dart';

void main()async {

  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  diohelper.init();
  await cahe_helper.init();
  bool? isdark=cahe_helper.getbooldat(key:'isdark');
  runApp(MyApp(isdark));
}

class MyApp  extends StatelessWidget
{
  final bool? isdark;
  const MyApp(this.isdark, {super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => newcubit()..getbusiness()..ChangeMode(fromshared: isdark),
      child: BlocConsumer<newcubit,newstates>(
        listener: (context, state) {},
        builder: (context, state) {

          return MaterialApp(
            debugShowCheckedModeBanner:false,
            theme: ThemeData(
              primarySwatch:Colors.deepOrange,
              scaffoldBackgroundColor: Colors.white,
              appBarTheme: const AppBarTheme(
                titleSpacing: 20,
                  backgroundColor: Colors.white,
                  titleTextStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight:FontWeight.bold
                  ),
                  iconTheme: IconThemeData(
                      color: Colors.black
                  ),
                  elevation: 0,
                  systemOverlayStyle:(SystemUiOverlayStyle(
                    statusBarColor: Colors.white,
                    statusBarIconBrightness:Brightness.dark,
                  ))

              ),
              bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                  type: BottomNavigationBarType.fixed,
                  selectedItemColor: Colors.deepOrange,
                  elevation: 20
              ),
              floatingActionButtonTheme: const FloatingActionButtonThemeData(
                backgroundColor: Colors.deepOrange,

              ),
              textTheme: const TextTheme(
                  bodyText1: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.black
                  )
              ),
            ),
            darkTheme: ThemeData(
              scaffoldBackgroundColor:HexColor('333739'),
              primarySwatch:Colors.deepOrange,
              appBarTheme: AppBarTheme(
                  titleSpacing: 20,
                  backgroundColor: HexColor('333739'),
                  iconTheme: const IconThemeData(
                      color: Colors.white
                  ),
                  elevation: 0,
                  titleTextStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight:FontWeight.bold
                  ),
                  systemOverlayStyle:(SystemUiOverlayStyle(
                    statusBarColor:HexColor('333739'),
                    statusBarIconBrightness:Brightness.light,
                  ))

              ),
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                type: BottomNavigationBarType.fixed,
                selectedItemColor: Colors.deepOrange,
                unselectedItemColor: Colors.grey,
                elevation: 20,
                backgroundColor: HexColor('333739'),
              ),
              floatingActionButtonTheme: const FloatingActionButtonThemeData(
                backgroundColor: Colors.deepOrange,

              ),
              textTheme: const TextTheme(
                  bodyText1: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.white
                  )
              ),
            ),
            themeMode:newcubit.get(context).isdark? ThemeMode.dark:ThemeMode.light,
            home:Directionality(
                textDirection:TextDirection.ltr,
                child: newsapp()),
          );
        },
      ),
    );
  }
}