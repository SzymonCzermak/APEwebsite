import 'package:flutter/material.dart';
import 'package:apewebsite/widgets/custom_app_bar.dart';
import 'package:apewebsite/models/page_type.dart';

class PrivacyPolicyPage extends StatelessWidget {
  const PrivacyPolicyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(currentPage: PageType.contact),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            constraints: const BoxConstraints(maxWidth: 900),
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 48),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                Text(
                  'Polityka prywatności',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 24),
                Text(

          '''
Wykonując obowiązki administratora danych osobowych określone w art. 13 i 14 Rozporządzenia Parlamentu Europejskiego i Rady (UE) z dnia 27 kwietnia 2016 r. w sprawie ochrony osób fizycznych w związku z przetwarzaniem danych osobowych i w sprawie swobodnego przepływu takich danych oraz uchylenia dyrektywy 95/46/WE (dalej: „Ogólne rozporządzenie o ochronie danych” lub „RODO”) (Dz. Urz. UE L 119 z 04.05.2016) informujmy, że Alvernia Planet Sp. z o.o. z siedzibą w Nieporazie przygotowało poniższą informację dla osób, których dane przetwarza. Celem przekazania przez Alvernia Planet Sp. z o.o. informacji jest umożliwienie Państwu skorzystania z uprawnień określonych w Ogólnym rozporządzeniu o ochronie danych tj. w szczególności z prawa dostępu do danych, prawa do sprostowania danych, usunięcia danych i pozostałych praw określonych w Ogólnym rozporządzeniu o ochronie danych.

Informacja dotycząca przetwarzania danych osobowych przez Alvernia Planet Sp. z o.o. z siedzibą w Nieporazie.

Zgodnie z Rozporządzeniem Parlamentu Europejskiego i Rady (UE) 2016/679 z dnia 27 kwietnia 2016 r. w sprawie ochrony osób fizycznych w związku z przetwarzaniem danych osobowych i w sprawie swobodnego przepływu takich danych oraz uchylenia dyrektywy 95/46/WE, Dziennik Urzędowy UE, L 119/1 z 4 maja 2016 (dalej: Ogólne rozporządzenie o ochronie danych) Alvernia Planet Sp. z o.o. z siedzibą w Nieporazie jako Administrator danych osobowych Pani/Pana, będących osobą fizyczną (osobą, której dane dotyczą), podaje następujące informacje.

1. Dane dotyczące Administratora:
ALVERNIA PLANET spółką z ograniczoną odpowiedzialnością z siedzibą w Nieporazie (adres: ul. Ferdynanda Wspaniałego 1, 32-566 Nieporaz), wpisaną do rejestru przedsiębiorców Krajowego Rejestru Sądowego przez Sąd Rejonowy dla Krakowa-Śródmieścia w Krakowie, XII Wydział Gospodarczy Krajowego Rejestru Sądowego pod nr KRS: 0000718565, tel. 605 132 444,
Adres e-mail: alverniaplanet@gremi.pl

2. Państwa dane osobowe przetwarzane będą w celu:
a) rezerwacji biletów,
b) subskrypcji do newslettera,
c) realizacji zawartych umów świadczenia usługi drogą elektroniczną, na podstawie art. 6 ust. 1 lit. b) Ogólnego rozporządzenia o ochronie danych,
d) wykonania obowiązków prawnych, ciążących na Administratorze, na podstawie art. 6 ust. 1 lit. c) Ogólnego rozporządzenia o ochronie danych
e) dla celów podatkowych i rachunkowych, wynikającego z prawnie uzasadnionych interesów realizowanych przez Administratora, na podstawie art. 6 ust. 1 lit f) Ogólnego rozporządzenia o ochronie danych), to jest:
(a) dla celu marketingu usług i produktów własnych Administratora,
(b) w celu ustalenia, obrony i dochodzenia roszczeń,
(c) dla celów tworzenia zestawień, analiz i statystyk na potrzeby wewnętrzne Administratora, co obejmuje raportowanie, badania marketingowe, planowanie rozwoju usług, tworzenie modeli statystycznych,
(d) dla celów administracyjnych, a także do zapewnienia bezpieczeństwa sieci
i informacji.

3. Odbiorcami Państwa danych osobowych są:
• podmioty wspierające operacyjne wykonywanie Umowy, takie jak: obsługa techniczna urządzeń i produktów służących realizacji Umowy, obsługa faktur, obsługa platform do kontaktów, podmioty prowadzące działalność pocztową i kurierską,
• podmioty świadczące na rzecz Administratora usługi doradcze, konsultacyjne, audytowe, pomoc prawną, podatkową i rachunkową.

4. Dane osobowe będą przechowywane przez okres obowiązywania Umowy, a w zakresie związanym z obroną lub dochodzeniem roszczeń, do czasu przedawnienia roszczeń. Administrator może przechowywać dane osobowe dłużej, ale stanie się tak wyłącznie z uzasadnionych powodów, jeżeli prawo zezwala na takie przechowywanie.

5. Jednocześnie informujemy, że Alvernia Planet Sp. z o.o. z siedzibą w Nieporazie nie wyznaczyło Inspektora Ochrony Danych Osobowych. W sprawach ochrony i realizacji swoich praw w zakresie danych osobowych należy kontaktować się: alverniaplanet@gremi.pl

6. Przysługuje Państwu, w odniesieniu do Państwa danych osobowych, w zakresie
i z zachowaniem wyjątków wynikających z RODO lub innych przepisów prawnych prawo do:
• żądania od Administratora dostępu do danych osobowych,
• żądania od Administratora sprostowania danych osobowych,
• żądania usunięcia danych,
• żądania ograniczenia przetwarzania danych,
• wniesienia sprzeciwu wobec przetwarzania danych osobowych,
• przenoszenia danych w zakresie określonym art. 20 Ogólnego rozporządzenia o ochronie danych,
• wniesienia skargi do Prezesa UODO w razie uznania, że przetwarzanie Państwa danych osobowych narusza przepisy o ochronie danych.

7. Państwa dane mogą być przetwarzane w sposób zautomatyzowany i nie będą profilowane.

8. Podanie danych jest dobrowolne, ale niezbędne dla realizacji wskazanych powyżej celów.
''',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 16,
                    height: 1.5,
                  ),
                  textAlign: TextAlign.justify,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}