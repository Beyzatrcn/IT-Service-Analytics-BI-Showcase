# Data Governance und Datenqualität

## Governance-Ziel

Governance soll in diesem Showcase sicherstellen, dass das Reporting-Modell:

- von Finance und Management als vertrauenswürdig wahrgenommen wird
- für fachliche Stakeholder verständlich bleibt
- für wiederkehrende monatliche Refreshes tragfähig ist

## Rollenmodell

| Rolle | Verantwortung |
|---|---|
| Finance BI Analyst | Verantwortet KPI-Definitionen, Reporting-Logik und fachliche Validierung |
| SAP Data Owner | Stellt vollständige Finanzbuchungen und korrekte Cost-Center-Zuordnungen sicher |
| Dynamics Service Manager | Pflegt den Servicekatalog und die Prozessmetadaten |
| IT Operations Analyst | Validiert Nutzungs- und Support-Extrakte aus lokalen SQL-Datenbanken |
| Service Owner | Bewertet servicebezogene KPI-Interpretationen und Verbesserungsmaßnahmen |

## Zentrale Governance-Regeln

### Master-Data-Governance

- `service_code` ist der verbindliche fachliche Schlüssel über alle Systeme hinweg
- Service-Namen müssen fachlich verständlich und über die Zeit stabil bleiben
- jeder Service muss genau einen verantwortlichen Owner im Servicekatalog haben

### Financial Governance

- SAP bleibt das führende System für Kosten
- Shared-Cost-Allokation wird getrennt von direkten Kosten dokumentiert
- die Allokationslogik muss über die Monate konsistent bleiben, sofern keine formale Änderung beschlossen wird

### KPI-Governance

- KPI-Definitionen müssen versioniert werden
- jede Änderung an einer KPI-Formel muss vor der Reporting-Veröffentlichung kommuniziert werden
- Power-BI-Bezeichnungen müssen exakt zu den dokumentierten KPI-Namen passen

## Datenqualitätsprüfungen

| Prüfung | Regel | Maßnahme bei Fehler |
|---|---|---|
| Fehlender Service-Code | Kein Quellrecord darf ohne gültigen Service-Code in den Mart gelangen | Zeile ablehnen und für Korrektur protokollieren |
| Doppelte Service-Monats-Zeile | Pro Quelle darf es nur eine Zeile je Service und Monat geben | Quell-Extrakt untersuchen |
| Negative aktive User | Aktive User müssen null oder positiv sein | Load stoppen |
| Gelöste Tickets deutlich höher als eröffnete Tickets | Konsistenz des Summenextrakts prüfen | Mit Operations Owner klären |
| Automatisierte Requests > Gesamt-Requests | Nicht zulässig | Load stoppen |
| Nicht gemapptes SAP Cost Center | Jede Buchung muss einer direkten oder gemeinsamen Logik zugeordnet sein | In Exception Queue zurückhalten |
| SLA-Tickets > gelöste Tickets | Nicht zulässig | Load stoppen |

## Refresh-Rhythmus

- Empfohlene Refresh-Frequenz: monatlich
- Empfohlener Ablauf:
  - Tag 1 bis 3: SAP-Abschlussdaten liegen vor
  - Tag 2 bis 4: Dynamics- und lokale SQL-Extrakte werden aktualisiert
  - Tag 4 bis 5: BI-Transformation und Validierung
  - Tag 5: Veröffentlichung des Management-Dashboards

## Bekannte Designgrenzen

- Shared Cost wird aus Gründen der Verständlichkeit über einen einzelnen Treiber allokiert
- Nutzung ist monatlich zusammengefasst und nicht täglich verfügbar
- Das Beispiel enthält keine Chargeback- oder Budgetlogik auf Fachbereichsebene
- Das Modell dient Management-Transparenz und nicht dem buchhalterischen Abschluss

## Empfohlene Weiterentwicklungen

- Workflow für Cost-Center-Ausnahmen einführen
- Budget-versus-Actual-Logik im Mart ergänzen
- Zielwerte für Rot-Gelb-Grün je Service definieren
- Historisierung von KPI-Definitionen aufbauen
- Ein semantisches Power-BI-Modell mit zertifizierten Measures bereitstellen
