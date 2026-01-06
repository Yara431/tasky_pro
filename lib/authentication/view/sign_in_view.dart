import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tasky_pro/app_context_extension.dart';
import 'package:tasky_pro/authentication/view_model/auth_view_model.dart';
import 'package:tasky_pro/resources/main_component/common_button.dart';
import 'package:tasky_pro/resources/text_style/text_styling.dart';

class SignInView extends StatefulWidget {

  const SignInView({super.key});

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  AuthViewModel vm = AuthViewModel();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => vm,
      child: Scaffold(
        body: Selector<AuthViewModel,int>(
          selector: (context,p)=>p.currentPage,
          builder: (context,val,child) {
            return Stack(
              children: [
                Image.asset(context.resources.imagesUrls.splash,
                  height:MediaQuery.of(context).size.height/2,
                fit: BoxFit.cover,),
                Padding(
                  padding: EdgeInsets.only(bottom: context.resources.dimensions.defaultPadding85),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: MediaQuery.of(context).size.height/2,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(context.resources.dimensions.bigRadius20),
                        topRight: Radius.circular(context.resources.dimensions.bigRadius20)
                        )
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: context.resources.dimensions.padding15,
                        horizontal:context.resources.dimensions.padding15),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: List.generate(3,(index){
                                return Padding(
                                  padding: EdgeInsets.symmetric(horizontal:context.resources.dimensions.padding4),
                                  child: Container(
                                    width: val==index?
                                    35:10,
                                    height: 7,
                                    decoration: BoxDecoration(
                                        color: val==index?
                                        context.resources.color.colorPrimary
                                            :context.resources.color.colorSecondary,
                                        borderRadius: BorderRadius.circular(context.resources.dimensions.bigRadius20)
                                    ),
                                  ),
                                );
                              }),
                              /*SizedBox(width: 5,),
                                  Container(
                                    width: 10,
                                    height: 10,
                                    decoration: BoxDecoration(
                                        color: Colors.grey,
                                        borderRadius: BorderRadius.circular(20)
                                    ),
                                  ),
                                  SizedBox(width: 5,),
                                  Container(
                                    width: 10,
                                    height: 10,
                                    decoration: BoxDecoration(
                                        color: Colors.grey,
                                        borderRadius: BorderRadius.circular(20)
                                    ),
                                  ),*/
                            ),
                            /*Selector<AuthViewModel,int>(
                              selector: (context , p)=>p.currentPage,
                              builder: (context, val, child) {
                              return Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                  children: List.generate(3,(index){
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(horizontal:4),
                                      child: Container(
                                          width: val==index?
                                          35:20,
                                          height: 7,
                                          decoration: BoxDecoration(
                                              color: val==index?
                                              context.resources.color.colorPrimary
                                              :context.resources.color.colorSecondary,
                                              borderRadius: BorderRadius.circular(20)
                                          ),
                                        ),
                                    );
                                  }),
                                  */
                            SizedBox(height:context.resources.dimensions.padding40,),
                            Text('Sign In',
                            style: TextStyling.moreLargeBoldText.copyWith(
                              color: context.resources.color.colorPrimary
                            ),),
                              SizedBox(height: context.resources.dimensions.padding20,),
                            Text(
                              textAlign: TextAlign.center,
                              'From Tasks to Triumph',
                            style: TextStyling.extraLargeBoldText,
                            ),
                            SizedBox(height: context.resources.dimensions.padding40,),
                            Text(
                                textAlign: TextAlign.center,
                                'A smarter way to manage tasks, stay focused, and achieve your goals by streamlining your daily workflow, eliminating digital distractions, and providing the actionable insights you need to prioritize what truly matters',
                            style: TextStyling.text14.copyWith(
                              color: context.resources.color.colorSecondary
                            ),
                            ),
                            SizedBox(height: context.resources.dimensions.padding40,),
                            CommonButton(
                            /*onPress: ()=>context.push(

                            ),*/
                                text: 'Get Started')
                          ],
                        ),
                      ),
                      ),
                  ),
                )
              ],
            );
          }
        ),
      ),
    );
  }
}
