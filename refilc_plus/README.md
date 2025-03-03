<!--
    refilc+, but more stripped and more open source
    Copyright (C) 2025  Firka team (QwIT development)

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU Affero General Public License as
    published by the Free Software Foundation, either version 3 of the
    License, or (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU Affero General Public License for more details.

    You should have received a copy of the GNU Affero General Public License
    along with this program.  If not, see <https://www.gnu.org/licenses/>.
-->

# <img src="https://github.com/user-attachments/assets/7197fdf3-4929-46e3-a2c2-4614abc6c031" alt width="100px"> reFilc"+"

### A funkciók gyűjteménye, ami ~~csak reFilc+ előfizetők számára elérhető~~ mindenki számára elérhető!

Ez a verzió **NEM** sérti az **[AGPL](https://github.com/QwIT-Development/app-legacy/blob/master/LICENSE)** licenszt, ami alatt van az alkalmazás, ellentétben a [korábbi verziójával](https://github.com/refilc/naplo/).

Korábbi verzió:<br>
[![image](https://github.com/user-attachments/assets/170dc789-bb7e-449f-8aca-5a767d1097e8)](https://github.com/refilc/naplo/commit/8583609abbd6a93ac55ecff93c886d0898f71f12)<br>
([repo](https://github.com/refilc/naplo-plus/))

Ha a projekt AGPL licenc alatt van terjesztve, akkor a teljes forráskódnak, beleértve a **nélkülözhetetlen** részeket is, nyíltnak kell lennie. Ha ez nem lehetséges, akkor a projekt nem terjeszthető **AGPL** licenc alatt.\
Ha a reFilc egy másik licensz alatt lett volna, akkor a jelen kód talán lehetett volna zárt forráskódú. Igen, a Filc premium repoja jól volt licenszelve.

ui.: *A "fixed plus bypass" ([8583609abbd6a93ac55ecff93c886d0898f71f12](https://github.com/refilc/naplo-plus/commit/9516f7d94bad8edc910113ea52250349f391ee0e)) nevű commit nem ér semmit, mert még mindig ugyan úgy be lehet aktiválni az appot, de lehet próbálkozni...*\
*Még valami az [MD5 már nem biztonságos](https://en.wikipedia.org/wiki/MD5#Overview_of_security_issues) hashing, de jól van ha azt szeretnéd, hogy crackeljék a hasheket az emberek csak hajrá*

[Jé](https://github.com/refilc/naplo-plus/blob/main/LICENSE), hát ez meg mi? [2 éven keresztül AGPL alatt volt licenszelve](https://github.com/refilc/naplo-plus/commits/main/LICENSE) a repo és nem volt publikus?\
[![image](https://github.com/user-attachments/assets/d2e35a6b-9a72-4c89-8a83-46369442c1fd)](https://github.com/refilc/naplo-plus/blob/main/LICENSE)
(ha esetleg átírná idő közben [itt megtudod nézni](https://github.com/refilc/naplo-plus/blob/3cb656418f669522539547cfb9169edb6cfdc4de/LICENSE) eredeti állapotában, vagy nézd meg a jelen mappában lévő LICENSE fájlt)

Több sebből vérzik ez a *reFilc+*

### Működés

A működése az *rf+*nak elég egyszerű, vannak scopek és a szervernek vissza kell adnia azt.\
Viszont Filc óta van benne egy *all* scope, ami minden funkciót felold (`refilc.plus.*`)\
A fél auth.dart kódot meggyilkolva skippelni lehet az egész rf apit, hogy állandóan `...*` scopet adjon vissza, ezzel aktiválva az appot. (take notes)\
Ha mindenhova hardcodelve lett volna az auth, akkor *talán* ez a bypass nem működött volna. (jaj ne, de akkor leakelve lett volna az auth és megint csak működött volna)\
**Ez az ára az open sourcenak.** Legalább tudnak segíteni az emberek a fejlesztésben.

Eredeti filc scopekhez képest a reFilcben sokkal több dolog volt paywalleve
```diff
- ...NICKNAME
...GRADE_STATS
- ...CUSTOM_COLORS (témák ingyenesek)
- ...CUSTOM_ICONS
...RENAME_SUBJECTS
- ...TIMETALBE_WIDGET (widget ingyenes, de broken refresh miatt)
- ...FS_TIMETABLE (fullscreen timetable ingyenes)
- ...GOAL_PLANNER
+ ...UNLIMITED_GOAL_PLANNER (felcseréli a GOAL_PLANNER scopet)
+ ...MAX_TWO_ACCOUNTS, ...NO_ACCOUNT_LIMIT
+ ...EARLY_ACCESS (useless)
+ ...TOTAL_GRADE_CALCULATOR
+ ...WELCOME_MESSAGE (ez régen free volt)
+ ...UNLIMITED_SELF_NOTES
+ ...CUSTOM_GRADE_RARITIES
+ ...GRADE_EXPORTING
+ ...APP_ICON_CHANGE, ...CHANGE_APP_ICON
+ ...LIVE_ACTIVITY_COLOR
+ ...CUSTOM_FONT (ez vagy broken vagy idk, de biztos vagyok benne hogy plus nélkül is lehetett állítani)
+ ...TIMETABLE_NOTES
+ ...CALENDAR_SYNC
```
Szegjük meg a licenszt és rakjunk dolgokat paywall mögé!!1!

