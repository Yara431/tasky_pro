import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:tasky_pro/app_context_extension.dart';
import 'package:tasky_pro/authentication/view_model/auth_view_model.dart';
import 'package:tasky_pro/resources/main_component/common_button.dart';
import 'package:tasky_pro/resources/text_style/text_styling.dart';
import 'package:tasky_pro/utils/routes/app_links.dart';

class SignInView extends StatefulWidget {

  const SignInView({super.key});

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  AuthViewModel vm = AuthViewModel();

  @override
  void initState(){
    vm=context.read<AuthViewModel>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Selector<AuthViewModel,int>(
        selector: (context,p)=>p.currentPage,
        builder: (context,val,child) {
          return Stack(
            children: [
              Image.asset(context.resources.imagesUrls.logIn,
              width: double.infinity,
              fit: BoxFit.cover,),
              Padding(
                padding: EdgeInsets.only(bottom: context.resources.dimensions.padding20),
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
                      horizontal:context.resources.dimensions.padding15
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(2,(index){
                              return Padding(
                                padding: EdgeInsets.symmetric(horizontal:context.resources.dimensions.padding4),
                                child: Container(
                                  width: val!=index?
                                  35:10,
                                  height: 7,
                                  decoration: BoxDecoration(
                                      color: val!=index?
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
                          SizedBox(height:context.resources.dimensions.padding20,),
                          Text('Log In',
                          style: TextStyling.moreLargeBoldText.copyWith(
                            color: Colors.black
                          ),),
                            SizedBox(height: context.resources.dimensions.padding12,),
                          Text(
                            textAlign: TextAlign.center,
                            'To get access for all your tasks',
                          style: TextStyling.semiBoldText14.copyWith(
                            color: context.resources.color.colorSecondary
                          ),
                          ),
                          SizedBox(height: context.resources.dimensions.padding20,),
                         Container(
                               padding: EdgeInsets.all(context.resources.dimensions.padding4),
                               width: MediaQuery.of(context).size.height/3,
                               height: 45,
                               decoration: BoxDecoration(
                                 color: context.resources.color.colorSecondaryPrimary.withValues(alpha: 0.2),
                                 borderRadius: BorderRadius.circular(context.resources.dimensions.bigRadius20)
                               ),
                               child: ValueListenableBuilder<TextEditingValue>(
                                 valueListenable: vm.email,
                                 builder: (context,val,child) {
                                   return TextField(
                                     keyboardType: TextInputType.text,
                                     controller: vm.email,
                                     decoration: InputDecoration(
                                       border: InputBorder.none,
                                       hintText: 'Email Address',
                                       prefixIcon: Icon(Icons.person),
                                       suffixIcon: val.text.isNotEmpty
                                       ? InkWell(
                                           onTap: ()=> vm.email.clear(),
                                           child: Icon(Icons.cancel_outlined,
                                             color: context.resources.color.colorRed,)
                                       ) :SizedBox()
                                     ),
                                   );
                                 }
                               )),

                        SizedBox(height: context.resources.dimensions.padding20,),
                          Container(
                            padding: EdgeInsets.all(context.resources.dimensions.padding4),
                            width: MediaQuery.of(context).size.height/3,
                            height: 45,
                            decoration: BoxDecoration(
                            color: context.resources.color.colorSecondaryPrimary.withValues(alpha: 0.2),
                              borderRadius: BorderRadius.circular(context.resources.dimensions.bigRadius20)
                            ),
                            child: ValueListenableBuilder<TextEditingValue>(
                              valueListenable: vm.password,
                              builder: (context,val,child) {
                                return TextField(
                                  controller: vm.password,
                                  obscureText: !vm.showPass,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Password',
                                    prefixIcon: Icon(Icons.lock),
                                    suffixIcon: vm.password.text.isNotEmpty?
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        InkWell(
                                          onTap: ()=> setState(() {
                                            vm.showPass = !vm.showPass;
                                          }),
                                          child: !vm.showPass?
                                          Icon(Icons.visibility_off,):
                                          Icon(Icons.remove_red_eye,
                                            color: context.resources.color.colorRed,
                                          )
                                        ),
                                        SizedBox(width: context.resources.dimensions.padding4,),
                                        InkWell(
                                          onTap: ()=> vm.password.clear(),
                                          child: Icon(Icons.cancel_outlined,
                                            color: context.resources.color.colorRed,
                                          ),
                                        ),
                                      ],
                                    )
                                    :SizedBox()
                                  ),
                                );
                              }
                            ),
                          ),
                          SizedBox(height: context.resources.dimensions.padding12,),
                          InkWell(
                            onTap: ()=>print('forget the password'),
                            child: Text(
                              'Forget the password ? Click here',
                            style: TextStyling.text14.copyWith(
                              decoration: TextDecoration.underline
                            ),
                            ),
                          ),
                          SizedBox(height: context.resources.dimensions.padding20,),
                          CommonButton(
                          onPress: ()=>vm.signIn(
                              email: vm.email.text,
                              password: vm.password.text,
                              context: context),
                              text: 'Log In'),
                          SizedBox(height: context.resources.dimensions.padding20,),
                          Text("You don't have an account?",
                          style: TextStyling.semiBoldText14.copyWith(
                            color: context.resources.color.colorSecondary
                          ),
                            textAlign: TextAlign.center,
                          ),
                          InkWell(
                            onTap: ()=>context.push(AppLinks.signUp),
                            child: Text("Register Now",
                            style: TextStyling.semiBoldText14.copyWith(
                              color: context.resources.color.colorSecondary,
                              decoration: TextDecoration.underline,
                            ),
                              textAlign: TextAlign.center,
                            ),
                          ),
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
    );
  }
}
