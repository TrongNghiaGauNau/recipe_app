import 'package:flutter/material.dart';
class SectionTitle extends StatelessWidget {
  const SectionTitle({super.key, required this.press, required this.text,this.trending = false});

  final String text;
  final GestureTapCallback press;
  final bool trending;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal:20),
      child: Row(
        children: [
          Text(
            text,
            style: const TextStyle(
                fontSize: 25, color: Colors.black,fontWeight: FontWeight.bold),
          ),
          if(trending)
            const Icon(Icons.local_fire_department_sharp,color: Colors.deepOrange,),
          const Spacer(),
          GestureDetector(onTap: press, child: const Text('See all',style: TextStyle(color: Colors.red),)),
          const Icon(Icons.arrow_forward,color: Colors.red,)
        ],
      ),
    );
  }
}