import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tasky_pro/app_context_extension.dart';
import 'package:tasky_pro/resources/text_style/text_styling.dart';
import 'package:tasky_pro/utils/routes/app_links.dart';
import 'package:tasky_pro/view%20model/home_view_model.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  HomeViewModel vm = HomeViewModel();

  @override
  void initState() {
    vm.updateGreeting();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Stack(
        children: [
          Image.asset(context.resources.imagesUrls.mainBackground,
          height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
          ),
          Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: Colors.transparent,
            ),
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: context.resources.dimensions.padding15),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CircleAvatar(
                              //backgroundColor: context.resources.color.colorRed,
                            foregroundColor: Colors.lightGreen,
                              child: Image.asset(context.resources.imagesUrls.profileImage,
                              height: 20,
                              ),
                            ),
                            SizedBox(width: context.resources.dimensions.padding8,),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(vm.greeting,style: TextStyling.semiBoldText14.copyWith(
                                  color: Colors.white
                                ),),
                                SizedBox(height: context.resources.dimensions.padding4,),
                                Text('Yara',style: TextStyling.semiBoldText14.copyWith(
                                  color: Colors.yellow,
                                  fontSize: 18
                                ),)
                              ],
                            )
                          ],
                        ),
                        InkWell(
                          onTap: (){
                            showDialog(context: context, builder: (context){
                              return AlertDialog(
                                backgroundColor: context.resources.color.colorWhite,
                                content: SizedBox(
                                  height: MediaQuery.of(context).size.height/5,
                                  child: Column(
                                    children: [
                                      Icon(Icons.waving_hand,
                                        color: context.resources.color.colorPrimary,
                                      size: 55,
                                      ),
                                      SizedBox(height: context.resources.dimensions.padding15,),
                                      Text('Are you sure you want to log out?',
                                      style: TextStyling.semiBoldText14.copyWith(
                                      ),
                                      ),
                                      SizedBox(height: context.resources.dimensions.padding20,),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          InkWell(
                                            onTap: (){
                                              vm.signOut(context);
                                              context.push(AppLinks.onBoarding);
                                              },
                                            child: Container(
                                              height: 35,
                                              width: 55,
                                              decoration: BoxDecoration(
                                                color: context.resources.color.colorPrimary,
                                                borderRadius: BorderRadius.circular(context.resources.dimensions.mediumRadius8),
                                              ),
                                              child: Center(
                                                child: Text('Yes',style: TextStyling.semiBoldText14.copyWith(
                                                  color: context.resources.color.colorWhite
                                                ),),
                                              )),
                                          ),
                                          SizedBox(width: context.resources.dimensions.padding15,),
                                          InkWell(
                                            onTap: ()=>context.pop(),
                                            child: Container(
                                              height: 35,
                                              width: 55,
                                              decoration: BoxDecoration(
                                                color: context.resources.color.colorPrimary,
                                                borderRadius: BorderRadius.circular(context.resources.dimensions.mediumRadius8),
                                              ),
                                              child: Center(
                                                child: Text('No',style: TextStyling.semiBoldText14.copyWith(
                                                  color: context.resources.color.colorWhite
                                                ),),
                                              ),
                                            ),
                                          ),
                                        ],
                                      )

                                    ],
                                  ),
                                ),
                              );
                            });
                            //vm.signOut(context);
                          //context.push(AppLinks.onBoarding);
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: context.resources.dimensions.padding8,
                            vertical: context.resources.dimensions.padding8
                            ),
                              decoration: BoxDecoration(
                                color: context.resources.color.colorWhite,
                                borderRadius: BorderRadius.circular(context.resources.dimensions.bigRadius20)
                              ),
                              child: Icon(Icons.logout,color: context.resources.color.colorRed,)),
                        )
                      ],
                    ),
                    SizedBox(height: context.resources.dimensions.padding20,),
                    SizedBox(
                      height: 60,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: vm.weekWidget.length,
                        itemBuilder:(BuildContext context,int index) {
                          return Padding(
                            padding: EdgeInsetsGeometry.all(context.resources.dimensions.padding4),
                            child: Container(
                              width: 43,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(context.resources.dimensions.mediumRadius8),
                                color: context.resources.color.colorPrimary,
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(vm.weekWidget[index].weekDays,style: TextStyling.semiBoldText14.copyWith(
                                      color: Colors.white
                                  ),),
                                  Text('13',style: TextStyling.semiBoldText14.copyWith(
                                      color: Colors.white
                                  ),)
                                ],
                              ),
                            ),
                          );
                        }
                      ),
                    ),
                    SizedBox(height: context.resources.dimensions.padding20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Today's Tasks",style: TextStyling.semiBoldText14.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 17
                          ),),
                          SizedBox(height: context.resources.dimensions.padding8,),
                          Text('3 Tasks are Pending',style: TextStyling.text14.copyWith(
                              color: Colors.white
                          ),)
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.filter_list_rounded,color: Colors.white,),
                          SizedBox(width: context.resources.dimensions.padding4,),
                          Container(
                            width: 1,
                            height: 25,
                            color: Colors.white,
                          ),
                          SizedBox(width: context.resources.dimensions.padding4,),
                          Icon(Icons.add,color: Colors.white,)
                        ],
                      )
                      ],
                    ),
                    SizedBox(height: context.resources.dimensions.padding20),
                    Container(
                      padding: EdgeInsets.all(context.resources.dimensions.padding20),
                      height: MediaQuery.of(context).size.height/5,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(context.resources.dimensions.bigRadius20)
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Design 2 App Screens',style: TextStyling.semiBoldText14.copyWith(
                                color: Colors.black,
                                decoration: TextDecoration.lineThrough
                              ),),
                              Icon(Icons.check_circle,color: context.resources.color.colorPrimary,
                                size:context.resources.dimensions.padding40,)
                            ],
                          ),
                          Text('Check The Language',style: TextStyling.text14.copyWith(
                            color: context.resources.color.colorSecondary,
                            fontSize: 12
                          ),)
                        ],
                      ),
                    ),
                    SizedBox(height: context.resources.dimensions.padding20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Monthly Review",style: TextStyling.semiBoldText14.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 17
                        ),),
                        SizedBox(height: context.resources.dimensions.padding8,),
                        Row(
                          children: [
                            Text('6 Tasks are Done,Well Done ... ',style: TextStyling.text14.copyWith(
                                color: Colors.white
                            ),),
                            SizedBox(width: context.resources.dimensions.padding4,),
                            InkWell(
                              onTap: ()=>print('See More'),
                              child: Text('See More',style: TextStyling.text14.copyWith(
                                  color: Colors.orange,
                              ),),
                            ),
                          ],
                        )
                      ],
                    ),
                    SizedBox(height: context.resources.dimensions.padding20),

                    Wrap(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: context.resources.dimensions.padding15),
                          child: Container(
                            height: MediaQuery.of(context).size.width/3,
                            width: MediaQuery.of(context).size.width/3,
                            decoration: BoxDecoration(
                              color: context.resources.color.colorPrimary,
                              borderRadius: BorderRadius.circular(context.resources.dimensions.bigRadius20),
                              border: BoxBorder.all(color: Colors.white)
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('6',style: TextStyling.semiBoldText14.copyWith(
                                  color: Colors.white,
                                  fontSize: 17
                                ),),
                                SizedBox(height: context.resources.dimensions.padding12,),
                                Text('Done',style: TextStyling.semiBoldText14.copyWith(
                                  color: Colors.white,
                                  fontSize: 17
                                ),)
                              ],
                            ),
                          ),
                        ),
                        SizedBox(width: context.resources.dimensions.padding40,),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: context.resources.dimensions.padding20,
                          horizontal: context.resources.dimensions.padding15
                          ),
                          child: Container(
                            height: MediaQuery.of(context).size.width/4,
                            width: MediaQuery.of(context).size.width/3,
                            decoration: BoxDecoration(
                              color: context.resources.color.colorPrimary,
                              borderRadius: BorderRadius.circular(context.resources.dimensions.bigRadius20),
                              border: BoxBorder.all(color: Colors.white)
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('6',style: TextStyling.semiBoldText14.copyWith(
                                  color: Colors.white,
                                  fontSize: 17
                                ),),
                                SizedBox(height: context.resources.dimensions.padding12,),
                                Text('Done',style: TextStyling.semiBoldText14.copyWith(
                                  color: Colors.white,
                                  fontSize: 17
                                ),)
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Wrap(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: context.resources.dimensions.padding20,
                          horizontal: context.resources.dimensions.padding15
                          ),
                          child: Container(
                            height: MediaQuery.of(context).size.width/4,
                            width: MediaQuery.of(context).size.width/3,
                            decoration: BoxDecoration(
                                color: context.resources.color.colorPrimary,
                                borderRadius: BorderRadius.circular(context.resources.dimensions.bigRadius20),
                                border: BoxBorder.all(color: Colors.white)
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('6',style: TextStyling.semiBoldText14.copyWith(
                                    color: Colors.white,
                                    fontSize: 17
                                ),),
                                SizedBox(height: context.resources.dimensions.padding12,),
                                Text('Done',style: TextStyling.semiBoldText14.copyWith(
                                    color: Colors.white,
                                    fontSize: 17
                                ),)
                              ],
                            ),
                          ),
                        ),
                        SizedBox(width: context.resources.dimensions.padding40,),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: context.resources.dimensions.padding15),
                          child: Container(
                            height: MediaQuery.of(context).size.width/3,
                            width: MediaQuery.of(context).size.width/3,
                            decoration: BoxDecoration(
                              color: context.resources.color.colorPrimary,
                              borderRadius: BorderRadius.circular(context.resources.dimensions.bigRadius20),
                              border: BoxBorder.all(color: Colors.white)
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('6',style: TextStyling.semiBoldText14.copyWith(
                                  color: Colors.white,
                                  fontSize: 17
                                ),),
                                SizedBox(height: context.resources.dimensions.padding12,),
                                Text('Done',style: TextStyling.semiBoldText14.copyWith(
                                  color: Colors.white,
                                  fontSize: 17
                                ),)
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
