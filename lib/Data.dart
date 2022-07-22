import 'package:flutter/material.dart';
import 'package:testproject1/child.dart';
List<Child> obj=[Child(name: "wow",age:10,bloodgroup: "B+"),Child(name: "wow1",age:10,bloodgroup: "B+"),Child(name: "wow2",age:10,bloodgroup: "B+"),Child(name: "wow3",age:10,bloodgroup: "B+"),Child(name: "wow4",age:10,bloodgroup: "B+")];
class data extends StatelessWidget {
  //const data({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Children Data",style:TextStyle(fontWeight: FontWeight.bold),),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(obj.length.toString(),style:TextStyle(fontWeight: FontWeight.w800),),
            )
          ],
        ),
        card()
      ],
    );
  }
}

class card extends StatefulWidget {
  //const card({Key? key}) : super(key: key);

  @override
  State<card> createState() => _cardState();
}

class _cardState extends State<card> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery. of(context). size. height,
      child: ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: obj.length,
          itemBuilder: (context, index) => buildChild(obj[index],index),
          physics: NeverScrollableScrollPhysics(),
      ),

    );
  }
  Widget buildChild(Child indexname,int index) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          width:MediaQuery. of(context). size. width,
      height:MediaQuery. of(context). size. height*10/100,
      decoration:BoxDecoration(
      color: Colors.grey[200],
      borderRadius: BorderRadius.all(Radius.circular(20.00))
      ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                  children:[Text(obj[index].name,style: TextStyle(fontWeight: FontWeight.bold),),Text(obj[index].age.toString()),Text(obj[index].bloodgroup)],
      ),
                const CircleAvatar(
                  radius: 40.0,
                  child: ClipOval(
                    child: Image(image: AssetImage('assets/imag1.png')),
                  ),
                ),
            ],
            ),
          ),
        ),
    );
  }
}
