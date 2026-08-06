# Tarif DB

This script creates a sample tariff‑and‑customer database (`TarifDB`). It defines:

- **Ansprechpartner** – contact person details
- **Tarif** – tariff definitions
- **Kunde** – customers linked to an Ansprechpartner
- **Kunde_Tarif** – junction table assigning tariffs to customers with start/end dates

The script drops nothing; it assumes a clean database. After running, you can query the tables to explore relationships, cascade updates, and basic referential integrity.
