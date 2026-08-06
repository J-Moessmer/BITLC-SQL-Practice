import sqlite3
import os

DB_FILE = "practice.db"
SCHEMA_FILE = "schema.sql"
DATA_FILE = "sample_data.sql"

def build_database():
    if os.path.exists(DB_FILE):
        os.remove(DB_FILE)
        print(f"Bestehende Datenbank '{DB_FILE}' wurde gelöscht.")

    conn = sqlite3.connect(DB_FILE)
    cursor = conn.cursor()

    # Foreign Keys in SQLite aktivieren
    cursor.execute("PRAGMA foreign_keys = ON;")

    print("Erstelle Tabellenschema...")
    with open(SCHEMA_FILE, "r", encoding="utf-8") as f:
        cursor.executescript(f.read())

    print("Füge Beispieldaten ein...")
    with open(DATA_FILE, "r", encoding="utf-8") as f:
        cursor.executescript(f.read())

    conn.commit()

    # Übersicht der erstellten Tabellen ausgeben
    cursor.execute("SELECT name FROM sqlite_master WHERE type='table' AND name NOT LIKE 'sqlite_%';")
    tables = cursor.fetchall()
    
    print("\n[OK] Datenbank erfolgreich erstellt!")
    print(f"Datei: {os.path.abspath(DB_FILE)}")
    print("Enthaltene Tabellen:")
    for table in tables:
        t_name = table[0]
        cursor.execute(f"SELECT COUNT(*) FROM {t_name}")
        count = cursor.fetchone()[0]
        print(f"  - {t_name} ({count} Zeilen)")

    conn.close()

if __name__ == "__main__":
    build_database()
