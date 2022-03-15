import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 200,
              child: ListView.builder(
                itemCount: 10,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => Container(
                  height: 200,
                  width: 300,
                  margin: const EdgeInsets.all(10),
                  child: Center(
                    child: Text(
                      "Card $index",
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                  color: Colors.green[700],
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                    child: InkWell(
                      child: Container(
                        margin: const EdgeInsets.all(7.5),
                        height: 130,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: const AssetImage(
                                  'assets/rec4.jpg'
                              ),
                              colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.4), BlendMode.dstATop),
                            )
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(7.5),
                          child: Center(
                            child: Text("Lectures",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontFamily: 'RobotoCondensed',
                                  color: Colors.black87
                              ),
                            ),
                          ),
                        ),
                      ),
                      onTap: (){
                      },
                    )
                ),
                Expanded(
                    child: InkWell(
                      child: Container(
                        margin: const EdgeInsets.all(7.5),
                        height: 130,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: const AssetImage('assets/rec2.jpg'),
                            colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.4), BlendMode.dstATop),
                          ),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(7.5),
                          child: Center(
                            child: Text("Classroom",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontFamily: 'RobotoCondensed',
                                  color: Colors.black
                              ),
                            ),
                          ),
                        ),
                      ),
                      onTap: (){
                      },
                    )
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                    child: InkWell(
                      child: Container(
                        margin: const EdgeInsets.all(7.5),
                        height: 130,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage('assets/rec1.jpg'),
                              colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.3), BlendMode.dstATop),
                            )
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(7.5),
                          child: Center(
                            child: Text("Club Activities",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontFamily: 'RobotoCondensed',
                                  color: Colors.black
                              ),
                            ),
                          ),
                        ),
                      ),
                      onTap: (){
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'We are working on Club Activities page.',
                              style: GoogleFonts.nunito(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            backgroundColor: Colors.pinkAccent,
                          ),
                        );

                      },
                    )
                ),
                Expanded(
                    child: InkWell(
                      child: Container(
                        margin: const EdgeInsets.all(7.5),
                        height: 130,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: const AssetImage('assets/rec3.jpg'),
                              colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.4), BlendMode.dstATop),
                            )
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(7.5),
                          child: Center(
                            child: Text("Lost and Found",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontFamily: 'RobotoCondensed',
                                  color: Colors.black
                              ),
                            ),
                          ),
                        ),
                      ),
                      onTap: (){
                      },
                    )
                ),
              ],
            ),
            const SizedBox(height: 10),
            Flexible(
              child: ListView.builder(
                itemCount: 15,
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) => ListTile(
                  title: Text("List $index"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
