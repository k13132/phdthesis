# Šablona pro psaní disertační prace na ČVUT FEL 

Tento repositář obsahuje předváděcí verzi šablony pro psaní doktorský prací na FEL ČVUT v anglickém jazyce. Šablona vznikla protože jsem nebyl spokojen s komplikovaným provozem šablony felthesis, nelogičností FIT šablony a zastaralostí všech ostatních šablon. Rozhodl jsem se tedy připravit šablonu, která bude maximálně kopírovat způsob práce s LaTeXem a jeho šablonou book, jak jen to je možné. 

Základní zavedení šablony je velmi jednoduché, a to:
```
\documentclass{phdthesis}
```

Následně je nutné nastavit jméno disertační práce:
```
\title{Very Long Name of Disertation Thesis Dealing With Some Science}
```

Poskytnout informaci o autorovi práce a jeho školiteli
```
\author{Ing. Name Surname}
\authorAffiliation{
Department of Telecommunication Engineering\\
Faculty of Electrical Engineering\\
Czech Technical University in Prague\\
Technická 2\\
160 00 Prague 6\\
Czech Republic \\
\url{email_author@fel.cvut.cz}}

\supervisor{Doc. Ing. Name Surname, Ph.D.}
\supervisorAffiliation{
Department of Telecommunication Engineering\\
Faculty of Electrical Engineering\\
Czech Technical University in Prague\\
Technická 2\\
160 00 Prague 6\\
Czech Republic \\
\url{email_supervisor@fel.cvut.cz}}
```

Doplňující informace
```
\placeyear{Prague, March 2015}
\date{March 2015}
```

A pak jen začít psát

```
\begin{document}

\maketitle
\listoftables
\listoffigures
\printglossary[title=List of Acronyms,toctitle=List of Acronyms]
\tableofcontents

\mainmatter
%% Vlastni text disertacni prace

\appendix
%% Prilohy

\end{document}
```

A výsledek vypadá následovně: [https://github.com/lejmr/phdthesis/blob/master/thesis-final.pdf]

## Správné použití šablony

Aby autor disertační práce nemusel ztrácet přiliš času se sprovozněním šablony, slouží tento repositář zároveň jako základní sandbox, který je možné použít pro vlastní psaní. Je zde možné najít tři ukázkové dokumenty sestavené s využitím šablony phdthesis.cls, jedná se
* Teze (statement)
* Seznam vlastní literatury (literature) 
* Vlastní disertační práce (thesis-final). 

Dále je zde soubor, který se jmenuje thesis.tex a osobně se mi osvědčil pro vlastní psaní. Při psaní disertační práce člověk naráží na spousty balastu okolo a v první chvíli se chce soustředit hlavně na samotné psaní. Přesně pro tyto účely slouží právě thesis.tex, který v sobě obsahuje minimální sadu balíčků a nastavení, čímž je možné začít psát disertační práci. Tento soubor je postavený na základě šablony book, takže je možné použít vše na co jste zvyklí ze psaní článků. Tento dokument je navíc vhodný pro korekce, protože je kompaktnější.

Ve chvíli, kdy je text připraven je nutné text zasadit do šablony. K tomuto zde složí soubor thesis-final.tex, který ve své horní části obsahuje metadata, která popisují autora, jméno práce a pár dalších základních parametrů. Prakticky stačí jen překopírovat \input direktivy natahující kapitoly a zavolat příkaz *pdflatex*, či jinou oblíbenou variantu pro sestavení. Šablona je připravena na práci s automaticky generovanými zkratkami. Zkratky se definují v souboru *zkratky.tex*. Literatura je generována opět automaticky s využitím *bibtex*. Kvůli lepší podpoře znaků je však vhodné reference udržovat v UTF-8 formátu biblatex (Jabref tuto volbu má v nastavení). Odstraní se tím řada problémů se speciálními znaky v názvech. Šablona na pozadí využívá právě biblatex a šablonu IEEE pro formátování literatury. 

Pro samotné psaní již autor může používat své oblíbené knihovny pro práci s obrázky, tabulkami,... výchozí šablona book určitě nebude s ničím kolidovat.


### Sestavení disertační práce
V případě, že je využito automaticky generovaných zkratek postup pro sestavení je následující:
```
pdflatex thesis-final
makeglossaries thesis-final
bibtex thesis-final
pdflatex thesis-final
```

### Teze
Dalším důležitým dokumentem jsou Teze. Pro teze je zde připravena ukázka statement.tex. Opět se využívá šablony phdthesis.cls, jen byly změněny volby šablony. Pro tezi je možné přidat ještě parameter print, který vloží prázdné stránky takovým způsobem, že tisk na booklet vypadá o kousíček víc profesionálně. Zde stojí za zmínku podstránka, která obsahuje autorovu literaturu. Zde je dobré se všimnout, že je možné se odkazovat na vlastní publikace pomocí příkazu *\bibentry*. Direktiva *\bibentry* je běžně dostupná v CTAN, jenže CTAN implementace nepodporuje UTF-8 a obecně jsem narážel na řadu problémů u velkého množství článků, jejichž .bib záznamy jsem měl generované z VVVS. Z tohoto důvodu jsem se rozhodl direktivu *\bibentry* implementovat na zelené louce. Takže tato šablona nabízí možnost pohodlné tvorby vlastní literatury, jak je možné vidět právě v statement.tex. Ke své funkci vyžaduje nainstalovaný biblatex a není třeba využívat biber!

Teze se sestaví obdobně jako vlastní disertační práce, a to:
```
pdflatex statement
makeglossaries statement
bibtex statement
pdflatex statement
```

### Seznam vlastní literatury
Posledním důležitým dokumentem při odevzdání disertační práce je Seznam vlastní literatury. Ukázka je v souboru literature.tex. Jedná se prakticky jen o výcuc z Teze, avšak v podobě samostatného dokumentu, který se odevzdává při podání disertační práce. Při tvorbě Seznamu vlastní literatury je vhodné literaturu umístit do souboru, který je pomocí direktivy *\input* importován jak do Teze, tak právě do Seznamu vlastní literatury -- viz ukázka.

Sestavení:
```
pdflatex literature
bibtex literature
pdflatex literature
```



##Vhodná rozšíření:

Šablona byla připravena v anglické podobě, ale není problém ji konvertovat do libovolného dalšího jazyka. V případě, že by chtěl tuto šablonu přejmout a dále rozšiřovat budu za tuto aktivitu vděčný. Šablona byla navržena tak, aby měla minimální nároky na speciální knihovny a vše je odvozeno od minimálního množství standardních knihoven. 

- Podpora více jazyků než jen EN -- vcelku jednoduché skrze optionu, viz optiona *print*.
- Podpora pro více kateder. -- Doporučil bych implementací formou parametru třídy, typicky K13132, k13101, taková to notace by umožnila nasazení pro celé ČVUT.
- Integrace CTUstyle, případně jiné grafické ztvárnění. 
- Opravení typogragie, jelikož ukázková soubory generují dnes již zastaralý tiskový formát: velké řádkování, jednostranný tisk,...

V případě zájmu o rozšíření práce doporučuji fork a zároveň velmi rád poskytnu konzultace.



##FAQ:
* Není využito biberu, jelikož na Debian stable správně nefungoval a na Windows 7 64bit pouze padal hned od samého stažení. Navíc pro zdroje stažené z Internetu (IEEE, Elsevir,..) a ručně připravené zdroje se nepovedlo ani jednou přeložit z běžně používaných .bib souborů.
* Šablona neni v současné době odladěna pro oboustanný tisk, ani 1.0 řádkování, a to protože se v této podobě na K13132 tak neodevzdávají, nicméně není problém přepnout.
