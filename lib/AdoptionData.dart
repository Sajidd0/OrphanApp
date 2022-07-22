import 'package:flutter/material.dart';
import 'package:testproject1/AdoptionFile.dart';
List<Adoption1> obj=[Adoption1(childname: "wowo",age:10 ,personname: "wowwww",cnic: 3768790,contactno: 456578,address:"pgfhjhjvj"),Adoption1(childname: "wowo",age:10 ,personname: "wowwww",cnic: 3768790,contactno: 456578,address:"pgfhjhjvj")];
class AdoptionData extends StatefulWidget {
  const AdoptionData({Key? key}) : super(key: key);

  @override
  State<AdoptionData> createState() => _AdoptionDataState();
}

class _AdoptionDataState extends State<AdoptionData> {
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
  Widget buildChild(Adoption1 indexname,int index) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: MediaQuery
            .of(context)
            .size
            .width,
        height: MediaQuery
            .of(context)
            .size
            .height * 15 / 100,
        decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.all(Radius.circular(20.00))
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(obj[index].childname,
                  style: TextStyle(fontWeight: FontWeight.bold),),
                Text(obj[index].age.toString()),
                Text(obj[index].personname,
                  style: TextStyle(fontWeight: FontWeight.bold),),
                Text(obj[index].cnic.toString()),
                Text(obj[index].contactno.toString()),
                Text(obj[index].address.toString())
              ],
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
