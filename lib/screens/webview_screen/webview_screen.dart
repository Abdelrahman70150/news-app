import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/cubit.dart';
import 'package:news_app/cubit/states.dart';
import 'package:news_app/style/conts/colors.dart';
import 'package:webview_flutter/webview_flutter.dart';
class WebViewScreen extends StatelessWidget {
static const String routName = "webView Screen";

  @override
  Widget build(BuildContext context) {

    return  BlocConsumer<NewsCubit,NewsStates>(
      listener: (context , state){},
      builder: (context, state){
        var cubit = NewsCubit.get(context);
        return  Scaffold(
          backgroundColor: Colors.white,
            appBar: AppBar(
              title: Text('Details'),
            ),
            body: WebView(
              initialUrl: cubit.url,
              javascriptMode: JavascriptMode.unrestricted,
              backgroundColor:  cubit.themeMode == ThemeMode.light ?  Colors.white : Colors.white,
              allowsInlineMediaPlayback: true,

            ),
        );
      },

    );
  }
}
