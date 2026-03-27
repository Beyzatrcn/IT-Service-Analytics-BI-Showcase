# Fallübersicht

## Szenario

Ein fiktives mittelständisches Unternehmen betreibt eine zentrale interne IT-Organisation, die grundlegende Workplace- und Support-Services für das gesamte Unternehmen bereitstellt. Finance und Management möchten besser verstehen, wie sich IT-Servicekosten in geschäftliche Nutzung und operativen Aufwand übersetzen.

Die aktuelle Reporting-Landschaft ist fragmentiert:

- SAP enthält die finanzielle Sicht auf IT-Kosten
- Microsoft Dynamics enthält Servicekatalog- und Request-Management-Kontext
- lokale SQL-Datenbanken enthalten Nutzungs- und Supportaktivitäten

Dadurch sind zwar einzelne Kennzahlen sichtbar, integrierte Fragestellungen lassen sich jedoch nur schwer beantworten, zum Beispiel:

- Welche Services sind im Verhältnis zu ihrer Nutzerbasis am teuersten?
- Welche Services erzeugen eine überproportionale Supportbelastung?
- Wo steigen die Kosten schneller als die geschäftliche Nachfrage?
- Welche Services wirken ausreichend effizient, um weiter skaliert zu werden?

## BI-Zielbild

Aufbau eines einfachen, managementtauglichen Reporting-Modells, das Kosten, Nutzung und operativen Aufwand für zentrale IT-Services zusammenführt.

Die Zielgruppen sind:

- CFO und Finance Business Partner
- CIO und IT-Leitung
- Service Owner
- Operations Manager

## Analytischer Umfang

Dieses Showcase konzentriert sich auf fünf Beispiel-Services:

- VPN
- Cloud Storage
- Email
- Identity & Access
- Service Desk

Das Reporting-Modell umfasst:

- monatliche Servicekosten
- monatliche Nutzungsvolumen
- Nutzerbasis je Service
- Supportticket-Volumen
- Kennzahlen zur Request-Automatisierung
- abgeleitete Effizienz-KPIs

## Berücksichtigte Quellsysteme

### SAP

SAP dient als Quelle für Finanzbuchungen, unter anderem für:

- direkte Servicekosten
- interne Personalkosten
- Software-Abonnements
- Infrastruktur- oder Hosting-Kosten
- gemeinsame IT-Gemeinkosten

### Microsoft Dynamics

Dynamics dient als Quelle für:

- Attribute aus dem Servicekatalog
- Informationen zu Service-Verantwortlichen
- Zusammenfassungen von Request-Aktivitäten
- operativen Kontext für Automatisierung und Fulfillment

### Lokale SQL-Datenbanken

Diese liefern:

- monatliche Kennzahlen zur Servicenutzung
- monatliche Kennzahlen zu Supporttickets

## Lösungsansatz

Das BI-Design folgt einem pragmatischen Muster:

1. Service-Identifikatoren werden systemübergreifend standardisiert.
2. SAP-Cost-Center werden Services und Kostenarten zugeordnet.
3. Gemeinkosten werden über einen transparenten Treiber verteilt.
4. Kosten, Nutzung und Supportaktivität werden in einem monatlichen Mart zusammengeführt.
5. Für Power BI werden fachlich verständliche Reporting Views bereitgestellt.

## Annahmen

- Alle Werte in diesem Repository sind Dummy-Daten.
- Die Währung ist der Einfachheit halber USD.
- Shared Cost wird anhand des Anteils aktiver User allokiert.
- Monatliche Granularität ist für Management-Reporting ausreichend.
- Das Beispiel-SQL verwendet aus Gründen der Lesbarkeit eine PostgreSQL-nahe Syntax.

## Erwarteter Business-Nutzen

Mit diesem Modell kann das Management:

- Services auf einer einheitlichen Reporting-Basis vergleichen
- Services mit steigendem Kostendruck identifizieren
- supportintensive Prozesse gezielt hinterfragen
- Automatisierung oder Vertragsoptimierung priorisieren
- Budgetdiskussionen mit servicebezogenen Fakten führen
