import "package:flutter/material.dart";
// import "package:google_fonts/google_fonts.dart";
import "package:sample_ui/util/smart_sevice_box.dart";

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final double horizontalPadding = 40;
  final double verticalPadding = 25;

  List mySmartDevices = [
    ["Smart Light", "lib/Icons/light-bulb.png", true],
    ["Smart fan", "lib/Icons/fan.png", false],
    ["Smart AC", "lib/Icons/air-conditioner.png", false],
    ["Smart Tv", "lib/Icons/smart-tv.png", false]
  ];

  void powerSwitchChanged(bool value, int index) {
    setState(() {
      mySmartDevices[index][2] = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //custom app bar
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: horizontalPadding, vertical: verticalPadding),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    'lib/Icons/menu.png',
                    height: 45,
                    color: Colors.grey[800],
                  ),
                  Icon(
                    Icons.person,
                    size: 45,
                    color: Colors.grey[800],
                  )
                ],
              ),
            ),
            const SizedBox(height: 20),

            //welcome home
            Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Welcome Home,"),
                  Text(
                    "GURU PRASATH",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
                    // style: GoogleFonts.bebasNeue(fontSize: 72),
                  )
                ],
              ),
            ),
            const SizedBox(height: 20),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: Divider(
                color: Colors.grey,
                thickness: 1,
              ),
            ),
            const SizedBox(height: 20),

            Padding(
                padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
                child: Text(
                  "Smart Devices",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
                )),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, childAspectRatio: 1 / 1.3),
                itemCount: mySmartDevices.length,
                physics: NeverScrollableScrollPhysics(),
                padding: EdgeInsets.all(25),
                itemBuilder: (BuildContext context, int index) {
                  return SmartDeviceBox(
                      smartDeviceName: mySmartDevices[index][0],
                      iconPath: mySmartDevices[index][1],
                      powerOn: mySmartDevices[index][2],
                      onChanged: ((value) => powerSwitchChanged(value, index)));
                },
              ),
            )

            //smart devices + grid
          ],
        ),
      ),
    );
  }
}
