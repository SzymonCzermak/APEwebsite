import 'package:flutter/material.dart';
import 'package:apewebsite/widgets/custom_app_bar.dart';
import 'package:apewebsite/models/page_type.dart';

class ChildrenProtectionPage extends StatelessWidget {
  const ChildrenProtectionPage({super.key});

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
  'STANDARDY OCHRONY MAŁOLETNICH – WERSJA PEŁNA\nW ALVERNIA PLANET SP. Z O.O. Z SIEDZIBĄ W NIEPORAZIE',
  style: TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.bold,
    color: Colors.white,
    letterSpacing: 1.1,
  ),
  textAlign: TextAlign.center,
),

                SizedBox(height: 24),
                Text(
          '''
Rozdział 1

Postanowienia ogólne

§ 1

Standardy Ochrony Małoletnich w Alvernia Planet Sp. z o.o. w Nieporazie, zwane dalej „Standardami” określają:
1) zasady bezpiecznej rekrutacji pracowników (personelu);

2) zasady zapewniające bezpieczne relacje między małoletnim a personelem AP lub organizatora, a w szczególności zachowania niedozwolone wobec małoletnich;

3) zasady i procedurę podejmowania interwencji w sytuacji podejrzenia krzywdzenia lub posiadania informacji o krzywdzeniu małoletniego;

4) procedury i osoby odpowiedzialne za składanie zawiadomień o podejrzeniu popełnienia przestępstwa na szkodę małoletniego, zawiadamianie sądu opiekuńczego oraz w przypadku instytucji, które posiadają takie uprawnienia, osoby odpowiedzialne za wszczynanie procedury „Niebieskie Karty”;

5) zasady przeglądu i aktualizacji standardów;

6) zakres kompetencji osoby odpowiedzialnej za przygotowanie personelu AP lub organizatora do stosowania standardów, zasady przygotowania tego personelu do ich stosowania oraz sposób dokumentowania tej czynności;

7) zasady i sposób udostępniania rodzicom albo opiekunom prawnym lub faktycznym oraz małoletnim standardów do zaznajomienia się z nimi i ich stosowania;

8) osoby odpowiedzialne za przyjmowanie zgłoszeń o zdarzeniach zagrażających małoletniemu i udzielenie mu wsparcia;

9) sposób dokumentowania i zasady przechowywania ujawnionych lub zgłoszonych incydentów lub zdarzeń zagrażających dobru małoletniego.

Ponadto Standardy określają:
1) wymogi dotyczące bezpiecznych relacji między małoletnimi, a w szczególności zachowania niedozwolone;

2) zasady korzystania z urządzeń elektronicznych z dostępem do sieci Internet;

3) procedury ochrony dzieci przed treściami szkodliwymi i zagrożeniami w sieci Internet oraz utrwalonymi w innej formie;

4) Zakres zadań poszczególnych pracowników AP w przypadku podejrzenia lub uzyskania informacji, że dziecko jest krzywdzone.

 

§ 2

Ilekroć w niniejszych Standardach jest mowa bez bliższego określenia o:

1) AP – należy rozumieć przez to Alvernia Planet Sp. z o.o. z siedzibą w Nieporazie (KRS 0000718565);

2) dziecku, małoletnim lub uczestniku – należy rozumieć osoby do ukończenia 18 roku życia, którzy są uczestnikami zajęć organizowanych przez AP, przy czym czytając niniejszy akt należy uwzględniać w odniesieniu do ww. osób również klasyfikację prawną, zgodnie z którą:

a) w zakresie postępowania dotyczącego zapobiegania i zwalczania demoralizacji, osoba która nie ukończyła 18 lat określana jest jako osoba nieletnia,
b) w zakresie postępowania o czyny karalne małoletni jest to osoba, która dopuściła się takiego czynu po ukończeniu 13 lat, a przed ukończeniem lat 17,
c) w zakresie wykonywania środków wychowawczych lub poprawczych małoletnim jest osoba, względem której takie środki zostały orzeczone (choćby ukończyła ona 18 lat), nie dłużej jednak niż do osiągnięcia wieku 21 lat.
3) wolontariuszu - należy przez to rozumieć wyłącznie osobę w wieku powyżej 13 roku życia, przy czym umowę z wolontariuszem w wieku poniżej 18 roku życia zawiera się za uprzednią zgodą jego rodzica;

4) rodzicach – rozumie się przez to także opiekunów prawnych oraz inne osoby, którym sąd powierzył sprawowanie opieki nad dzieckiem;

5) opiekunie – należy rozumieć przez to opiekuna prawnego w rozumieniu art. 145-177 ustawy z dnia 25 lutego 1964 r. Kodeks rodzinny i opiekuńczy, którym sąd powierzył sprawowanie opieki nad dzieckiem, a także osoby przez nich upoważnione;

6) osobie najbliższej dziecku „wychowankowi” – należy przez to rozumieć osobę wstępną: matkę, ojca, babcię, dziadka; rodzeństwo: siostrę, brata, w tym rodzeństwo przyrodnie, a także inne osoby pozostające we wspólnym gospodarstwie, a w przypadku jej braku – osobę pełnoletnią wskazaną przez małoletniego;

7) personelu – należy rozumieć przez to wszystkie osoby zatrudnione w AP na podstawie umowy o pracę lub umowy cywilnoprawnej, praktykantów, stażystów, wolontariuszy oraz pracowników podmiotów świadczących na rzecz AP usługi w zakresie ochrony obiektu i utrzymania czystości;

8) pracowniku lub współpracowniku - rozumie się przez to każdą osobę zatrudnioną na podstawie umowy o pracę lub umowy zlecenia, a także stażystę, wolontariusza i praktykanta;

9) Kierowniku – należy przez to rozumieć Zarząd AP;

10) organizatorze - rozumie się przez to innych, niż AP organizatorów w zakresie działalności  kulturalnej, w tym związanej z edukacją, wypoczynkiem, rozrywką, rekreacją lub realizacją innych

zainteresowań przez małoletnich lub z opieką nad nimi;

11) zgodzie opiekuna małoletniego – należy przez to rozumieć zgodę co najmniej jednego z rodziców małoletniego. Jednak w przypadku braku porozumienia między opiekunami małoletniego należy poinformować ich o konieczności rozstrzygnięcia sprawy przez sąd rodzinny;

12) krzywdzeniu małoletniego – należy rozumieć popełnienie czynu zabronionego lub czynu karalnego na szkodę małoletniego przez jakąkolwiek osobę, w tym członka personelu AP lub zagrożenie dobra małoletniego, w tym jego zaniedbywanie;

13) danych osobowych małoletniego należy przez to rozumieć wszelkie informacje umożliwiające identyfikację małoletniego;

14) osobie odpowiedzialnej za Standardy Ochrony Małoletnich – należy przez to rozumieć wyznaczonego przez Dyrektora pracownika sprawującego nadzór nad realizacją niniejszych Standardów;

15) osobie odpowiedzialnej za Internet – należy przez to rozumieć wyznaczonego przez Kierownika pracownika, sprawującego nadzór nad korzystaniem z Internetu przez uczestników na terenie AP oraz nad bezpieczeństwem małoletnich w Internecie.

16) Kodeksie karnym lub kk – należy przez to rozumieć ustawę z dnia 6 czerwca 1997 r. - Kodeks karny;

17) Kodeksie postępowania karnego lub kpk - należy przez to rozumieć ustawę z dnia z dnia 6 czerwca 1997 r. Kodeks postępowania karnego;

18) Kodeksie postępowania cywilnego lub kpc - należy przez to rozumieć ustawę z dnia 17 listopada 1964 r. Kodeks postępowania cywilnego;

19) Ustawie o przeciwdziałaniu przemocy domowej - należy przez to rozumieć ustawę z dnia z dnia 29 lipca 2005 r. o przeciwdziałaniu przemocy domowej;

20) Ustawie o wspieraniu i resocjalizacji nieletnich - należy przez to rozumieć ustawę z dnia 9 czerwca 2022 r. o wspieraniu i resocjalizacji nieletnich.

 

Rozdział 2

Zasady bezpiecznej rekrutacji pracowników (personelu)

 

§ 3

Dyrektor, przed nawiązaniem z osobą stosunku pracy lub przed dopuszczeniem osoby do innej działalności związanej z wychowaniem, edukacją, wypoczynkiem, leczeniem uczniów lub z opieką nad nimi, zobowiązany jest do uzyskania informacji, czy dane tej osoby są zamieszczone w Rejestrze z dostępem ograniczonym lub Rejestrze osób, w stosunku do których Państwowa Komisja do spraw przeciwdziałania wykorzystaniu seksualnemu małoletnich poniżej lat 15 wydała postanowienie o wpisie w Rejestr.
Kierownik uzyskuje informacje z Rejestru z dostępem ograniczonym za pośrednictwem systemu teleinformatycznego prowadzonego przez Ministra Sprawiedliwości. W pierwszej kolejności należy założyć konto w systemie teleinformatycznym. Konto podlega aktywacji dokonywanej przez biuro informacji.
Rejestr osób, w stosunku do których Państwowa Komisja do spraw przeciwdziałania wykorzystaniu seksualnemu małoletnich poniżej lat 15 wydała postanowienie o wpisie w Rejestr, jest ogólnodostępny - nie wymaga zakładania konta.
Informacje zwrotne otrzymane z systemu teleinformatycznego Kierownik drukuje i składa do części A akt osobowych, związanych z nawiązaniem stosunku pracy. To samo dotyczy Rejestru osób, w stosunku do których Państwowa Komisja do spraw wyjaśniania przypadków czynności skierowanych przeciwko wolności seksualnej i obyczajności wobec małoletniego poniżej lat 15, wydała postanowienie o wpisie w Rejestr. Przy czym w przypadku tego drugiego Rejestru wystarczy wydrukować stronę internetową, na której widnieje komunikat, że dana osoba nie figuruje w rejestrze.
Jeśli dla osoby do innej działalności, o której mowa w ust. 1 nie tworzy się pracowniczej teczki akt osobowych, wydruk z systemu teleinformatycznego zamieszcza się w utworzonej do tego celu odrębnej dokumentacji.
Kierownik od kandydata na pracownika pobiera informację z Krajowego Rejestru Karnego o niekaralności.
Jeżeli kandydat na pracownika posiada obywatelstwo inne niż polskie, wówczas powinien przedłożyć również informację z rejestru karnego państwa, którego jest obywatelem, uzyskiwaną do celów działalności zawodowej lub wolontariackiej związanej z kontaktami z małoletnimi, bądź informację z rejestru karnego, jeżeli prawo tego państwa nie przewiduje wydawania informacji dla wyżej wymienionych celów.
Kierownik pobiera od kandydata na pracownika oświadczenie o państwie/państwach (innych niż Rzeczypospolita Polska), w których kandydat zamieszkiwał w ostatnich 20 latach. Kandydat składa takie oświadczenie pod rygorem odpowiedzialności karnej.
Jeżeli prawo państwa, z którego ma być przedłożona informacja o niekaralności nie przewiduje wydawania takiej informacji lub nie prowadzi rejestru karnego, wówczas kandydat składa, pod rygorem odpowiedzialności karnej, oświadczenie o tym fakcie wraz z oświadczeniem, że nie był prawomocnie skazany oraz nie wydano wobec niego innego orzeczenia, w którym stwierdzono, iż dopuścił się takich czynów zabronionych, oraz że nie ma obowiązku wynikającego z orzeczenia sądu, innego uprawnionego organu lub ustawy, stosowania się do zakazu zajmowania wszelkich lub określonych stanowisk, wykonywania wszelkich lub określonych zawodów albo działalności,
związanych z wychowaniem, edukacją, wypoczynkiem, leczeniem, świadczeniem porad psychologicznych, rozwojem duchowym, uprawianiem sportu lub realizacją innych zainteresowań przez małoletnich, lub z opieką nad nimi.

Pod oświadczeniami składanymi pod rygorem odpowiedzialności karnej składa się oświadczenie o następującej treści: „Jestem świadomy/a odpowiedzialności karnej za złożenie fałszywego oświadczenia.” Oświadczenie to zastępuje pouczenie organu o odpowiedzialności karnej za złożenie fałszywego oświadczenia.
Wzory oświadczeń dotyczących obywatelstwa/obywatelstw oraz zamieszkiwania w ciągu 20 lat oraz oświadczenia o niekaralności oraz o toczących się postępowaniach przygotowawczych, sądowych i dyscyplinarnych określa załącznik 1 do niniejszych Standardów.
W sytuacji podejmowania przez AP współpracy z organizatorem w zakresie działalności
związanej z wychowaniem, edukacją, realizacją zainteresowań przez małoletnich, lub z opieką nad

nimi to na organizatorze ciąży obowiązek zapewnienia bezpiecznej rekrutacji pracowników (personelu) poprzez zastosowanie procedur określonych w ust. 1 – 12.

Organizator zastosowanie bezpiecznej rekrutacji pracowników (personelu) poprzez zastosowanie procedur określonych w ust.1 – 12 potwierdza stosownym pisemnym oświadczeniem przedłożonym Kierownikowi AP.
Za realizację obowiązków, o których mowa w ust. 1-14 odpowiada Kierownik, który może upoważnić do tego innego pracownika.
 

Rozdział 3

Zasady zapewniające bezpieczne relacje między małoletnim a personelem AP, a w szczególności zachowania niedozwolone wobec małoletnich

 

§ 4

Małoletni mają prawo do bycia traktowanymi przez pracowników z jednakową troską.
Pracownicy obowiązani są do utrzymywania profesjonalnej relacji z małoletnimi i każdorazowego rozważenia, czy reakcja, komunikat bądź działanie wobec małoletniego są adekwatne do sytuacji, bezpieczne, uzasadnione i sprawiedliwe.
Pracownicy obowiązani są do działania w sposób otwarty i przejrzysty dla innych, aby zminimalizować ryzyko błędnej interpretacji zachowania.
Nie do zaakceptowania jest faworyzowanie pojedynczych osób przez członków personelu, wyrażane werbalnie czy niewerbalnie.
Stosowanie przez personel kar cielesnych wobec małoletnich nie jest dozwolone w żadnych okolicznościach i od reguły tej nie ma wyjątków.
Nie może być ze strony personelu tolerancji wobec jakiegokolwiek zachowania, które może zostać odczytane jako znęcanie się lub dokuczanie, zarówno ze strony dorosłych jak i samych małoletnich.
 

§ 5

Pracownicy i organizatorzy:

1) równo traktują każdego małoletniego bez względu na jego pochodzenie, wygląd, przekonania, wyznanie, kolor skóry;

2) odnoszą się z szacunkiem do jego innych przekonań, innych doświadczeń, innej perspektywy wynikającej z bycia małoletnim;

3) wysłuchują małoletniego z uwagą i traktują jego wypowiedzi i przedstawioną wersję zdarzeń z należytą powagą;

4) w komunikacji z małoletnim używają języka pozbawionego ocen, etykiet, dostosowanego do poziomu rozwoju małoletniego;

5) odnoszą się do małoletniego z szacunkiem, wydając ewentualne polecenia rzeczowo, jasno i konkretnie,

6) tworzą kulturę otwartości i wzajemnej odpowiedzialności sprzyjającej zgłaszaniu i omawianiu wszelkich zagadnień i problemów dotyczących ochrony dzieci.

 

§ 6

Niedozwolone są następujące zachowania pracowników i organizatorów wobec małoletnich:
1) wszelkie zachowania, które mają znamiona innych form przemocy psychicznej, fizycznej lub wykorzystywania seksualnego;

2) wszelkie zachowania, które zawstydzają, upokarzają, deprecjonują lub poniżają;

3) niestosowny kontakt fizyczny z małoletnim, naruszający godność. Dopuszczalny kontakt fizyczny powinien być w naturalny sposób związany z zabawą, ewentualną pomocą małoletniemu w czynnościach higienicznych, koniecznością zapewnienia dziecku bezpieczeństwa, lub ewentualną potrzebą uspokojenia dziecka;

4) akceptowanie bądź uczestniczenie w nielegalnych czynnościach, w które angażowane jest dziecko;

5) nawiązywanie z dzieckiem relacji o charakterze romantycznym, czy seksualnym;

6) zachowywanie się w sposób seksualnie prowokacyjny;

Nie do zaakceptowania jest werbalne i niewerbalne naruszanie dobra małoletnich przez personel lub
organizatora; obejmuje to używanie wulgarnych słów, gestów, żartów, czynienie obraźliwych uwag

czy wykorzystywanie wobec małoletniego relacji władzy lub przewagi fizycznej.

Pod żadnym pozorem personel lub organizator nie może częstować małoletnich podopiecznych alkoholem, papierosami, środkami odurzającymi (w tym narkotykami) lub tolerować ich używania.
W pracy z małoletnimi personel lub organizator powinien używać środków, języka i metod adekwatnych do wieku wychowanków. Podobnie powinien być potraktowany przekaz medialny, np. przez telefon komórkowy, Internet, wideo itp. W żadnym jednak wypadku nie wolno wykorzystywać materiałów pornograficznych lub zawierających treści obsceniczne.
Pracownicy nie kontaktują się prywatnymi kanałami komunikacji z małoletnimi (prywatny telefon, e-mail, komunikatory, profile w mediach społecznościowych), w szczególności nie nawiązują kontaktów z małoletnimi poprzez przyjmowanie bądź wysyłanie do nich zaproszeń w mediach społecznościowych.
Jeśli zachodzi taka konieczność, właściwą formą komunikacji z małoletnimi poza godzinami pracy są kanały służbowe (e-mail, telefon służbowy).
Nie jest dozwolone ujawnianie informacji wrażliwych dotyczących małoletniego wobec osób nieuprawnionych, w tym wobec małoletnich.
Nie jest dozwolone utrwalanie wizerunku małoletniego dla celów prywatnych poprzez filmowanie, nagrywanie, fotografowanie. Zakaz ten obejmuje także udostępnianie wizerunku małoletniego osobom trzecim. Wyjątkiem jest utrwalanie wizerunku na potrzeby Filharmonii, na podstawie zgody udzielonej opiekunów prawnych.
 

§ 7

Personel i organizator jest zobowiązany do szacunku dla nietykalności cielesnej, intymności i prywatności małoletniego.
Personel i organizator zawsze winien wykazywać daleko idącą troskę o integralność i nienaruszalność cielesną każdego małoletniego.
Wchodzenie w jakikolwiek kontakt dotykowy z małoletnim musi iść w parze z najdalej posuniętą roztropnością i rozwagą. Obowiązuje tu ogólna zasada prymatu „braku nad nadmiarem”.
Właściwym zachowaniem respektującym nietykalność małoletniego jest:
1) poklepanie po ramionach lub plecach;

2) uścisk dłoni lub „danie sobie piątki”;

3) delikatne objęcie na powitanie;

4) dotykanie rąk, ramion czy barków;

5) werbalne pochwalenie;

6) trzymanie się za ręce w czasie zabawy czy dla uspokojenia małoletniego w sytuacji wzburzenia emocjonalnego;

7) trzymanie za ręce dzieci w czasie spaceru;

8) siadanie w pobliżu małych dzieci.

Zawsze właściwym jest zapytanie małoletniego o pozwolenie na rodzaj zachowania, o którym mowa w ust.4.
 

§ 8

Niewłaściwym zachowaniem i nadużyciem wobec nietykalności małoletniego są:
1) wszelkie formy okazywania niechcianej czułości;

2) pełne i mocne uściski i objęcia, tzw. „niedźwiadki”;

3) dotykanie piersi, pośladków i okolic intymnych;

4) klepanie w uda lub kolana;

5) łaskotanie lub „mocowanie się” w silnym objęciu;

6) obejmowanie młodocianego, stojąc za jego placami;

7) masaże;

8) okazywanie czułości w miejscach wyizolowanych, np. łazienki, ubikacje, prywatne pokoje;

9) komplementowanie odnoszące się do rozwoju fizycznego.

Należy eliminować wszelkie gry i zabawy, w których dochodzi do opisanych w ust. 1 niewłaściwych zachowań, w szczególności gdy używa się wyszczególnionych form dotyku.
W uzasadnionych przypadkach dopuszczalny jest kontakt fizyczny pracownika z małoletnim. Do sytuacji takich zaliczyć można:
1) pomoc małoletniemu niepełnosprawnemu w czynnościach higienicznych, jeśli typ niepełnosprawności tego wymaga, a małoletni i jego opiekun wyrazi zgodę;

2) pomoc małoletniemu niepełnosprawnemu w spożywaniu posiłków;

3) pomoc małoletniemu niepełnosprawnemu w poruszaniu się po obiektach AP.

 

§ 9

Małoletnim przysługuje prawo do prywatności. W szczególny sposób prawo to winno być respektowane w takich miejscach jak łazienki i toalety. W wymienionych wyżej miejscach personel nie może w żaden sposób ingerować w prywatność małoletnich, w tym zwłaszcza wykonywać małoletnim zdjęć. Personel winien także zadbać, by w powyższych miejscach zdjęć nie robili sobie nawzajem sami małoletni. To samo dotyczy produkcji materiałów filmowych.
Na fotografowanie małoletnich w innych sytuacjach i upublicznianie ich zdjęć personel musi uprzednio uzyskać pisemną zgodę rodziców lub opiekunów prawnych oraz zgodę Kierownika . To samo dotyczy produkcji materiałów filmowych.
Personel nie może wyręczać małoletnich ani pomagać im w czynnościach natury osobistej (toaleta, mycie się, przebieranie itp.), o ile dzieci są w stanie wykonać te czynności samodzielnie.
Personel nie może się obchodzić z małoletnim niewłaściwie, w tym szorstko go traktować, czy żartować nieprzyzwoicie. Dystans w kontakcie ma stworzyć poczucie bezpieczeństwa i zapewnić małoletniemu dobre samopoczucie.
 

§ 10

Wszelkie podejrzenia dotyczące nieodpowiednich zachowań pracowników AP wobec małoletnich są bezzwłocznie wyjaśniane przez Kierownika, a w przypadku nieodpowiednich zachowań Kierownika – przez organ prowadzący AP.
Nieprzestrzeganie zasad postępowania traktowane jest jako naruszenie podstawowych obowiązków pracowniczych z wszystkimi wynikającymi stąd konsekwencjami, z rozwiązaniem stosunku pracy włącznie.
 

§ 11

Nieprzestrzeganie zasad postępowania traktowane jest jako naruszenie podstawowych obowiązków pracowniczych z wszystkimi wynikającymi stąd konsekwencjami, z rozwiązaniem stosunku pracy włącznie.

 

Rozdział 4

Zasady i procedura podejmowania interwencji w sytuacji podejrzenia krzywdzenia lub posiadania informacji o krzywdzeniu małoletniego

 

 § 12

Krzywdzeniem jest:

1) przemoc fizyczna – czyli celowe uszkodzenie ciała, zadawanie bólu lub groźba uszkodzenia ciała. Skutkiem przemocy fizycznej mogą być m. in. złamania, siniaki, rany cięte, poparzenia, obrażenia wewnętrzne. Przemoc fizyczna powoduje lub może spowodować utratę zdrowia bądź też zagrażać życiu;

2) przemoc emocjonalna – czyli powtarzające się poniżanie, upokarzanie i ośmieszanie małoletniego, nieustanna krytyka, wciąganie małoletniego w konflikt osób dorosłych, manipulowanie nim, brak odpowiedniego wsparcia, stawianie małoletniemu wymagań i oczekiwań, którym nie jest on w stanie sprostać;

3) przemoc seksualna – czyli angażowanie małoletniego w aktywność seksualną przez osobę dorosłą, w tym wykorzystywanie seksualne, które odnosi się do zachowań z kontaktem fizycznym (np. dotykanie małoletniego, współżycie z małoletnim) oraz zachowania bez kontaktu fizycznego (np. pokazywanie małoletniemu materiałów pornograficznych, podglądanie, ekshibicjonizm) Przemoc ta może być jednorazowym incydentem lub powtarzać się przez dłuższy czas;

4) zaniedbywanie – czyli niezaspokajanie podstawowych potrzeb materialnych i emocjonalnych małoletniego przez rodzica lub opiekuna prawnego, niezapewnienie mu odpowiedniego jedzenia, ubrań, schronienia, opieki medycznej, bezpieczeństwa, braku dozoru nad wypełnianiem obowiązku szkolnego.

 

 § 13

Personel w swojej pracy kieruje się przepisami prawa i działa na rzecz ochrony dzieci przed krzywdzeniem.
Każda informacja dotycząca podejrzenia krzywdzenia dziecka traktowana jest poważnie i wyjaśniana jest bez względu na to czy pochodzi od dziecka/opiekuna/, pracownika, osoby dorosłej oraz bez względu na to czy dotyczy podejrzenia krzywdzenia ze strony innego dziecka, opiekuna dziecka, czy też pracownika bądź organizatora współpracującego z AP.
 

 § 14

Procedury podejmowania interwencji w sytuacji podejrzenia krzywdzenia lub posiadania informacji o krzywdzeniu małoletniego opisuje poniższa tabela:
 

 

Interwencja karna

Niebieska karta

Przesłanki

Podejrzenie popełnienia

przestępstwa

Przemoc domowa

Forma interwencji

Zawiadomienie o popełnieniu

przestępstwa

Wypełnienie formularza „Niebieska karta – A”

Właściwy organ / podmiot / adresat zgłoszenia

Policja, prokuratura

Miejski zespół interdyscyplinarny

Stosowne przepisy

Kodeks karny, kodeks postępowania karnego

Ustawa o przeciwdziałaniu przemocy domowej

Interwencja karna jest podejmowana w sytuacji podejrzenia popełnienia na szkodę małoletniego przestępstwa przeciwko życiu i zdrowiu, przeciwko wolności seksualnej i obyczajności oraz przestępstwa przeciwko rodzinie i opiece.
Interwencja Niebieskie Karty jest podejmowana w sytuacji podejrzenia występowania przemocy domowej przez którą należy rozumieć jednorazowe albo powtarzające się umyślne działanie lub zaniechanie, wykorzystujące przewagę fizyczną, psychiczną, naruszające prawa lub dobra osobiste osoby doznającej przemocy domowej, w szczególności:
1) narażające tę osobę na niebezpieczeństwo utraty życia, zdrowia lub mienia;

2) naruszające jej godność, nietykalność cielesną lub wolność, w tym seksualną;

3) powodujące szkody na jej zdrowiu fizycznym lub psychicznym, wywołujące u tej osoby cierpienie lub krzywdę;

4) istotnie naruszające prywatność tej osoby lub wzbudzające u niej poczucie zagrożenia, poniżenia lub udręczenia, w tym podejmowane za pomocą środków komunikacji elektronicznej.

Rozpoznawanie przemocy wobec dziecka odbywa się poprzez:
1) ujawnienie przez dziecko krzywdzenia;

2) ujawnienie przez dziecko przemocy domowej;

3) informacje od osoby będącej bezpośrednim świadkiem krzywdzenia małoletniego;

4) analizę objawów krzywdzenia występujących u dziecka;

Ujawnienie przez małoletniego krzywdzenia czy przemocy w rodzinie ma miejsce wtedy, kiedy
poinformuje on pracownika o tym, że doznaje jednej lub kilku jednocześnie form krzywdzenia.

 

 § 15

Pracownicy zwracają szczególną uwagę na występowanie w zachowaniu małoletniego sygnałów świadczących o krzywdzeniu, w szczególności uwagę pracownika powinny zwrócić przykładowo następujące zachowania:

1) dziecko ma widoczne obrażenia ciała (siniaki, poparzenia, ugryzienia, złamania kości itp.), których pochodzenie trudno jest wyjaśnić;

2) podawane przez dziecko wyjaśnienia dotyczące obrażeń wydają się niewiarygodne, niemożliwe, niespójne itp. Dziecko często je zmienia;

3) pojawia się niechęć przed udziałem w zajęciach uwzględniających ćwiczenia fizyczne;

4) dziecko nadmiernie zakrywa ciało, niestosownie do sytuacji i pogody;

5) dziecko wzdryga się, kiedy podchodzi do niego osoba dorosła;

6) dziecko boi się rodzica lub opiekuna;

7) dziecko boi się powrotu do domu;

8) dziecko jest bierne, wycofane, uległe, przestraszone;

 

 § 16

Na potrzeby niniejszego dokumentu wyróżniono procedury interwencji w przypadku podejrzenia działania na szkodę dziecka przez:

1) pracownika/współpracownika;

2) inne osoby trzecie;

3) rodziców/opiekunów prawnych;

4) inne dziecko - krzywdzenie rówieśnicze.

 

§ 17

Krzywdzenie ze strony pracownika

W przypadku gdy zgłoszono krzywdzenie dziecka przez pracownika, osoba ta zostaje natychmiast odsunięta od wszelkich form kontaktu z dziećmi (nie tylko dzieckiem pokrzywdzonym) do czasu wyjaśnienia sprawy.
Kierownik przeprowadza rozmowę z dzieckiem i innymi osobami mającymi lub mogącymi mieć wiedzę o zdarzeniu i o sytuacji osobistej (rodzinnej, zdrowotnej) dziecka, w szczególności jego opiekunami.
Kierownik stara się ustalić przebieg zdarzenia, oraz wpływ zdarzenia na zdrowie psychiczne i fizyczne dziecka. Ustalenia są spisywane na karcie interwencji, której wzór określa załącznik nr 2.
Kierownik organizuje spotkanie/a z rodzicami dziecka, którym przekazuje informacje o zdarzeniu oraz o potrzebie/możliwości skorzystania ze specjalistycznego wsparcia, w tym u innych organizacji lub służb.
W przypadku, gdy wobec dziecka popełniono przestępstwo Kierownik sporządza zawiadomienie o możliwości popełnienia przestępstwa i przekazuje je do właściwej miejscowo policji lub prokuratury. Wzór zawiadomienia określa załącznik nr 3.
W przypadku gdy pracownik dopuścił się wobec dziecka innej formy krzywdzenia niż popełnienie przestępstwa, Kierownik bada wszystkie okoliczności sprawy, w szczególności ma obowiązek wysłuchać pracownika podejrzewanego o krzywdzenie, dziecko oraz innych świadków zdarzenia. Ustalenia są spisywane na karcie interwencji, której wzór określa załącznik nr 2.
W sytuacji gdy naruszenie dobra dziecka jest znaczne, w szczególności gdy doszło do dyskryminacji lub naruszenia godności dziecka, należy rozważyć rozwiązanie stosunku prawnego z osobą, która dopuściła się krzywdzenia, lub zarekomendować takie rozwiązanie zwierzchnikom tej osoby.
Jeżeli pracownik, który dopuścił się krzywdzenia, nie jest bezpośrednio zatrudniony przez AP lecz przez podmiot inny (organizatora), wówczas należy zawiadomić ten podmiot i zarekomendować zakaz wstępu tej osoby na teren AP, a w razie potrzeby rozwiązać umowę z tym podmiotem.
 

§ 18

Krzywdzenie przez inne osoby trzecie

W przypadku gdy zgłoszono krzywdzenie dziecka przez osobę trzecią (obcą, bądź spokrewnioną) Kierownik bądź pracownik wskazany przez Kierownika, przeprowadza rozmowę z dzieckiem i innymi osobami mającymi lub mogącymi mieć wiedzę o zdarzeniu i o sytuacji osobistej (rodzinnej, zdrowotnej) dziecka, w szczególności jego opiekunami.
Kierownik bądź pracownik wskazany przez Kierownika, stara się ustalić przebieg zdarzenia, ale także wpływ zdarzenia na zdrowie psychiczne i fizyczne dziecka. Ustalenia są spisywane w karcie interwencji (załącznik nr 2).
Kierownik bądź pracownik wskazany przez Kierownika, organizuje spotkanie/a z rodzicami dziecka, którym przekazuje informacje o zdarzeniu oraz o potrzebie/możliwości skorzystania ze specjalistycznego wsparcia, w tym u innych organizacji lub służb.
W przypadku, gdy wobec dziecka popełniono przestępstwo, bądź gdy z rozmowy z rodzicami wynika, że nie są oni zainteresowani pomocą dziecku, ignorują zdarzenie lub w inny sposób nie wspierają dziecka, które doświadczyło krzywdzenia, Kierownik bądź pracownik wskazany przez Kierownika, sporządza zawiadomienie o możliwości popełnienia przestępstwa i przekazuje je do właściwej miejscowo policji lub prokuratury. Wzór zawiadomienia określono w załączniku nr 3.
 

§ 19

Krzywdzenie ze strony rodziców/opiekunów

W przypadku gdy ujawniono lub zgłoszono krzywdzenie dziecka przez rodziców/opiekunów, Kierownik (bądź pracownik wskazany przez Kierownika) przeprowadza rozmowę z dzieckiem i innymi osobami mającymi lub mogącymi mieć wiedzę o zdarzeniu i o sytuacji osobistej (rodzinnej, zdrowotnej) dziecka.
Kierownik (bądź pracownik wskazany przez Kierownika) stara się ustalić przebieg zdarzenia, a także wpływ zdarzenia na zdrowie psychiczne i fizyczne dziecka. Ustalenia są spisywane w karcie interwencji (załącznik nr 2).
W przypadku, gdy wobec dziecka popełniono przestępstwo Kierownik (bądź pracownik wskazany przez Kierownika) sporządza zawiadomienie o możliwości popełnienia przestępstwa i przekazuje je do właściwej miejscowo policji lub prokuratury (załącznik nr 3).
W przypadku, gdy z przeprowadzonych ustaleń wynika, że rodzic/opiekun dziecka zaniedbuje jego potrzeby psychofizyczne lub rodzina jest niewydolna wychowawczo (np. dziecko chodzi w nieadekwatnych do pogody ubraniach, opuszcza miejsce zamieszkania bez nadzoru osoby dorosłej), rodzina stosuje przemoc wobec dziecka (rodzic/inny domownik krzyczy na dziecko, stosuje klapsy lub podobne rodzajowo kary fizyczne), Kierownik (bądź pracownik wskazany przez Kierownika), powiadamia właściwy ośrodek pomocy społecznej o potrzebie pomocy rodzinie, gdy niespełnianie potrzeb wynika z sytuacji ubóstwa.
Dalszy tok postępowania leży w kompetencji instytucji, o których mowa w ustępach poprzedzających.
 

§ 20

Krzywdzenie rówieśnicze

W przypadku podejrzenia krzywdzenia dziecka przez inne dziecko przebywające w AP (np. na zajęciach grupowych) pracownik AP przekazuje informację Kierownikowi, a ten (bądź pracownik wskazany przez Kierownika) przeprowadza rozmowę z dzieckiem podejrzewanym o krzywdzeniem oraz z jego opiekunami, a także oddzielnie z dzieckiem poddawanym krzywdzeniu i jego opiekunami.
Ponadto Kierownik (bądź pracownik wskazany przez Kierownika) przeprowadza rozmowę z innymi osobami mającymi wiedzę o zdarzeniu.
W trakcie rozmów należy dążyć do ustalenia przebiegu zdarzenia, a także wpływu zdarzenia na zdrowie psychiczne i fizyczne dziecka krzywdzonego. Ustalenia są spisywane w karcie interwencji (załącznik nr 2).
Dla dziecka krzywdzącego oraz krzywdzonego sporządza się oddzielne kartę interwencji (załącznik nr 2).
W trakcie rozmów należy upewnić się, że dziecko podejrzewane o krzywdzenie innego dziecka samo nie jest krzywdzone przez rodziców/opiekunów lub innych dorosłych. W przypadku potwierdzenia takiej okoliczności należy przejść do procedury odpowiednio z §17 - §19.
Kierownik (bądź pracownik wskazany przez Kierownika) organizuje spotkanie/nia z rodzicami/ opiekunami dziecka, krzywdzonego i krzywdzącego, którym przekazuje informacje o zdarzeniu, sposobach reakcji na zdarzenie (poinformowanie sądu rodzinnego, poinformowanie szkoły, poinformowanie rodziców dziecka krzywdzącego) oraz o potrzebie/możliwości skorzystania ze specjalistycznego wsparcia, w tym w instytucjach do tego powołanych.
 

§ 21

Określa się zasady interwencji w sytuacji podejrzenia krzywdzenia związanego z bezpośrednim zagrożeniem zdrowia lub życia dziecka zdefiniowaną jako interwencja nagła:

1) jeżeli pracownik w trakcie wykonywania obowiązków służbowych poweźmie informacje o bezpośrednim zagrożeniu życia lub/i zdrowia dziecka jest obowiązany natychmiast podjąć interwencję (interwencja nagła);

2) interwencja nagła polega na natychmiastowym powiadomieniu telefonicznym oraz przesłaniu emailem / faksem zawiadomienia o bezpośrednim zagrożeniu życia i zdrowia dziecka do odpowiedniej jednostki Policji;

3) w zawiadomieniu telefonicznym, przesyłanym faksem / emailem pracownik powinien podać wszystkie informacje, jakie uzyskał odnośnie dziecka (imię, nazwisko, adres, miejsce, w którym się znajduje), opisać rodzaj zagrożenia, a w przypadku rozmowy telefonicznej - podać dokładną godzinę połączenia, czas trwania połączenia oraz numer, z którego dzwoniło dziecko lub inna osoba;

4) jeśli pracownikowi znane jest miejsce, w którym dziecko aktualnie przebywa, pracownik wysyła faks / email do dyżurnego Komendy Policji właściwej dla tego miejsca;

5) jeżeli pracownik nie posiada informacji o miejscu, w którym dziecko aktualnie przebywa, w zawiadomieniu należy podać wszystkie istotne informacje dotyczące sytuacji zagrożenia, a w przypadku rozmowy telefonicznej: dokładną godzinę nawiązania połączenia oraz dokładny czas trwania połączenia, a także opis kontaktu z osobą dzwoniącą i treść;

6) zawiadomienie wysyłane faksem / emailem podpisuje pracownik podejmujący interwencję;

7) pracownik podejmuje interwencję nagłą bez konsultacji. Jeżeli jednak sytuacja na to pozwala, należy skonsultować się przed podjęciem interwencji nagłej z Kierownikem lub z innym pracownikiem;

8) zawiadomienie wysłane faksem / emailem należy przesłać pocztą na adres właściwej komendy Policji najpóźniej następnego dnia roboczego po dokonaniu interwencji.

 

§ 22

Po podjęciu interwencji nagłej pracownik ma obowiązek przekazania ustnej informacji Kierownikowi, a następnie jest zobowiązany do sporządzenia Karty interwencji (załącznik nr 2 do niniejszych Standardów).
Jeżeli zgłoszono krzywdzenie ze strony osoby wyznaczonej do prowadzenia interwencji, wówczas interwencja prowadzona jest przez Kierownika.
Jeżeli zgłoszono krzywdzenie ze strony Kierownika, wówczas działania opisane w niniejszym rozdziale podejmuje osoba, która dostrzegła krzywdzenie lub do której zgłoszono podejrzenie krzywdzenia.
Do udziału w interwencji można doprosić specjalistów, w szczególności psychologów i pedagogów, celem skorzystania z ich pomocy przy rozmowie z dzieckiem o trudnych doświadczeniach.
 

§ 23

W przypadku podejrzenia, że życie dziecka jest zagrożone lub grozi mu ciężki uszczerbek na zdrowiu należy niezwłocznie poinformować odpowiednie służby (Policja, pogotowie ratunkowe), dzwoniąc pod numer 112 lub 998 (pogotowie).
Poinformowania służb dokonuje pracownik, który pierwszy powziął informację o zagrożeniu i następnie wypełnia kartę interwencji (załącznik nr 2 do niniejszych Standardów).
 

§ 24

Fakt ujawnienia możliwości popełnienia przestępstwa na szkodę małoletniego lub krzywdzenia małoletniego nie podlega ocenie uwiarygadniającej ze strony pracownika i bezwzględnie wymaga zareagowania.
Pracownicy i inne osoby, które w związku z wykonywaniem obowiązków służbowych podjęły informację o krzywdzeniu dziecka lub informacje z tym związane, są zobowiązane do zachowania tych informacji w tajemnicy, wyłączając informacje przekazywane uprawnionym organom i instytucjom w ramach działań interwencyjnych.
 

 

Rozdział 5

Procedury i osoby odpowiedzialne za składanie zawiadomień o podejrzeniu popełnienia przestępstwa na szkodę małoletniego, zawiadamianie sądu opiekuńczego oraz w przypadku instytucji, które posiadają takie uprawnienia, osoby odpowiedzialne za wszczynanie procedury „Niebieskie Karty”

 

§ 25

Jeżeli osobą podejrzewaną o krzywdzenie jest dziecko w wieku od 13 do 17 lat, a jego zachowanie stanowi czyn karalny, Kierownik informuje właściwy miejscowo sąd rodzinny lub policję poprzez pisemne zawiadomienie.
Jeżeli osobą podejrzewaną o krzywdzenie jest dziecko powyżej lat 17, a jego zachowanie stanowi przestępstwo, wówczas Kierownik informuje właściwą miejscowo jednostkę policji lub prokuratury poprzez pisemne zawiadomienie.
 

§ 26

W przypadku, gdy wobec dziecka popełniono przestępstwo Kierownik sporządza zawiadomienie o popełnieniu przestępstwa i przekazuje je do właściwej miejscowo policji lub prokuratury. Wzór zawiadomienia określa załącznik nr 3.

 

§ 27

Podejmowanie interwencji wobec rodziny dotkniętej przemocą domową odbywa się na podstawie procedury „Niebieskie Karty”.
AP nie jest instytucją uprawnioną do wypełniania formularza A procedury „Niebieskie Karty”.
W sytuacji uzyskania przez pracownika informacji o przemocy domowej, osobą odpowiedzialną za złożenie wniosku do Zespołu Interdyscyplinarnego o wszczęcie procedury „Niebieskie Karty” jest Kierownik.
 

Rozdział 6

Zakres kompetencji osoby odpowiedzialnej za przygotowanie personelu do stosowania standardów, zasady przygotowania tego personelu do ich stosowania oraz sposób dokumentowania tej czynności

 

§ 28

Kierownik odpowiada za przygotowanie merytoryczne pracowników do stosowania Standardów, w tym za organizację spotkań szkoleniowych w zakresie ich stosowania.
Personel jest zobowiązany zapoznać się ze standardami ochrony małoletnich i potwierdzić ten fakt
własnoręcznym podpisem w Oświadczeniu stanowiącym załącznik nr 6 do niniejszego dokumentu.

 

Rozdział 7

Zasady i sposób udostępniania rodzicom albo opiekunom prawnym lub faktycznym oraz małoletnim standardów do zaznajomienia się z nimi i ich stosowania

 

§ 29

W AP obowiązują Standardy ochrony małoletnich w wersji zupełnej oraz w wersji skróconej przeznaczonej dla małoletnich.
Standardy w wersji zupełnej zamieszcza się na stronie internetowej AP oraz udostępnia się każdemu zainteresowanemu do wglądu w sekretariacie AP.
W oddziałach AP zamieszcza się informację (komunikat), iż obowiązujące w AP Standardy Ochrony
Małoletnich w wersji zupełnej i w wersji skróconej, są dostępne do wglądu w formie wydruku dokumentu w sekretariacie AP.

Na stronie internetowej AP oraz w oddziałach AP zamieszcza się Standardy w wersji skróconej,
przeznaczonej dla małoletnich.

Pracownik AP prowadzący zajęcia ma obowiązek zapoznać małoletnich ze Standardami w wersji skróconej przeznaczonej dla małoletnich. Potwierdzeniem omówienia Standardów jest wpis do dziennika zajęć lub sporządzona przez pracownika notatka.
Rodzice oraz opiekunowie prawni małoletnich przy zapisie dziecka na zajęcia są każdorazowo informowani o obowiązujących w AP Standardach i możliwością zapoznania się z nimi w sposób określony w niniejszym paragrafie.
 

Rozdział 8

Osoby odpowiedzialne za przyjmowanie zgłoszeń o zdarzeniach zagrażających małoletniemu i udzielenie mu wsparcia

 

§ 31

Osobą odpowiedzialną za przyjmowanie zgłoszeń o zdarzeniach zagrażających małoletniemu jest Kierownik.
Osobami odpowiedzialnymi za udzielenie małoletniemu wsparcia w sytuacji krzywdzenia jest każdy pracownik w sytuacjach niecierpiących zwłoki.
W przypadku uzyskania informacji lub zauważenia przez pracownika, że dziecko jest krzywdzone, pracownik ma obowiązek udzielenia pomocy a następnie sporządzenia notatki służbowej i zgłoszenia tego faktu Kierownikowi.
Każde uzasadnione podejrzenie jest podstawą do podjęcia kolejnych działań.
Pracownik ma obowiązek podjęcia i zgłoszenia zawsze w przypadku:
a) podejrzenia krzywdzenia dziecka na podstawie jego obserwacji;
b) gdy dziecko ujawniło doświadczenia krzywdzenia;
c) gdy inna osoba (dorosła lub dziecko) zgłosiła fakt krzywdzenia dziecka.
W przypadku, gdy osobą krzywdzącą jest pracownik, Karta interwencji zostaje sporządzona przez Kierownika, który przeprowadza czynności wyjaśniające i podejmuje działania dyscyplinujące.
Kierownik wzywa rodziców dziecka, co do którego powziął informacje o możliwości krzywdzenia i informuje ich o sytuacji dziecka.
W sytuacjach szczególnych Kierownik może powołać zespół interwencyjny, w skład, którego wchodzą osoby mogące mieć wiedzę o sytuacji dziecka oraz mają możliwości wsparcia i zapewnienia bezpieczeństwa dziecku.
W skład zespołu mogą także wchodzić osoby spoza AP, które mogą pomóc dziecku.
Zespół interwencyjny sporządza plan pomocy dziecku, który powinien zawierać wskazania dotyczące:
a) działań, jakie AP zapewnia dziecku w celu poczucia bezpieczeństwa;
b) wsparcia, jakie zaoferuje dziecku;
c) ewentualne skierowanie rodziców dziecka do specjalistycznej placówki pomocy dziecku lub przekazanie informacji o takich miejscach, jeżeli istnieje taka potrzeba.
Plan pomocy dziecku jest przedstawiany przez Kierownika rodzicom z zaleceniem współpracy przy jego realizacji.
 

Rozdział 9

Sposób dokumentowania i zasady przechowywania ujawnionych lub zgłoszonych incydentów lub zdarzeń zagrażających dobru małoletniego

 

§ 32

Na dokumentację ujawnionych lub zgłoszonych incydentów lub zdarzeń zagrażających dobru małoletniego składają się:
1) karta interwencji dot. danego zdarzenia – sporządzona zgodnie ze wzorem określonym w załączniku nr 2 do niniejszych Standardów;

2) notatki służbowe sporządzane przez pracowników na okoliczność danego zdarzenia;

3) kopia wniosku do sądu rodzinnego o wgląd w sytuację rodziny sporządzonego zgodnie ze wzorem określonym w załączniku nr 3 do niniejszych standardów;

4) kopia zawiadomienia o popełnieniu przestępstwa wobec dziecka sporządzonego zgodnie ze wzorem określonym w załączniku nr 3;

5) rejestr prowadzonych interwencji stanowiący załącznik nr 4 do Standardów;

6) ankiety monitorujące poziom realizacji Standardów;

7) raporty z monitoringu Standardów.

Zasady przechowywania ujawnionych lub zgłoszonych incydentów lub zdarzeń zagrażających dobru małoletniego interwencji w przypadku podejrzenia krzywdzenia dziecka określają zasady obowiązujące w AP.
Dokumentacja dot. ujawnionych lub zgłoszonych incydentów lub zdarzeń zagrażających dobru małoletniego, dokumentacja dot. interwencji w przypadku podejrzenia krzywdzenia dziecka jest przechowywana w sekretariacie AP i jest udostępniania w jakikolwiek sposób i w jakiejkolwiek formie tylko i wyłącznie za zgodą Kierownika.
Odpowiedzialność za właściwe przechowywania i udostępnianie dokumentacji dot. ujawnionych lub zgłoszonych incydentów lub zdarzeń zagrażających dobru małoletniego oraz interwencji w przypadku podejrzenia krzywdzenia małoletniego ponosi wyznaczony pracownik sekretariatu.
 

Rozdział 10

Wymogi dotyczące bezpiecznych relacji między małoletnimi, a w szczególności zachowania niedozwolone

 

§ 33

Określa się poniższe zasady bezpiecznych relacji między małoletnimi:
1) małoletni mają prawo do życia i przebywania w bezpiecznym środowisku;

2) uczestnicy zajęć organizowanych przez AP akceptują i szanują siebie nawzajem, uznając prawo innych uczniów do odmienności i zachowania tożsamości ze względu na: pochodzenie etniczne, geograficzne, narodowe, religię, status ekonomiczny, cechy rodzinne, wiek, płeć, orientację seksualną, cechy fizyczne, niepełnosprawność;

3) uczestnicy nie naruszają praw innych uczestników – nikogo nie dyskryminują ze względu na jakąkolwiek jego odmienność;

4) zachowanie i postępowanie uczestników nie może naruszać ich poczucia godności/wartości osobistej innych osób;

5) uczestnicy zajęć mają prawo do własnych poglądów, ocen i spojrzenia na świat oraz wyrażania ich, pod warunkiem, że sposób ich wyrażania wolny jest od agresji i przemocy oraz nikomu nie wyrządza krzywdy;

6) uczestnicy zajęć są zobowiązani do respektowania praw i wolności osobistych swoich koleżanek i kolegów, ich prawa do własnego zdania, do poszukiwań i popełniania błędów, do własnych poglądów, wyglądu i zachowania – w ramach społecznie przyjętych norm i wartości;

7) kontakty między uczestnikami zajęć winno cechować zachowanie przez nich wysokiej kultury osobistej;

8) uczestnicy zajęć nie mają prawa stosować wobec innych uczestników oraz innych osób jakiejkolwiek agresji, przemocy słownej, fizycznej i psychicznej - z jakiegokolwiek powodu i jakichkolwiek okolicznościach.

Za niedozwolone zachowania małoletnich uznaje się:
1) stosowanie jakiejkolwiek agresji i przemocy wobec innych osób;

2) stosowanie agresji i przemocy fizycznej w formach takich jak np.:

a) bicie/uderzenie/popychanie/kopanie/opluwanie,
b) wymuszenia,
c) napastowanie seksualne,
d) nadużywanie swojej przewagi nad inną osobą,
e) fizyczne zaczepki,
f) zmuszanie innej osoby do podejmowania niewłaściwych działań,
g) rzucanie w kogoś przedmiotami;
3) stosowanie agresji i przemocy słownej w formach takich jak np.:

a) obelgi, wyzwiska,
b) wyśmiewanie, drwienie, szydzenie z krzywdzonego,
c) bezpośrednie obrażanie ofiary;
d) plotki i obraźliwe żarty,
e) przedrzeźnianie,
f) groźby.
4) stosowanie agresji i przemocy psychicznej w formach takich jak np.:

a) poniżanie,
b) wykluczanie/izolacja/milczenie/manipulowanie,
c) pisanie na ścianach (np. w toalecie lub na korytarzu);
d) wulgarne gesty,
e) śledzenie/szpiegowanie,
f) obraźliwe sms-y i mms-y,
g) wiadomości na forach internetowych, w mediach społecznościowych lub tzw. pokojach do czatowania,
h) telefony i e-maile zawierające groźby, poniżające, wulgarne, zastraszające,
i) niszczenie/zabieranie rzeczy należących do krzywdzonego,
j) straszenie i szantażowanie.
W każdym przypadku, gdy uczestnik jest świadkiem wypadku, pobicia, agresywnego zachowania bądź innego zdarzenia sprzecznego z normami i zasadami obowiązującymi na terenie szkoły natychmiast zgłasza zaistnienie zdarzenia informując o nim najbliżej znajdującą się osobę dorosłą będąca pracownikiem AP.
W sytuacjach, o których mowa w ust. 2, uczestnik zajęć ma obowiązek podporządkować się do poleceń personelu AP.
W przypadku krzywdzenia małoletniego przez innego małoletniego na terenie AP, pracownik będący świadkiem zdarzenia zobowiązany jest:
a) zdecydowanie i stanowczo przerwać negatywne zachowania uczestników zajścia,
b) rozdzielić ewentualne strony konfliktu,
c) jeśli istnieje taka potrzeba udzielić pierwszej pomocy. W przypadku poważniejszych obrażeń, Kierownik wzywa karetkę pogotowia ratunkowego,
d) poinformować Kierownika o zdarzeniu.
Jeżeli ofiara przemocy doznała dotkliwych obrażeń cielesnych, wymagających interwencji medycznej, lub następuje długotrwały proces przemocy (dręczenie), a wcześniej stosowane strategie naprawcze nie przyniosły oczekiwanych rezultatów i sprawca przemocy ukończył 13 lat Kierownik powiadamia o zdarzeniu Policję i/lub Sąd Rodzinny.
Ze sprawcą przeprowadza rozmowę omawiającą jego zachowanie oraz powiadamia o konsekwencjach.
 

Rozdział 11

Zasady korzystania z urządzeń elektronicznych z dostępem do sieci Internet

 

§ 34

AP zapewniając dostęp do Internetu podejmuje działania zabezpieczające dzieci przed dostępem do treści, które mogą stanowić zagrożenie dla ich prawidłowego rozwoju; w szczególności na komputerach AP instaluje się i aktualizuje się oprogramowanie zabezpieczające przed złośliwym oprogramowaniem i filtrujące treści.
Na terenie AP dostęp do Internetu możliwy jest:
1) pod nadzorem pracownika na zajęciach komputerowych, lub

2) za pomocą sieci wifi organizacji, po podaniu hasła.

W przypadku dostępu realizowanego pod nadzorem pracownika ma on obowiązek informowania uczestników o zasadach bezpiecznego korzystania z Internetu.
Pracownik czuwa nad bezpieczeństwem korzystania z Internetu przez uczestników podczas zajęć.
AP w miarę możliwości zapewnia stały dostęp do materiałów edukacyjnych, dotyczących bezpiecznego korzystania z Internetu.
Uczestnik może korzystać z Internetu na komputerze udostępnianym przez AP tylko z zainstalowanym programem filtrującym treści.
Uczestnik obsługuje sprzęt komputerowy zgodnie z zaleceniami prowadzącego zajęcia, a po skończeniu pracy ma obowiązek zostawić komputer wyłączony.
Użytkownicy komputera mają prawo do zapisywania swoich plików wyłącznie w wyznaczonym miejscu (nie na pulpicie). Dane tymczasowe, utworzone w trakcie pracy, należy po jej zakończeniu usunąć.
Należy zrobić kopię zapasową ważnych dokumentów w miejscu innym niż oryginał.
Użytkownikowi komputera zabrania się:
1) instalowania oprogramowania oraz dokonywania zmian w konfiguracji oprogramowania zainstalowanego w systemie;

2) usuwania cudzych plików, odinstalowania programów, dekompletowania sprzętu;

3) dotykania elementów z tyłu komputera, kabli zasilających, a także kabli sieciowych.

 

Rozdział 12

Procedury ochrony dzieci przed treściami szkodliwymi i zagrożeniami w sieci Internet

oraz utrwalonymi w innej formie

 

§ 35

Korzystanie z Internetu przez małoletnich może wiązać się z następującymi kategoriami zagrożeń:
1) kontakt z niebezpiecznymi treściami;

2) kontakty z niebezpiecznymi osobami;

3) przemoc rówieśnicza (cyberprzemoc);

4) uzależnienie od Internetu.

Pod pojęciem „treści szkodliwe i zagrożenia z sieci” rozumie się:
1) treści niedozwolone, nielegalne i niebezpieczne dla zdrowia (pornografia, treści obrazujące przemoc, promujące działania szkodliwe dla zdrowia i życia dzieci, popularyzujące ideologię faszystowską i działalność niezgodną z prawem, nawołujące do samookaleczeń i samobójstw, korzystania z narkotyków;

2) treści stwarzające niebezpieczeństwo werbunku dzieci do organizacji nielegalnych i terrorystycznych;

3) wszelkie formy cyberprzemocy, np. nękanie, straszenie, szantażowanie z użyciem sieci, publikowanie lub rozsyłanie ośmieszających, kompromitujących informacji, zdjęć, filmów z użyciem sieci oraz podszywanie się w sieci pod kogoś wbrew jego woli.

Pracownik odpowiedzialny za Internet (tzw. administrator sieci) zapewnia zabezpieczenie sieci internetowej przed niebezpiecznymi treściami, instalując i aktualizując odpowiednie, nowoczesne oprogramowanie.
Oprogramowanie jest aktualizowane w miarę potrzeb, przynajmniej raz w miesiącu.
Wyznaczony pracownik przynajmniej raz w miesiącu sprawdza, czy na komputerach ze swobodnym dostępem podłączonych do Internetu nie znajdują się niebezpieczne treści.
W przypadku znalezienia niebezpiecznych treści, wyznaczony pracownik stara się ustalić kto korzystał z komputera w czasie ich wprowadzenia.
Informację o dziecku, które korzystało z komputera w czasie wprowadzenia niebezpiecznych treści, wyznaczony pracownik przekazuje Kierownikowi, który aranżuje dla dziecka rozmowę z psychologiem lub pedagogiem – pracownikiem szkoły lub zewnętrznym.
Kierownik przeprowadza z małoletnim dzieckiem, o którym mowa w ustępach poprzedzających, rozmowę na temat bezpieczeństwa w Internecie.
Jeżeli w wyniku przeprowadzonej rozmowy Kierownik uzyska informacje, że dziecko jest krzywdzone, podejmuje działania opisane w niniejszym dokumencie
 

Rozdział 13

Zakres zadań poszczególnych pracowników AP w przypadku podejrzenia lub uzyskania informacji,

że dziecko jest krzywdzone

 

§ 36

W przypadku podejrzenia lub uzyskania informacji, że dziecko jest krzywdzone Kierownik:

1) przyjmuje zgłoszenie o krzywdzeniu lub podejrzeniu krzywdzenia dziecka;

2) bierze udział w rozmowie z rodzicami lub opiekunami prawnymi;

3) w sytuacjach podejrzenia przemocy domowej wobec dziecka podejmuje decyzję o złożeniu wniosku do Zespołu Interwencyjnego o uruchomienie procedury „Niebieska Karta”;

4) w przypadku, gdy dziecko doświadcza przemocy domowej lub jeżeli rodzice odmawiają współpracy składa odpowiednio wniosek o wgląd w sytuację rodziny do sądu lub zawiadamia prokuraturę o podejrzeniu przestępstwa;

5) w przypadku zagrożenia zdrowia lub życia dziecka natychmiast zawiadamia policję;

6) w sytuacji gdy sprawcą przemocy jest osoba dorosła spoza rodziny zawiadamia policję;

7) w przypadku, gdy sprawcą przemocy jest nieletni (a wcześniejsze metody postępowania okazały się

nieskuteczne) zawiadamia sąd;

8) informuje o konsekwencjach prawnych stosowania przemocy;

9) prowadzi nadzór nad prowadzeniem przypadku dziecka krzywdzonego;

10) zapewnia pomoc pracownikom w realizacji ich zadań np. ułatwia konsultacje trudnych spraw ze specjalistami, organizuje szkolenia w zakresie reagowania na przemoc wobec dzieci;

11) uzyskuje od rodziców i opiekunów informacje zwrotne nt. realizacji Standardów ochrony dzieci przed krzywdzeniem.

 

Rozdział 14

Zasady przeglądu i aktualizacji standardów

 

§ 37

Zarząd AP wyznacza osobę odpowiedzialną za monitorowanie Standardów.
Ponadto osoba, o której mowa w ust.1 jest odpowiedzialna za reagowanie na sygnały naruszenia Standardów oraz za przyjmowanie od pracowników proponowanych zmian w treści ich zapisów.
Osoba, o której mowa w ust. 1 przeprowadza wśród pracowników raz na dwa lata ankietę monitorującą poziom realizacji Standardów. Wzór ankiety stanowi załącznik nr 5.
W ankiecie pracownicy mogą proponować zmiany w Standardach oraz wskazywać sytuacje naruszenia Standardów oraz sytuacje w których procedury określone w Standardach nie zostały zastosowane lub nie zadziałały.
Osoba, o której mowa w ust. 1 dokonuje opracowania wypełnionych przez pracowników ankiet. Sporządza na tej podstawie raport z monitoringu, który następnie przekazuje Kierownikowi.
Kierownik po dokonaniu analizy raportu może wprowadzić niezbędne zmiany, a następnie ogłasza stosownym zarządzeniem nowe brzmienie Standardów.
 

Rozdział 15

Postanowienia końcowe

 

§ 38

Integralną część Standardów stanowią poniższe załączniki:

1) załącznik nr 1 – Wzory oświadczeń dotyczących obywatelstwa/ obywatelstw oraz zamieszkiwania w ciągu 20 lat;

2) załącznik nr 2 – Karta interwencji;

3) załącznik nr 3 – Wzór zawiadomienia o podejrzeniu popełnienia przestępstwa;

4) załącznik nr 4 – Wzór rejestru interwencji;

5) załącznik nr 5 – Wzór ankiety dla pracowników monitorującej poziom realizacji Standardów ;

6) załącznik nr 6 – Wzór oświadczenia pracownika o zapoznaniu się z obowiązującymi Standardami ochrony małoletnich;

 

39

Standardy wchodzą w życie z dniem podpisania zarządzenia.''',
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
