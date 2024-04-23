import 'package:flutter/material.dart';
import 'package:personal_carbon_footprint_app/shared/globals.dart';
import 'package:personal_carbon_footprint_app/shared/menu_drawer.dart';
import '../shared/menu_bottom.dart';
import 'package:url_launcher/url_launcher.dart';

//This class builds the links screen in the app
class LinksScreen extends StatefulWidget {
  const LinksScreen({super.key});

  @override
  State<LinksScreen> createState() => _LinksScreenState();
}

class _LinksScreenState extends State<LinksScreen> {
  final double fontSize = 16;
  //External URLs available on the page
  final Uri unitedNationsClimateChangeUrl = Uri.parse('https://www.un.org/en/climatechange');
  final Uri nasaClimateChangeUrl = Uri.parse('https://science.nasa.gov/climate-change/');
  final Uri metOfficeClimateChangeUrl = Uri.parse('https://www.metoffice.gov.uk/weather/climate-change/what-is-climate-change');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Our Precious World'),
      ),
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/water.jpg'), fit: BoxFit.cover)),
        child: SingleChildScrollView(
          child: Column(children: [
            //Title for the page
            Padding(
              padding: const EdgeInsets.all(28.0),
              child: Text(
                'Climate change links',
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    shadows: [globalShadowText()]),
              ),
            ),
            //Text for the United Nations climate change link
            Center(
              child: Padding(
                padding:
                    const EdgeInsets.only(top: 32.0, left: 32.0, right: 32.0),
                child: Container(
                  padding: const EdgeInsets.all(14),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Colors.white70,
                  ),
                  child: Text(
                      'The United Nations is an intergovernmental organisation who aim to maintain world peace, global security and provide climate change updates. Click the link below to learn more',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: fontSize, shadows: [globalShadowText()])),
                ),
              ),
            ),
            //United Nations climate change link
            Padding(
              padding: const EdgeInsets.only(top: 10.0, left: 32.0, right: 32.0),
              child: ElevatedButton(
                  onPressed: () {
                    unitedNationsClimateLink();
                  },
                  child: Text('United Nations Climate Change',
                      style: TextStyle(
                          fontSize: fontSize, shadows: [globalShadowText()]))),
            ),
            //Text for the NASA climate change link
            Center(
              child: Padding(
                padding:
                    const EdgeInsets.only(top: 60.0, left: 32.0, right: 32.0),
                child: Container(
                  padding: const EdgeInsets.all(14),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Colors.white70,
                  ),
                  child: Text(
                      'The National Aeronautics and Space Administration (NASA) is Americas space agency. They report on vital signs and the state of the planet with relation to climate change. Click the link below to learn more',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: fontSize, shadows: [globalShadowText()])),
                ),
              ),
            ),
            //NASA climate change link
            Padding(
              padding: const EdgeInsets.only(top: 12.0, left: 32.0, right: 32.0),
              child: ElevatedButton(
                  onPressed: () {
                    nasaClimateLink();
                  },
                  child: Text('NASA Climate Change',
                      style: TextStyle(
                          fontSize: fontSize, shadows: [globalShadowText()]))),
            ),
            //Text for the Met Office climate change link
            Center(
              child: Padding(
                padding:
                    const EdgeInsets.only(top: 60.0, left: 32.0, right: 32.0),
                child: Container(
                  padding: const EdgeInsets.all(14),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Colors.white70,
                  ),
                  child: Text(
                      'The Met Office is the national meteorological service for the UK and report on climate change information. Click the link below to learn more',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: fontSize, shadows: [globalShadowText()])),
                ),
              ),
            ),
            //Met Office climate change link
            Padding(
              padding: const EdgeInsets.only(top: 12.0, left: 32.0, right: 32.0),
              child: ElevatedButton(
                  onPressed: () {
                    metOfficeClimateLink();
                  },
                  child: Text('Met Office Climate Change',
                      style: TextStyle(
                          fontSize: fontSize, shadows: [globalShadowText()]))),
            ),
            //Text for suggesting a new link
            Center(
              child: Padding(
                padding:
                    const EdgeInsets.only(top: 60.0, left: 32.0, right: 32.0),
                child: Container(
                  padding: const EdgeInsets.all(14),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Colors.white70,
                  ),
                  child: Text(
                      'Want to add a new link to our links set? \nWhy not send us an email via the link below',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: fontSize, shadows: [globalShadowText()])),
                ),
              ),
            ),
            //Suggest a new link button
            Padding(
              padding:
                  const EdgeInsets.only(top: 12.0, left: 32.0, right: 32.0, bottom: 80.0),
              child: ElevatedButton(
                  onPressed: () {
                    suggestLinkViaEmail();
                  },
                  child: Text('Suggest a link',
                      style: TextStyle(
                          fontSize: fontSize, shadows: [globalShadowText()]))),
            ),
          ]),
        ),
      ),
      bottomNavigationBar: const MenuBottom(),
      drawer: const MenuDrawer(),
    );
  }

  //URL launcher for the United Nations climate page
  Future<void> unitedNationsClimateLink() async {
    if (await canLaunchUrl(unitedNationsClimateChangeUrl)) {
      await launchUrl(unitedNationsClimateChangeUrl);
    }
  }

  //URL launcher for the NASA climate page
  Future<void> nasaClimateLink() async {
    if (await canLaunchUrl(nasaClimateChangeUrl)) {
      await launchUrl(nasaClimateChangeUrl);
    }
  }

  //URL launcher for the Met Office climate page
  Future<void> metOfficeClimateLink() async {
    if (await canLaunchUrl(metOfficeClimateChangeUrl)) {
      await launchUrl(metOfficeClimateChangeUrl);
    }
  }

  //URL launcher and email auto generation for suggesting a new link
  void suggestLinkViaEmail() async {
    final Uri params = Uri(
      scheme: 'mailto',
      path: 'ourpreciousworldapp@outlook.com',
      query: 'subject=Our Precious World - New link suggestion!',
    );

    Uri url = params;
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    }
  }
}
