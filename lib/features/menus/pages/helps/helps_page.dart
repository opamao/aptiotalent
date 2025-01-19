import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/themes/themes.dart';
import '../../../../core/widgets/widgets.dart';

class HelpsPage extends StatefulWidget {
  const HelpsPage({super.key});

  @override
  State<HelpsPage> createState() => _HelpsPageState();
}

class _HelpsPageState extends State<HelpsPage> with TickerProviderStateMixin {
  final _formKeyFeedBack = GlobalKey<FormState>();
  final List<bool> _expandedStates = List.generate(8, (index) => false);

  late final TabController _tabController;

  var login = TextEditingController();
  var search = TextEditingController();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  final _snackBar = const SnackBar(
    content: Text("Veuillez saisir votre message avant d'envoyer"),
    backgroundColor: Colors.red,
  );

  final List<Map<String, dynamic>> _tilesData = [
    {
      "title": "Comment postuler à un emploi ?",
      "text":
          "Visitez l'application, voir l'offre qui vous convient. Téléchargez votre CV. Soumettez votre candidature.",
    },
    {
      "title": "Dois-je créer un compte pour postuler ?",
      "text": "Oui, la plupart des portails d'emploi exigent que vous créiez "
          "un compte pour pouvoir soumettre des candidatures. Cela vous permet "
          "de suivre l'état d'avancement de votre candidature et de postuler "
          "à plusieurs postes.",
    },
    {
      "title": "De quels documents ai-je besoin pour postuler ?",
      "text": "Curriculum vitae. Portfolio (le cas échéant).",
    },
    {
      "title": "Puis-je postuler à plusieurs emplois en même temps ?",
      "text": "Oui, mais veillez à adapter vos candidatures. "
          "Évitez de soumettre le même CV à tous les postes.",
    },
    {
      "title": "Puis-je mettre à jour ma demande après l'avoir envoyée ?",
      "text": "Non, vous ne pouvez pas modifier votre candidature",
    },
    {
      "title": "Comment saurai-je si ma demande a été acceptée ?",
      "text": "Vous allez recevoir une notification par courrier et "
          "dans l'apllication.",
    },
    {
      "title": "Que dois-je faire si je n'ai pas de nouvelles de l'employeur ?",
      "text": "Faites un suivi en envoyant un chat poli. Réévaluez votre CV.",
    },
    {
      "title": "Puis-je postuler à un emploi si je ne possède pas toutes "
          "les qualifications requises ?",
      "text": "Oui, si vous remplissez la plupart des conditions. "
          "Mettez en avant vos compétences transférables.",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appWhite,
      appBar: AppBar(
        title: Text("Centre d'Aides"),
      ),
      body: SafeArea(
        child: Column(
          children: [
            TabBar.secondary(
              controller: _tabController,
              tabs: const <Widget>[
                Tab(text: "Retour d'information"),
                Tab(text: "FAQs"),
              ],
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: <Widget>[
                  Form(
                    key: _formKeyFeedBack,
                    child: Padding(
                      padding: EdgeInsets.all(4.w),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Text(
                              "Envoyer un commentaire",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: appBlack,
                                fontWeight: FontWeight.bold,
                                fontSize: 18.sp,
                              ),
                            ),
                            Text(
                              "Dites-nous ce que vous aimez dans l'application "
                              "ou ce que nous pourrions améliorer.",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: appBlack,
                                fontWeight: FontWeight.normal,
                                fontSize: 15.sp,
                              ),
                            ),
                            Gap(2.h),
                            InputText(
                              hintText: "Saisir votre commentaire",
                              maxLines: 8,
                              keyboardType: TextInputType.text,
                              controller: login,
                              validatorMessage:
                                  "Veuillez saisir un commentaire",
                            ),
                            Gap(2.h),
                            SubmitButton(
                              AppConstants.btnSend,
                              onPressed: () async {
                                if (_formKeyFeedBack.currentState!.validate()) {
                                } else {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(_snackBar);
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(4.w),
                    child: Column(
                      children: [
                        Text(
                          "Questions Fréquemment Posées",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: appBlack,
                            fontWeight: FontWeight.bold,
                            fontSize: 18.sp,
                          ),
                        ),
                        Text(
                          "Voici une liste de questions fréquemment posées "
                          "(FAQ) pour postuler à un emploi :",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: appBlack,
                            fontWeight: FontWeight.normal,
                            fontSize: 15.sp,
                          ),
                        ),
                        Gap(2.h),
                        InputText(
                          keyboardType: TextInputType.text,
                          controller: search,
                          hintText: "Recherche de mots-clés",
                          suffixIcon: Padding(
                            padding: EdgeInsets.all(0),
                            child: Icon(
                              Icons.search_outlined,
                              color: appColor,
                            ),
                          ),
                        ),
                        Gap(2.h),
                        Expanded(
                          child: ListView.builder(
                            itemCount: _tilesData.length,
                            itemBuilder: (context, index) {
                              return ExpansionTile(
                                title: Text(
                                  _tilesData[index]["title"],
                                  style: TextStyle(
                                    color: _expandedStates[index]
                                        ? appColor
                                        : appBlack,
                                  ),
                                ),
                                trailing: Icon(
                                  _expandedStates[index]
                                      ? Icons.arrow_circle_up_outlined
                                      : Icons.arrow_circle_down_outlined,
                                  color: _expandedStates[index]
                                      ? appColor
                                      : appBlack,
                                ),
                                children: [Text(_tilesData[index]["text"])],
                                onExpansionChanged: (bool expanded) {
                                  setState(() {
                                    // Mettre à jour uniquement l'état correspondant
                                    _expandedStates[index] = expanded;
                                  });
                                },
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
