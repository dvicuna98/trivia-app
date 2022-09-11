import 'package:flutter/material.dart';
import 'package:upstrivia/themes/app_theme.dart';

class CustomAppBar extends StatefulWidget {

  const CustomAppBar({Key? key}) : super(key: key);

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      padding: const EdgeInsets.only(top: 80,left: 20,right: 20,),
      color: AppTheme.primary,
      child:  Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children:  [
              const Text('TheSticky',
                  style: TextStyle(color: Colors.white)
              ),
              GestureDetector(
                  child: const Icon(Icons.logout,color: Colors.white,),
                onTap: () {
                  Navigator.of(context).pushReplacementNamed('Login');
                },
              ),

            ],
          ),
          const SizedBox(
            height: 20,
          ),
          const Text('diego.vicuna@debugentity.org',
            style: TextStyle(color: Colors.white)
            ,
          )
        ],
      ),
    );
  }
}
