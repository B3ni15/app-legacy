import 'package:refilc_mobile_ui/premium/plus_screen.i18n.dart';
import 'package:refilc_mobile_ui/premium/components/plan_card.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:refilc_plus/providers/premium_provider.dart';
import 'package:refilc_plus/ui/mobile/premium/upsell.dart';

import 'components/active_sponsor_card.dart';
// import 'components/github_button.dart';

class PlusScreen extends StatelessWidget {
  const PlusScreen({super.key});

  Uri parseTierUri({required String tierId}) {
    return Uri.parse(
        'https://github.com/sponsors/refilc/sponsorships?tier_id=$tierId&preview=true');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF4F9FF),
      body: Container(
        padding: EdgeInsets.zero,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/premium_top_banner.png'),
            fit: BoxFit.fitWidth,
            alignment: Alignment.topCenter,
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                const Color(0xffF4F9FF).withOpacity(0.1),
                const Color(0xffF4F9FF).withOpacity(0.15),
                const Color(0xffF4F9FF).withOpacity(0.25),
                const Color(0xffF4F9FF).withOpacity(0.4),
                const Color(0xffF4F9FF).withOpacity(0.5),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: const [0.0, 0.1, 0.15, 0.2, 0.25],
            ),
          ),
          child: ListView(
            children: [
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      const Color(0xffF4F9FF).withOpacity(0.0),
                      const Color(0xffF4F9FF).withOpacity(0.4),
                      const Color(0xffF4F9FF).withOpacity(0.6),
                      const Color(0xffF4F9FF).withOpacity(0.9),
                      const Color(0xffF4F9FF),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: const [0.0, 0.1, 0.15, 0.18, 0.22],
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // heading (title, x button)
                      Padding(
                        padding: const EdgeInsets.only(left: 12.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'reFilc+',
                              style: TextStyle(
                                fontSize: 33,
                                color: Color(0xFF0a1c41),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            IconButton(
                              onPressed: () => Navigator.of(context).pop(),
                              icon: const Icon(
                                FeatherIcons.x,
                                color: Colors.black,
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        child: Text.rich(
                          TextSpan(
                            text: 'even_more_cheaper'.i18n,
                            style: const TextStyle(
                              height: 1.2,
                              fontSize: 22,
                              color: Color(0xFF0A1C41),
                              fontWeight: FontWeight.w600,
                            ),
                            children: [
                              WidgetSpan(
                                child: Transform.translate(
                                  offset: const Offset(1.0, -5.5),
                                  child: Text(
                                    '1',
                                    style: TextStyle(
                                      fontSize: 14.4,
                                      color: const Color(0xFF0A1C41)
                                          .withOpacity(0.5),
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      // cards and description
                      const SizedBox(
                        height: 60,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        child: Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(text: 'support_1'.i18n),
                              WidgetSpan(
                                child: Transform.translate(
                                  offset: const Offset(1.0, -3.6),
                                  child: Text(
                                    '2',
                                    style: TextStyle(
                                      color: const Color(0xFF011234)
                                          .withOpacity(0.5),
                                      fontSize: 10.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                              TextSpan(
                                text: 'support_2'.i18n,
                              ),
                            ],
                            style: TextStyle(
                              color: const Color(0xFF011234).withOpacity(0.6),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 18,
                      ),
                      PlusPlanCard(
                        active: ActiveSponsorCard.estimateLevel(
                                context.watch<PremiumProvider>().scopes) ==
                            PremiumFeatureLevel.cap,
                        iconPath: 'assets/images/plus_tier_cap.png',
                        title: 'reFilc+',
                        description: 'tier_rfp'.i18n,
                        color: const Color.fromARGB(255, 97, 0, 187),
                        id: 'refilcplus',
                        price: 0.99,
                        borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(16.0),
                            bottom: Radius.circular(8.0)),
                        features: const [
                          ['✨', 'Előzetes hozzáférés új verziókhoz'],
                          ['👥', '2 fiók használata egyszerre'],
                          ['👋', 'Egyedi üdvözlő üzenet'],
                          [
                            '📓',
                            'Korlátlan saját jegyzet és feladat a füzet oldalon'
                          ],
                          ['1️⃣', 'Egyedi jegy ritkaságok'],
                          [
                            '➕',
                            'Összesített átlagszámoló',
                          ],
                        ],
                      ),
                      const SizedBox(
                        height: 8.0,
                      ),
                      PlusPlanCard(
                        active: ActiveSponsorCard.estimateLevel(
                                context.watch<PremiumProvider>().scopes) ==
                            PremiumFeatureLevel.ink,
                        iconPath: 'assets/images/plus_tier_ink.png',
                        title: 'reFilc+ Gold',
                        description: 'tier_rfpgold'.i18n,
                        color: const Color.fromARGB(255, 187, 137, 0),
                        id: 'refilcplusgold',
                        price: 2.99,
                        borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(8.0),
                            bottom: Radius.circular(16.0)),
                        features: const [
                          ['🕑', 'Órarend jegyzetek'],
                          ['🔤', 'Egyedi betütípusok'],
                          ['👥', 'Korlátlan fiók használata egyszerre'],
                          ['🎓', 'Összesített átlagszámoló'],
                          ['🟦', 'Live Activity szín'],
                          ['📱', 'Alkalmazás ikonjának megváltoztatása'],
                          ['📒', 'Fejlettebb cél kitűzés'],
                          ['📅', 'Naptár szinkronizálás'],
                          ['🖋️', 'cap_tier_benefits'],
                        ],
                      ),
                      // const SizedBox(
                      //   height: 8.0,
                      // ),
                      // PlusPlanCard(
                      //   active: ActiveSponsorCard.estimateLevel(
                      //           context.watch<PremiumProvider>().scopes) ==
                      //       PremiumFeatureLevel.sponge,
                      //   iconPath: 'assets/images/plus_tier_sponge.png',
                      //   title: 'Szivacs',
                      //   description:
                      //       'Férj hozzá még több funkcióhoz, használj még több profilt és tedd egyszerűbbé mindennapjaid.',
                      //   color: const Color(0xFFFFC700),
                      //   id: 'refilcplusgold',
                      //   price: 4.99,
                      //   borderRadius: const BorderRadius.vertical(
                      //       top: Radius.circular(8.0),
                      //       bottom: Radius.circular(16.0)),
                      //   features: const [
                      //     ['👥', 'Korlátlan fiók használata egyszerre'],
                      //     ['🖋️', 'ink_cap_tier_benefits'],
                      //   ],
                      // ),
                      // const SizedBox(
                      //   height: 18.0,
                      // ),
                      // const GithubLoginButton(),
                      const SizedBox(
                        height: 30.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        child: Text(
                          'faq'.i18n,
                          style: TextStyle(
                            color: const Color(0xFF011234).withOpacity(0.6),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 18,
                      ),
                      Card(
                        margin: EdgeInsets.zero,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(16.0),
                            bottom: Radius.circular(8.0),
                          ),
                        ),
                        shadowColor: Colors.transparent,
                        surfaceTintColor: const Color(0xffFFFFFF),
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.only(
                            top: 18.0,
                            bottom: 16.0,
                            left: 22.0,
                            right: 18.0,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'money'.i18n,
                                style: const TextStyle(
                                  fontSize: 16.6,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                ),
                              ),
                              const SizedBox(
                                height: 14.0,
                              ),
                              Text.rich(
                                TextSpan(
                                  style: TextStyle(
                                    color: const Color(0xFF011234)
                                        .withOpacity(0.6),
                                    fontWeight: FontWeight.w500,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: 'm_1'.i18n,
                                    ),
                                    WidgetSpan(
                                      child: Transform.translate(
                                        offset: const Offset(1.0, -3.6),
                                        child: Text(
                                          '3',
                                          style: TextStyle(
                                            color: const Color(0xFF011234)
                                                .withOpacity(0.5),
                                            fontSize: 10.0,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    ),
                                    TextSpan(
                                      text: 'm_2'.i18n,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 8.0,
                      ),
                      Card(
                        margin: EdgeInsets.zero,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(8.0),
                            bottom: Radius.circular(16.0),
                          ),
                        ),
                        shadowColor: Colors.transparent,
                        surfaceTintColor: const Color(0xffFFFFFF),
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.only(
                            top: 18.0,
                            bottom: 16.0,
                            left: 22.0,
                            right: 18.0,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'open'.i18n,
                                style: const TextStyle(
                                  fontSize: 16.6,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                ),
                              ),
                              const SizedBox(
                                height: 14.0,
                              ),
                              Text(
                                'o_1'.i18n,
                                style: TextStyle(
                                  color:
                                      const Color(0xFF011234).withOpacity(0.6),
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 30.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        child: Text(
                          'desc'.i18n,
                          style: TextStyle(
                            color: const Color(0xFF011234).withOpacity(0.6),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 18,
                      ),
                      Card(
                        margin: EdgeInsets.zero,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(8.0),
                            bottom: Radius.circular(16.0),
                          ),
                        ),
                        shadowColor: Colors.transparent,
                        surfaceTintColor: const Color(0xffFFFFFF),
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.only(
                            top: 18.0,
                            bottom: 16.0,
                            left: 22.0,
                            right: 18.0,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      color: const Color(0xff011234),
                                      borderRadius: BorderRadius.circular(20.0),
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 10.0,
                                      vertical: 2.5,
                                    ),
                                    child: const Text(
                                      '1',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 14.0,
                                  ),
                                  Expanded(
                                    child: Text(
                                      'cheaper'.i18n,
                                      maxLines: 5,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14.4,
                                        height: 1.3,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 14.0,
                              ),
                              Row(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      color: const Color(0xff011234),
                                      borderRadius: BorderRadius.circular(20.0),
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 8.8,
                                      vertical: 2.5,
                                    ),
                                    child: const Text(
                                      '2',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 14.0,
                                  ),
                                  Expanded(
                                    child: Text(
                                      'qwit'.i18n,
                                      maxLines: 5,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14.4,
                                        height: 1.3,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 14.0,
                              ),
                              Row(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      color: const Color(0xff011234),
                                      borderRadius: BorderRadius.circular(20.0),
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 8.6,
                                      vertical: 2.5,
                                    ),
                                    child: const Text(
                                      '3',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 14.0,
                                  ),
                                  Expanded(
                                    child: Text(
                                      'apple'.i18n,
                                      maxLines: 5,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14.4,
                                        height: 1.3,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 14.0,
                              ),
                              Row(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      color: const Color(0xff011234),
                                      borderRadius: BorderRadius.circular(20.0),
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 7.9,
                                      vertical: 2.5,
                                    ),
                                    child: const Text(
                                      '4',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 14.0,
                                  ),
                                  Expanded(
                                    child: Text(
                                      'eur'.i18n,
                                      maxLines: 5,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14.4,
                                        height: 1.3,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
