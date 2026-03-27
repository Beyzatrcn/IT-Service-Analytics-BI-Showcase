# SAP-Kostenzuordnungslogik

## Zweck

SAP-Buchungen liegen nicht immer in einer unmittelbar reportingfähigen Service-Struktur vor. Dieses Dokument erklärt, wie Kosten aus SAP-Kontierungsobjekten in servicebezogenes BI-Reporting überführt werden.

## Mapping-Strategie

Die Beispiel-Logik verwendet zwei Ebenen:

1. Direkte Zuordnung von service-spezifischen Cost Centern zu einem Service-Code
2. Shared-Cost-Allokation für gemeinsame IT-Gemeinkosten, die nicht direkt zugeordnet werden können

## Reihenfolge der Kostenlogik

### 1. Direkte Servicekosten

Wenn eine Buchung zu einem dedizierten Service-Cost-Center gehört, wird sie direkt diesem Service zugeordnet.

Beispiele:

- `CC_VPN` -> `VPN`
- `CC_STORAGE` -> `CLOUD_STORAGE`
- `CC_EMAIL` -> `EMAIL`
- `CC_IAM` -> `IDENTITY_ACCESS`
- `CC_SVC_DESK` -> `SERVICE_DESK`

### 2. Gemeinsame IT-Gemeinkosten

Wenn eine Buchung zu `CC_SHARED` gehört, wird sie als Shared Cost behandelt und im selben Monat anhand des Anteils aktiver User auf die Services verteilt.

Das ist für Kostenarten geeignet wie zum Beispiel:

- zentrales Monitoring
- Architektur-Gemeinkosten
- gemeinsame Plattformadministration

## Cost Buckets

Die Beispiel-Logik klassifiziert Kosten zusätzlich in fachlich verständliche Buckets:

- Labor
- Software
- Hosting
- Shared Overhead

Diese Buckets unterstützen Management-Diskussionen, ohne zu tief in technische SAP-Strukturen einzusteigen.

## Allokationstreiber

Der gewählte Treiber lautet:

`monthly active users per service / total monthly active users across all services`

Dieser Treiber ist einfach, nachvollziehbar und für das Management gut überprüfbar.

## Warum aktive User?

Aktive User sind ein sinnvoller Näherungswert, weil:

- die betrachteten Services mitarbeiternah sind
- das Management nutzerbezogene Logik intuitiv versteht
- eine willkürliche Gleichverteilung vermieden wird

In einer produktiven Lösung könnten je nach Service auch spezifischere Treiber sinnvoll sein, zum Beispiel:

- Storage-Volumen
- Ticketvolumen
- Identity-Transaktionen
- Server- oder Workload-Verbrauch

## Beispiel für die Allokationslogik

Wenn die Shared Costs im März CHF 8.100 betragen und VPN 860 aktive User von insgesamt 4.430 hat, entfällt auf VPN:

`8,100 * (860 / 4,430) = 1,572.23 CHF`

## Erwartete Kontrollen

- jede SAP-Buchung muss entweder einer direkten Zuordnung oder einer Shared-Cost-Logik zugeordnet sein
- Mapping-Tabellen müssen versioniert werden
- Änderungen an der Allokationslogik müssen vor dem nächsten Reporting-Zyklus dokumentiert werden
- Direct Cost und Shared Cost sollten im Reporting getrennt sichtbar bleiben

## Bedeutung für das Reporting

Das finale Management-Dashboard sollte immer die Unterscheidung ermöglichen zwischen:

- direktem Serviceaufwand
- allokierten Shared Costs
- gesamten Servicekosten

Das stärkt das Vertrauen in die Zahlen und reduziert unnötige Diskussionen darüber, ob ein Kostenblock operativ verantwortet oder nur zur Transparenz allokiert wurde.

