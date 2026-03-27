# KPI-Definitionen

## KPI-Designprinzipien

Die KPIs in diesem Showcase sind bewusst einfach, transparent und managementtauglich gehalten. Sie sollen Diskussionen und Priorisierung unterstützen und nicht detailliertes operatives Reporting ersetzen.

## Kern-KPIs

| KPI | Fachliche Definition | Formel | Interpretation |
|---|---|---|---|
| Kosten pro Service | Gesamtkosten eines Services pro Monat | `Direct Cost + Allocated Shared Cost` | Zeigt den gesamten finanziellen Footprint eines Services |
| Nutzung pro Service | Geschäftliche Nutzung eines Services pro Monat | `Usage Volume` | Zeigt die Nachfrage in der für den Service passenden Einheit |
| Kosten pro User | Gesamtkosten eines Services geteilt durch aktive User | `Total Cost / Active Users` | Zeigt die Wirtschaftlichkeit im Verhältnis zur Nutzerbasis |
| Tickets pro Service | Monatliche Supportbelastung je Service | `Opened Tickets` | Zeigt den operativen Supportaufwand |
| Kosten pro Ticket | Gesamtkosten eines Services geteilt durch gelöste Tickets | `Total Cost / Resolved Tickets` | Zeigt, wie viel Kosten hinter jedem gelösten Supportfall stehen |
| Tickets pro 100 User | Auf die Nutzerbasis normierte Ticketintensität | `(Opened Tickets / Active Users) * 100` | Erlaubt den Vergleich unterschiedlich großer Services |
| Automatisierungsquote | Anteil automatisiert bearbeiteter Service Requests | `Automated Requests / Total Requests` | Zeigt Prozessreife und operativen Hebel |
| Service Efficiency Index | Verdichteter Indikator für Nutzen im Verhältnis zu Kosten und Supportbelastung | `((Active Users / Total Cost) * 1000) / (1 + Tickets per 100 Users)` | Höhere Werte stehen für größere Reichweite bei geringeren Kosten und geringerer Supportlast |

## Hinweise zu den KPIs

### Kosten pro Service

Dieser KPI umfasst sowohl direkte Servicekosten als auch einen allokierten Anteil gemeinsamer IT-Gemeinkosten. Er dient der Management-Transparenz und nicht der gesetzlichen Rechnungslegung.

### Nutzung pro Service

Die Nutzung ist bewusst service-spezifisch definiert:

- VPN: durchschnittliche monatlich aktive User
- Cloud Storage: gespeicherte Terabytes
- Email: verarbeitete Nachrichten
- Identity & Access: Provisioning-Ereignisse
- Service Desk: bearbeitete Requests

### Kosten pro User

Dieser KPI ist besonders relevant für Workplace-nahe Services und erlaubt einer Finance-Zielgruppe den Effizienzvergleich über Services mit breiter Mitarbeiterreichweite.

### Kosten pro Ticket

Diese Kennzahl ist vor allem für supportintensive Services hilfreich, sollte aber immer zusammen gelesen werden mit:

- Kritikalität des Services
- Komplexität des Services
- Automatisierungspotenzial

### Service Efficiency Index

Der Efficiency Index ist ein Portfolio-KPI und keine finanzbuchhalterische Kennzahl. Er ist nützlich, weil er Folgendes zusammenführt:

- geschäftliche Reichweite
- Kosten
- Supportintensität

Er sollte für richtungsweisende Vergleiche genutzt werden, nicht als alleinige Entscheidungsregel.

## Vorgeschlagene Schwellenlogik

| KPI | Grün | Gelb | Rot |
|---|---|---|---|
| Kosten pro User | Stabil oder rückläufig | Bis zu 5 % über dem Ausgangswert | Mehr als 5 % über dem Ausgangswert |
| Tickets pro 100 User | Unter Zielwert | Leicht über Zielwert | Deutlich über Zielwert |
| Automatisierungsquote | Verbessernder Trend | Seitwärtsbewegung | Rückläufiger Trend |
| Service Efficiency Index | Über Portfoliodurchschnitt | Nahe am Portfoliodurchschnitt | Unter Portfoliodurchschnitt |

## Verantwortlichkeiten

| KPI | Primärer Owner | Sekundärer Owner |
|---|---|---|
| Kosten pro Service | Finance BI | Service Owner |
| Kosten pro User | Finance BI | IT-Leitung |
| Tickets pro Service | Service Operations | Service Owner |
| Kosten pro Ticket | Finance BI | Service Operations |
| Service Efficiency Index | BI / Management Reporting | CIO Office |
