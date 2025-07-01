import 'package:flutter/material.dart';
import 'package:flutter_machine_test_demo/resuableElements.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(75),
          child: AppBar(
            leading: Padding(
              padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
              child: IconButton(onPressed: (){}, icon: Icon(Icons.menu, size: 35,)),
            ),

            actions: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0.0, 10.0, 10.0, 10.0),
                child: IconButton(onPressed: (){}, icon: Icon(Icons.notifications_none_outlined, size: 35,)),
              ),
            ],
            elevation: 2,
            shadowColor: Colors.grey,
            title: Padding(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey[400]
                ),
                //color: Colors.grey,
                child: Row(
                  children: [
                    IconButton(onPressed: (){}, icon: ClipRRect(borderRadius: BorderRadius.circular(5), child: Image.asset("assets/logo_icon.jpg", width: 30, fit: BoxFit.cover,), )),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Search Here',
                          suffixIcon: Icon(Icons.search)
                        ),
                      ),
                    )
                  ]
                ),
              ),
            ),
          ),
        ),

        body: SizedBox.expand(
          child: Stack(
            children: [
              Positioned.fill(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(size.width*0.02, size.width*0.05, size.width*0.02, size.width*0.01),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              Info(title: 'Esha', name: 'name', lastName: 'lastName',
                                  email: 'email',  phone: 'phone', age: 'age'),
                              Info(title: 'Esha', name: 'name', lastName: 'lastName',
                                  email: 'email',  phone: 'phone', age: 'age'),
                              Info(title: 'Esha', name: 'name', lastName: 'lastName',
                                  email: 'email',  phone: 'phone', age: 'age'),
                              Info(title: 'Esha', name: 'name', lastName: 'lastName',
                                  email: 'email',  phone: 'phone', age: 'age'),
                              Info(title: 'Esha', name: 'name', lastName: 'lastName',
                                  email: 'email',  phone: 'phone', age: 'age'),
                              Info(title: 'Esha', name: 'name', lastName: 'lastName',
                                  email: 'email',  phone: 'phone', age: 'age'),
                              Info(title: 'Esha', name: 'name', lastName: 'lastName',
                                  email: 'email',  phone: 'phone', age: 'age'),


                            ],
                          ),
                        ),

                        SizedBox(
                          height: size.height * 0.015,
                        ),

                        //kyc container
                        Container(
                          width: double.infinity,
                          //color: Color(0xff7c7ce6),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Color(0xff7c7ce6),
                          ),
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(size.width * 0.1, size.width * 0.03, size.width * 0.1, size.width * 0.03),
                            child: Column(

                              children: [
                                Text("KYC Pending", style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),),
                                SizedBox(height: size.width * 0.02 ),
                                Text("You need to provide the required documents for your account activation.", textAlign: TextAlign.center,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold, color: Colors.white),),
                                SizedBox(height: size.width * 0.04),
                                TextButton(onPressed: (){}, child: Text("Click Here", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white, decoration: TextDecoration.underline, decorationColor: Colors.white),))
                              ],

                            ),
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.02,
                        ),

                        //options container (listview)
                        Placeholder(
                          fallbackHeight: 100,
                        ),

                        SizedBox(
                          height: size.height * 0.02,
                        ),

                        Container(
                          width: double.infinity,
                          color: Color(0xff5eadcc),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Info(title: 'M/s', name:'Esha', lastName: 'Saini', email: 'email', phone: 'phone', age: 'age'),
                                  Info(title: 'M/s', name:'Esha', lastName: 'Saini', email: 'email', phone: 'phone', age: 'age'),

                                ]
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                right: size.width*0.05,
                bottom: size.width*0.05,
                child: ElevatedButton.icon(onPressed: (){}, icon: Icon(Icons.bubble_chart),label: Text("Chat", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,


                ),),
              )

            ]
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.red,
          unselectedItemColor: Colors.grey,
          unselectedLabelStyle: TextStyle(color: Colors.grey),
          selectedLabelStyle: TextStyle(color: Colors.red),
          showUnselectedLabels: true,
          showSelectedLabels: true,
          unselectedFontSize: 12,
          iconSize: 30,
          currentIndex: 0,

          //use when switching from one screen to other
          // onTap: (index) {
          //   switch(index){
          //     case 0:
          //       Navigator.push(context, MaterialPageRoute(builder: (context) => Homescreen()));
          //       break;
          //     case 1:
          //       Navigator.push(context, MaterialPageRoute(builder: (context) => Homescreen()));
          //       break;
          //     case 2:
          //       Navigator.push(context, MaterialPageRoute(builder: (context) => Homescreen()));
          //       break;
          //     case 3:
          //       Navigator.push(context, MaterialPageRoute(builder: (context) => Homescreen()));
          //       break;
          //     case 4:
          //       Navigator.push(context, MaterialPageRoute(builder: (context) => Homescreen()));
          //   }
          // },
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.widgets_outlined), label: "Categories"),
            BottomNavigationBarItem(icon: Image.asset("assets/logo_icon_bw.png", width: 30, fit: BoxFit.cover,), label: "Deal"),
            BottomNavigationBarItem(icon: Icon(Icons.shopping_cart_outlined), label: "Cart"),
            BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: "Profile"),
          ]
        ),

      ),
    );
  }
}
