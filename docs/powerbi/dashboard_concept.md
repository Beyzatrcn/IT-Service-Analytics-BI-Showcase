# Power-BI-Dashboard-Konzept

## Ziel des Dashboards

Ein kompaktes Management-Dashboard bereitstellen, das IT-Services hinsichtlich Kosten, Nutzung und operativer Effizienz vergleichbar macht.

## Zielgruppe

- CFO und Finance Business Partner
- CIO und IT-Leitung
- Service Owner

## Empfohlene Berichtsseiten

## 1. Management-Übersicht

Zweck:
Darstellung der zentralen Portfoliosicht auf einer Seite.

Empfohlene Visualisierungen:

- KPI-Karten:
  - gesamte IT-Servicekosten
  - gesamte aktive User
  - gesamte eröffnete Tickets
  - durchschnittliche Portfolio-Kosten pro User
- gruppiertes Säulendiagramm: Gesamtkosten nach Service
- Liniendiagramm: monatlicher Gesamtkostentrend
- Streudiagramm: Kosten pro User versus Tickets pro 100 User
- Matrix: Service mit direkten Kosten, allokierten Shared Costs, Kosten pro User, Kosten pro Ticket und Effizienzindex

## 2. Service-Detailanalyse

Zweck:
Einem Manager ermöglichen, einen einzelnen Service im Zeitverlauf zu analysieren.

Empfohlene Visualisierungen:

- Liniendiagramm: Gesamtkosten, aktive User und Tickets nach Monat
- Zerlegungsbaum: Gesamtkosten nach Kostenart
- Balkendiagramm: Automatisierungsquote von Requests nach Monat
- Tacho oder KPI: Verfügbarkeitsquote

## 3. Support und Effizienz

Zweck:
Fokus auf Supportbelastung und operativen Hebel.

Empfohlene Visualisierungen:

- Balkendiagramm: eröffnete Tickets nach Service
- Balkendiagramm: Kosten pro Ticket nach Service
- Liniendiagramm: Trend der Tickets pro 100 User
- Tabelle: Service Owner, SLA %, Automatisierungsquote, Effizienzindex

## 4. Transparenz der Kostenallokation

Zweck:
Transparent darstellen, wie viel Kosten direkt und wie viel gemeinsam allokiert sind.

Empfohlene Visualisierungen:

- gestapeltes Säulendiagramm: direkte Kosten vs Shared Costs nach Service
- Wasserfalldiagramm: Verteilung der Shared Costs nach Service
- Tabelle: Allokationstreiber und monatlicher Anteil aktiver User

## Zentrale Filter

- Reporting-Monat
- Service
- Service Owner
- Servicekategorie

## Design-Hinweise

- fachlich verständliche Bezeichnungen statt technischer Tabellennamen verwenden
- Auffälligkeiten in Gelb und Rot hervorheben
- Finance- und Operations-Sicht auf demselben semantischen Modell halten
- Tooltips für komplexere KPIs wie den Effizienzindex bereitstellen

## Empfehlung für das Datenmodell

Empfohlenes Power-BI-Modell:

- Faktentabelle:
  - `vw_bi_service_monthly`
- unterstützende Übersichtstabelle:
  - `vw_bi_service_summary`
- Datumsdimension:
  - separate Kalendertabelle in Power BI

## Berichtslogik

Der Bericht sollte eine einfache fachliche Geschichte erzählen:

1. wohin die Kosten gehen
2. wie viel geschäftliche Nachfrage jeder Service trägt
3. wo die Supportbelastung hoch ist
4. welche Services effizient wirken oder Handlungsbedarf haben
