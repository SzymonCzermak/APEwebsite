import 'package:flutter/material.dart';
import 'package:apewebsite/widgets/custom_app_bar.dart';
import 'package:apewebsite/models/page_type.dart';

class TermsPage extends StatelessWidget {
  const TermsPage({super.key});

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
  'REGULAMIN REZERWACJI USŁUG\nW OBIEKCIE ALVERNIA PLANET SP. Z O.O.',
  style: TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: Colors.white,
    letterSpacing: 1.2,
  ),
  textAlign: TextAlign.center,
),

                SizedBox(height: 24),
                Text(
          '''
Regulamin rezerwacji usług w obiekcie Alvernia Planet Sp.z o.o.

Regulamin ma zastosowanie dla usług świadczonych przez Alvernia Planet sp. z o.o., w obiekcie zlokalizowanym w Nieporazie przy ul. Ferdynanda Wspaniałego 1, poprzez wskazanie warunków na jakich przebiegać będzie korzystanie przez Użytkownika z rezerwacji online wizyt w obiekcie Alvernia Planet Sp. z o.o.  kierowany jest do wszystkich osób dokonujących rezerwacji za pośrednictwem strony internetowej www.alverniaplanet.bookero.pl

1. DEFINICJE
1.1. Usługodawca – ALVERNIA PLANET spółką z ograniczoną odpowiedzialnością z siedzibą w Nieporazie (adres: ul. Ferdynanda Wspaniałego 1, 32-566 Alwernia), wpisaną do rejestru przedsiębiorców Krajowego Rejestru Sądowego przez Sąd Rejonowy dla Krakowa-Śródmieścia w Krakowie, XII Wydział Gospodarczy Krajowego Rejestru Sądowego pod nr KRS: 0000718565, kapitał zakładowy w wysokości 1.005.000 zł, wpłacony w całości;
NIP 628-227-20-71; REGON 369475792;
1.2. Obiekt – obiekt kubaturowy złożony z 13 kopuł wraz z przyległym, wyznaczonym terenem zlokalizowanym w Nieporazie przy ul. Ferdynanda Wspaniałego 1;
1.3. Regulamin – „Regulamin rezerwacji usług w obiekcie Alvernia Planet Sp. z o.o.”, który jest regulaminem świadczenia usług elektronicznych, o którym mowa w art. 8 ustawy z dnia 18 lipca 2002 r. o świadczeniu usług drogą elektroniczną (Dz. U. z 2019 r., poz. 123). Aktualny regulamin dostępny jest na stronie internetowej Usługodawcy (www.alverniaplanet.bookero.pl);
1.4. Usługi – odpłatne usługi świadczone w Obiekcie przez Usługodawcę na rzecz Użytkowników, na warunkach wskazanych w Regulaminie.
1.4. Klient – osoba fizyczna korzystająca z usług oferowanych przez Usługodawcę na warunkach i przy zastosowaniu zasad przewidzianych w Regulaminie. Osoba fizyczna staje się Klientem wraz z zakupem biletu na skorzystanie z Usług.
1.5. Użytkownik – podmiot, który zawarł z Usługodawcą umowę na świadczenie Usług. Klientem może być Użytkownik, który zawiera umowę w swoim imieniu i na własny rachunek albo podmiot, który zawiera umowę na rzecz podmiotu trzeciego (zorganizowanej grupy);
1.6. Dane osobowe – imię, nazwisko, adres e-mail, data urodzenia, numer telefonu, ID Użytkownika – powierzone Usługodawcy / Administratorowi przy zakupie biletu za pomocą systemu rezerwacyjnego Bookero;
1.7. Administrator danych osobowych – administratorem wszystkich danych osobowych jest Usługodawca / SAFI STUDIO Paweł Nowakowski, Dębina, ul. Spacerowa 25, 05-152 Czosnów, NIP: 531161085, mail: partner@bookero.pl.
1.8. System rezerwacyjny Bookero – system firmy SAFI STUDIO Paweł Nowakowski, Dębina, ul. Spacerowa 25, 05-152 Czosnów, NIP: 5311610855, zainstalowany na serwerze wynajmowany przez Usługodawcę służący do dokonywania rezerwacji wizyt w Alvernia Planet Sp. z o.o. poprzez stronę internetową www.alverniaplanet.bookero.pl

2. USŁUGI
2.1. Usługodawca oferuje na terenie Obiektu następujące Usługi:
2.1.1. zwiedzanie studia filmowego z przewodnikiem
2.1.2. warsztaty edukacyjne poświęcone produkcji filmowej
2.2. Odpłatne Usługi świadczone są według reguł określonych w Regulaminie na warunkach cenowych określonych na stronie internetowej www.alverniaplanet.com lub w cenniku dostępnym w Obiekcie. Ceny podane są w polskich złotych i są cenami brutto (uwzględniają podatek VAT).
2.3. Na zasadach wynikających z niniejszego Regulaminu, Usługodawca świadczy Usługę rezerwacji przez Internet wizyt w Obiekcie.
2.4. Korzystanie z Usługi jest dobrowolne i bezpłatne.
2.5. Usługodawca w celu świadczenia Usługi korzysta z systemu rezerwacyjnego Bookero.

 

3. REZERWACJA USŁUGI
3.1. Do korzystania z Usługi konieczne jest posiadanie adresu poczty elektronicznej oraz numeru telefonu komórkowego. W przypadku grup zorganizowanych rezerwacji dokonuje Klient (np. opiekun, nauczyciel) lub przedstawiciel grupy.
3.2. Rejestracja Użytkownika obejmuje następujące kroki:
a) wybór usługi;
b) wybór ilości osób (Użytkowników);
c) wskazanie terminu (daty) i godziny wśród wyświetlanych dostępnych terminów rezerwacji;
d) akceptacja niniejszego Regulaminu oraz Regulaminu Obiektu;
e) akceptacja Polityki Prywatności;
Użytkownik wprowadza wymagane dane i informacje za pomocą formularza rezerwacyjnego zamieszczonego na stronie internetowej Usługodawcy, w szczególności podaje unikalny adres poczty elektronicznej oraz numer telefonu komórkowego. Użytkownik potwierdza zapoznanie się i akceptację Regulaminu oraz Polityki Prywatności, jak również prawidłowość wprowadzonych danych rezerwacyjnych. Niepotwierdzenie przez Użytkownika zapoznania się i akceptacji treści Regulaminu powoduje przerwanie procedury rezerwacji.
3.3. Rezerwację uznaje się za skuteczną w przypadku, gdy:
3.2.1. Dokonano przedpłaty.
3.2.2. Obsługa Obiektu potwierdziła rezerwację poprzez wysłanie wiadomości e‑mail na podany w toku rezerwacji adres poczty elektronicznej.
3.4. Rezerwacja jest utrzymywana przez 30 minut od ustalonego czasu rozpoczęcia wizyty. Po tym czasie przepada. Zaleca się przybycie 15 minut przed ustalonym terminem rezerwacji.
3.5. Użytkownik może zrezygnować z rezerwacji w każdej chwili jednak nie później niż na 72 godzin przed terminem rezerwacji. Anulowanie rezerwacji z wyprzedzeniem mniejszym niż 72 godzin skutkować będzie zachowaniem przez Usługodawcę wpłaconej przez Użytkownika przedpłaty na poczet rezerwacji. Anulowanie rezerwacji następuje poprzez otwarcie wiadomości e-mail potwierdzającej rezerwację i kliknięcie przycisku „Anuluj rezerwację” lub poprzez kontakt telefoniczny z Obsługą Obiektu pod numerem 605 132 444 lub 723 999 099.
3.6. W przypadku odwołania rezerwacji w czasie krótszym niż 72 godziny – Usługodawca uprawniony jest do zachowania 100% przedpłaconej opłaty.
3.7. Zrezygnowanie z rezerwacji, o której mowa w punkcie powyżej jest równoznaczne z rozwiązaniem Umowy z Administratorem.

 

4. WARUNKI
4.1. Obiekt otwarty jest w godzinach wskazanych na stronie internetowej www.alverniaplanet.com w dniach od poniedziałku do piątku. W przypadku najmu powierzchni Obiektu na eventy lub plany filmowe – Usługodawca poinformuje o niedostępności Usług na stronie internetowej.
4.2. Dopuszczenie Klientów do skorzystania z Usług możliwe jest tylko w zorganizowanych grupach (od 30 do 50 osób) pod opieką przewodnika.
4.3. Osoby poniżej 13 roku życia mogą skorzystać z Usługi wyłącznie w obecności i pod nadzorem opiekuna, który to złoży w stosunku do nich oświadczenia o zapoznaniu się i akceptacji Regulaminu świadczenia usług w Obiekcie. Opiekun taki musi również wypełnić we własnym imieniu oświadczenie.
4.4. Grupy osób niepełnoletnich zgłaszane są przez opiekuna grupy. Korzystanie z Obiektu odbywa się pod jego wyłączną opieką i na wyłączną odpowiedzialność opiekuna.
4.5. Świadczenie Usług odbywa się odpłatnie – zgodnie z cenami wskazanymi na stronie (www.alverniaplanet.com) oraz w Obiekcie.
4.6. Na teren Obiektu nie można wnosić posiłków i napojów.
4.7. Przed przystąpieniem do zajęć edukacyjnych, uczestnicy są zobowiązani do pozostawienia
telefonów komórkowych, aparatów fotograficznych oraz wszelkich urządzeń umożliwiających
robienie zdjęć/nagrywania w miejscu wskazanym przez Usługodawcę.

5. ODPOWIEDZIALNOŚĆ UŻYTKOWNIKÓW
5.1. Za wszelkie uszkodzenia sprzętów znajdujących się w Obiekcie, powstałe w trakcie korzystania z Usługi odpowiedzialny jest Klient. Usługodawca uprawniony jest również do rekompensaty za szkody spowodowane uszkodzeniem, które uniemożliwiło mu wykorzystanie Obiektu w określonym czasie (nieosiągnięte korzyści).
5.2. Usługodawca nie odpowiada za przedmioty wartościowe pozostawione bez opieki w Obiekcie przez osoby korzystające z Obiektu.
5.3. Usługodawca udostępnia miejsce, w którym Klient może samodzielnie pozostawić okrycia wierzchnie. Usługodawca nie przyjmuje tych okryć na przechowanie, a wyłącznie udostępnia przestrzeń do ich umieszczenia.
5.4. Wyłącznie odpowiedzialnym za szkody powstałe u innych Klientów lub osób trzecich, a które nastąpiły w wyniku działania lub zaniechania Klienta jest Klient/Użytkownik.
5.5. W związku z korzystaniem z systemu rezerwacyjnego Bookero, Użytkownik zobowiązany jest do:
a. przestrzegania postanowień Regulaminu,
b. przestrzegania wszelkich przepisów prawa oraz powszechnie obowiązujących zasad korzystania z sieci internetowej,
c. prawidłowego o określenia i aktualizowania danych Użytkownika, w tym w szczególności adresu poczty elektronicznej i numeru telefonu komórkowego,
d. niezwłocznego informowania Usługodawcy o wszelkich ewentualnych naruszeniach bezpieczeństwa i problemach związanych z funkcjonowaniem lub korzystaniem z Usługi,
e. nieprowadzenia jakichkolwiek działań zagrażających bezpieczeństwu systemu rezerwacji Bookero lub systemów komputerowych osób trzecich albo naruszających te systemy,
f. niewykorzystywania systemu rezerwacji Bookero bezpośrednio lub pośrednio do prowadzenia jakichkolwiek działań sprzecznych z prawem lub naruszających prawa osób trzecich.
5.6. Użytkownik zobowiązany jest w szczególności do korzystania z systemu rezerwacji Bookero w sposób nie wywołujący zakłóceń w jej działaniu oraz w sposób nieuciążliwy dla pozostałych Użytkowników, Usługodawcy oraz Administratora, z poszanowaniem ich dóbr osobistych oraz innych przysługujących im praw.
5.7. W razie stwierdzenia naruszeń, o których mowa w ust. 5.5-5.6. powyżej Usługodawca uprawniony jest do natychmiastowego zakończenia świadczenia Usługi drogą elektroniczną, poprzez przesłanie Użytkownikowi informacji o anulacji dokonanej rezerwacji za pośrednictwem konta poczty elektronicznej Użytkownika (e-mail), z którego nastąpiło dokonanie rezerwacji w systemie rezerwacji Bookero.
5.8. W związku z korzystaniem z Usługi, Użytkownik:
a. oświadcza, iż podane przez niego podczas rezerwacji dane są aktualne i zgodne z prawdą, a w przypadku ich zmiany zobowiązuje się do ich niezwłocznej aktualizacji,
b. może wyrazić zgodę na prezentowane przez Usługodawcę w ramach newslettera materiały reklamowe, informacyjne, promocyjne pochodzące od Usługodawcy.
5.9. Usługodawca wyłącza swoją odpowiedzialność za niemożliwość świadczenia Usług, które spowodowane zostało zdarzeniami obiektywnie uznanymi za siłę wyższą (zdarzenie zewnętrzne, niemożliwe do przewidzenia), jak również zdarzeniami niewynikającymi z prawidłowego prowadzenia działalności gospodarczej przez Usługodawcę takimi jak np:
5.9.1. awaria systemu informatycznego spowodowana działaniem złośliwego oprogramowania;
5.9.2. przerwa w dostępie do usług ciągłych (np. Internet, prąd);
5.9.3. dewastacja lub uszkodzenie wyposażenia Obiektu przez podmiot trzeci;
5.9.4. krytyczna awaria techniczna instalacji wewnętrznych, sprzętu lub oprogramowania;

6. OBSŁUGA OBIEKTU
6.1. Pracownicy Obiektu odpowiedzialni są za utrzymywanie ładu i porządku na jego terenie oraz do reagowania w sytuacjach mogących zagrażać jakimkolwiek dobrom osobistym KLIENTA.
6.2. Klienci zobowiązani są do przestrzegania poleceń i wytycznych pracowników Obiektu – a w tym tych związanych z zapewnieniem bezpieczeństwa lub wadliwym wykorzystywaniem sprzętu.
6.3. Dla zapewnienia bezpieczeństwa Klientom, na terenie Obiektu może być rejestrowany obraz za pomocą kamer telewizji przemysłowej.
6.4. W przypadku nieprzestrzegania Regulaminu, zachowań godzących w jakiekolwiek dobra osobiste innych Klientów lub też niszczenia mienia Usługodawcy – Klient może być zobowiązany do natychmiastowego opuszczenia Obiektu, po uprzednim ostrzeżeniu skierowanym do niego przez przewodnika lub pracownika obsługi.
6.5. W przypadku wskazanym w pkt 6.4. Klient/Użytkownik nie otrzyma zwrotu uiszczonej przez
niego opłaty za Usługę.
6.6. W przypadku wystąpienia nieplanowanego braku dostępu do Obiektu lub wskutek awarii systemu rezerwacji Bookero uniemożliwiający rezerwacje wizyty przez Użytkownika, Usługodawca zobowiązany będzie do podjęcia odpowiednich działań zmierzających do przywrócenia funkcjonalności.
6.7. Usługodawca nie ponosi jednak odpowiedzialności za brak możliwości korzystania przez Użytkownika z Usługi oraz jakiekolwiek szkody Użytkownika spowodowanej brakiem dostępu do systemu rezerwacji Bookero, awarią łączy telekomunikacyjnych, poza przypadkami, gdy do takiego zdarzenia doszłoby z winy umyślnej Usługodawcy.
6.8. Usługodawca zastrzega sobie prawo do zablokowania adresu poczty elektronicznej Użytkownika, który naruszył postanowienia niniejszego Regulaminu lub przepisy prawa.
6.9. Usługodawca nie gwarantuje nieprzerwanego świadczenia Usługi. W szczególności Usługodawca nie ponosi odpowiedzialności za przerwę w świadczeniu Usługi spowodowaną przyczynami technicznymi leżącymi po stronie Użytkownika lub podmiotu trzeciego, w tym SAFI STUDIO Paweł Nowakowski.

7. PRAWO ODSTĄPIENIA OD UMOWY
7.1. Umowa zostaje zawarta z chwilą zakończenia procedury dokonania rezerwacji Użytkownika na czas nieoznaczony.
7.2. Użytkownik może w terminie nie później niż na 3 dni robocze przed wykonaniem usługi odstąpić od Umowy, bez podania jakiejkolwiek przyczyny.
7.3. Oświadczenie odstąpienia od Umowy powinno być wysłane drogą elektroniczną na adres e-mail: alverniaplanet@gremi.pl
7.4. Usługodawca niezwłocznie prześle Użytkownikowi na podany przez niego adres e-mail potwierdzenie otrzymania oświadczenia o odstąpieniu od Umowy.
7.5. Skutki odstąpienia od Umowy:
7.5.1 W przypadku odstąpienia od Umowy zawartej na odległość Umowę uważa się za niezawartą.
7.5.2 W przypadku odstąpienia od Umowy Usługodawca zwraca Użytkownikowi niezwłocznie, nie później, niż w terminie 14 dni od dnia otrzymania oświadczenia Użytkownika o odstąpieniu od Umowy, dokonane przez niego płatności.
7.5.3 Zwrotu płatności Usługodawca dokona przy użyciu takich samych metod płatności, jakie zostały przez Użytkownika użyte w pierwotnej transakcji, chyba że Użytkownik wyraźnie zgodził się na inne rozwiązanie, które nie będzie się wiązało dla niego z żadnymi kosztami.

8. REKLAMACJE
8.1. Użytkownik może złożyć reklamacje związane z wykonywaniem lub niewłaściwym wykonywaniem Usług lub reklamację co do usług świadczonych przez Administratora.
8.2. Reklamacje związane ze świadczeniem Usługi należy składać elektronicznie na adres poczty elektronicznej Usługodawcy: alverniaplanet@gremi.pl
8.3. Reklamacja powinna zawierać następujące dane Użytkownika:
• imię i nazwisko,
• adres poczty elektronicznej podany przy rejestracji,
• oraz opis problemu, jaki pojawił się w związku z korzystaniem z Usługi.
Jeżeli podane w reklamacji dane lub informacje wymagają uzupełnienia, przed rozpatrzeniem reklamacji Usługodawca zwraca się do Użytkownika o jej uzupełnienie we wskazanym zakresie.
8.4. Reklamacje będą rozpatrywane wedle kolejności ich wpływu do Usługodawcy
8.5. Usługodawca rozpatrzy reklamację w terminie do 14 dni roboczych od dnia jej otrzymania. W przypadku niewskazania przez Użytkownika wszystkich wymaganych informacji lub niedołączenia wszystkich wymaganych dokumentów, Usługodawca przed podjęciem decyzji co do sposobu załatwienia reklamacji zwróci się do Użytkownika o przekazanie brakujących informacji i/lub dokumentów. Termin rozpatrzenia reklamacji ulega wówczas wydłużeniu do 14 od dnia przekazania kompletnej informacji i/lub dokumentów.
8.6. Niezwłocznie po rozpatrzeniu reklamacji, Usługodawca udzieli Użytkownikowi odpowiedzi w sprawie reklamacji. Odpowiedź zostanie przesłana w takiej samej formie, w jakiej złożona została reklamacja, tj. na adres poczty elektronicznej Użytkownika podany przez niego w reklamacji.
8.7. Reklamacje dotyczące płatności elektronicznych rozpatruje serwis przelewy24.pl.

9. POSTANOWIENIA KOŃCOWE
9.1. W sprawach nieuregulowanych Regulaminem zastosowanie mają odpowiednie postanowienia ustawy kodeks cywilny.
9.2. W związku z faktem, że do prawidłowej realizacji Usług konieczne jest przetwarzanie następujących danych osobowych: Imię, Nazwisko, data urodzenia, adres e-mail, numer telefonu, ID Użytkownika, które to powierzone zostaną Usługodawcy w procesie rezerwacji – Usługodawca staje się administratorem danych osobowych wprowadzonych do systemu rezerwacji.
9.3. Użytkownik wyraża zgodę na przetwarzanie jego danych osobowych w celu niezbędnym do realizacji łączącej go z Usługodawcą umowy i umów przyszłych. Formularz rezerwacji zawiera odpowiednie klauzule zgody na przetwarzanie danych osobowych.
9.4. Dane osobowe Użytkownika lub Klient zbierane są przez Usługodawcę za pośrednictwem strony podczas dokonywania rezerwacji w celu realizacji Umowy wykonania usługi.
9.5. Jeżeli Użytkownik lub Klient wyrazi na to zgodę na stronie internetowej podczas dokonywana rezerwacji, jego dane osobowe zbierane przez Usługodawcę mogą być wykorzystane w celach marketingowych.
9.6. W przypadku Usługobiorcy, który korzysta na stronie ze sposobu płatności elektronicznych lub kartą płatniczą Usługodawca udostępnia zebrane dane osobowe Usługobiorcy, wybranemu podmiotowi obsługującemu powyższe płatności w systemie rezerwacyjnym Bookero.
9.7. Podanie danych osobowych jest dobrowolne, aczkolwiek niepodanie wskazanych w Regulaminie danych osobowych niezbędnych do zawarcia Umowy wykonania usługi skutkuje brakiem możliwości zawarcia tejże umowy.
9.8. Usługodawca uprawniony jest do wykonywania fotografii, filmowania, przesyłania obrazu wskazującego użytkowanie Obiektu przez Użytkowników. Materiały te mogą być następnie publikowane na stronie internetowej Usługodawcy lub innych nośnikach treści.
9.9. Administratorem danych osobowych powierzonych do przetwarzania jest SAFI STUDIO / Usługodawca. Użytkownik lub Klient ma prawo dostępu do treści swoich danych oraz ich poprawiania.
9.10. Usługodawca zastrzega sobie prawo do dokonywania zmian Regulaminu z ważnych przyczyn to jest: zmiany przepisów prawa, zmiany sposobu i zakresu użytkowania Obiektu, zmiany sposobów płatności – w zakresie, w jakim te zmiany wpływają na realizację postanowień niniejszego Regulaminu. O każdej zmianie Usługodawca poinformuje Użytkownika lub Klienta z wyprzedzeniem, poprzez zamieszczenie informacji na stronie www.alverniaplanet.com i w Obiekcie.
10.11. Spory pomiędzy Klientem lub Użytkownikiem, a Usługodawcą wynikłe w związku z świadczeniem przez Usługodawcę Usług lub Usług dodatkowych rozstrzygane będą przez sąd powszechny właściwy dla siedziby Usługodawcy.

10. DANE KONTAKTOWE
Użytkownik lub Klient może porozumiewać się z Usługodawcą za pomocą adresów podanych w niniejszym paragrafie.
Adres Obiektu: ul. Ferdynanda Wspaniałego 1, Nieporaz, 32-566 Alvernia
Adres e-mail: alverniaplanet@gremi.pl
Telefon: 723 999 099, 605 132 444
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