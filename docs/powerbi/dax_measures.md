# DAX-Beispiele

Die folgenden Beispiele gehen davon aus, dass die zentrale Faktentabelle in Power BI `'Service Monthly'` heißt und aus `vw_bi_service_monthly` geladen wird.

## Zentrale Finanzkennzahlen

```DAX
Gesamtkosten :=
SUM ( 'Service Monthly'[total_cost_chf] )
```

```DAX
Direkte Kosten :=
SUM ( 'Service Monthly'[direct_cost_chf] )
```

```DAX
Allokierte Gemeinkosten :=
SUM ( 'Service Monthly'[shared_cost_chf] )
```

## Nutzungs- und Supportkennzahlen

```DAX
Aktive User Gesamt :=
SUM ( 'Service Monthly'[active_users] )
```

```DAX
Eröffnete Tickets Gesamt :=
SUM ( 'Service Monthly'[opened_tickets] )
```

```DAX
Gelöste Tickets Gesamt :=
SUM ( 'Service Monthly'[resolved_tickets] )
```

## KPI-Kennzahlen

```DAX
Kosten pro User :=
DIVIDE ( [Gesamtkosten], [Aktive User Gesamt] )
```

```DAX
Kosten pro Ticket :=
DIVIDE ( [Gesamtkosten], [Gelöste Tickets Gesamt] )
```

```DAX
Tickets pro 100 User :=
DIVIDE ( [Eröffnete Tickets Gesamt], [Aktive User Gesamt] ) * 100
```

```DAX
Automatisierungsquote % :=
DIVIDE (
    SUM ( 'Service Monthly'[automated_requests] ),
    SUM ( 'Service Monthly'[total_requests] )
) * 100
```

```DAX
SLA-Quote Durchschnitt :=
AVERAGE ( 'Service Monthly'[sla_met_pct] )
```

```DAX
Effizienzindex Durchschnitt :=
AVERAGE ( 'Service Monthly'[service_efficiency_index] )
```

## Trendkennzahlen

```DAX
Kosten Vormonat :=
CALCULATE (
    [Gesamtkosten],
    DATEADD ( 'Calendar'[Date], -1, MONTH )
)
```

```DAX
Kostenabweichung zum Vormonat :=
[Gesamtkosten] - [Kosten Vormonat]
```

```DAX
Kostenabweichung % zum Vormonat :=
DIVIDE ( [Kostenabweichung zum Vormonat], [Kosten Vormonat] )
```

## Portfolio-Ranking-Kennzahlen

```DAX
Kostenrang Service :=
RANKX (
    ALL ( 'Service Monthly'[service_name] ),
    [Gesamtkosten],
    ,
    DESC
)
```

```DAX
Service mit höchsten Kosten :=
TOPN (
    1,
    VALUES ( 'Service Monthly'[service_name] ),
    [Gesamtkosten],
    DESC
)
```

## Hinweise zur Interpretation

- `Kosten pro User` unterstützt den Finance-Vergleich über Services mit breiter Mitarbeiterreichweite.
- `Kosten pro Ticket` sollte immer zusammen mit Ticketkomplexität und Service-Kritikalität betrachtet werden.
- `Effizienzindex Durchschnitt` eignet sich vor allem als richtungsweisender Management-Indikator und nicht als Ersatz für operative Ursachenanalyse.

