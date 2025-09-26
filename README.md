# Mein Erstes Unternehmen – Ghost CMS Projekt

Dieses Projekt ist eine **CMS-Webseite mit Ghost**, die Informationen für Gründer:innen bereitstellt  
(z. B. Unternehmensformen, Businessplan, Finanzierung).

---

## 🚀 Lokale Installation (Docker + SQLite)

1. Repository klonen:

```bash
   git clone https://github.com/<BENUTZERNAME>/cms-project.git
   cd cms-project
````

2. Sicherstellen, dass der DB-Pfad existiert:

```bash
   mkdir -p content/data
   sudo chown -R 1000:1000 content
```

3. Ghost starten:

```bash
   docker compose up -d
```

4. Webseite im Browser öffnen:
   [http://localhost:2368](http://localhost:2368)

   Admin-Interface:
   [http://localhost:2368/ghost](http://localhost:2368/ghost)
---

## 🌐 Deployment auf Render

1. Repository mit **GitHub** verbinden.

2. Einen neuen **Web Service** erstellen.

3. Als Deploy-Methode **Docker Compose** wählen.

4. **Environment Variablen** hinzufügen (für PostgreSQL auf Render):

```bash
   database__client=pg
   database__connection__host=<HOST>
   database__connection__user=<USER>
   database__connection__password=<PASSWORT>
   database__connection__database=<DATENBANKNAME>
   database__connection__port=5432
   url=https://<NAME>.onrender.com
```

5. Nach erfolgreichem Build ist die Seite online verfügbar:
```bash
   https://<NAME>.onrender.com
   https://<NAME>.onrender.com/ghost  # (Admin)
```
---

## 📂 Projektstruktur

```
cms-project/
├── docker-compose.yml     # Startkonfiguration für Ghost
├── README.md              # Dokumentation
├── .gitignore             # Ausschluss von unnötigen Dateien
├── content/               # Ghost-Daten (lokal SQLite)
└── theme/                 # (optional) eigene Ghost-Theme
```

---

## ⚙️ docker-compose.yml (Beispiel, lokal SQLite)

```yaml
version: '3.1'

services:
  ghost:
    image: ghost:6-alpine
    ports:
      - "2368:2368"
    environment:
      url: http://localhost:2368
      database__client: sqlite3
      database__connection__filename: /var/lib/ghost/content/data/ghost-local.db
    volumes:
      - ./content:/var/lib/ghost/content
    restart: unless-stopped
```

---

## 🔧 Troubleshooting

* **Fehler: `connection.filename` fehlt**
  → siehe `docker-compose.yml` oben, Pfad muss gesetzt sein.

* **„permission denied“ bei docker**

```bash
  sudo usermod -aG docker $USER
  newgrp docker
```

* **Render startet langsam**
  Free-Plan schläft nach Inaktivität ein → kurz warten (30–60 s).

---

## 👥 Teamarbeit

* Zweite Person kann als **Staff User** im Admin-Interface eingeladen werden.
* Rollen: *Editor*, *Author*, *Contributor*.
* Inhalte exportieren/importieren: **Settings → Labs → Export/Import**.

---

## 📌 Hinweise

* **Ghost Version**: 6.x (alpine)
* **Datenbank**: lokal SQLite, auf Render PostgreSQL

---


## ▶️ Start / Stop / Restart


**Starten (im Hintergrund):**

```bash
docker compose up -d
```

**Logs anzeigen (laufend):**

```bash
docker compose logs -f
```

**Neustart:**

```bash
docker compose restart
```

**Stoppen (Container beenden, Daten bleiben erhalten):**

```bash
docker compose down
```
---
## Dokumentation

Ghost verfügt über eine sehr gute offizielle Dokumentation, die den gesamten Prozess der Installation, Einrichtung und Nutzung ausführlich beschreibt.  
Die Dokumentation ist hier verfügbar: [Ghost Docs](https://docs.ghost.org/introduction)

Wir haben sie während der Installation und Konfiguration von Ghost in Docker genutzt, da sie folgende Vorteile bietet:
- Schritt-für-Schritt-Anleitungen für verschiedene Umgebungen (lokal, Docker, Cloud),
- Erklärung der grundlegenden Konzepte (Posts, Pages, Tags, Navigation, Themes),
- Leitfäden zur Administration, SEO und Erweiterungen,
- Detaillierte Code-Beispiele und API-Beschreibungen.

✅ Dank dieser Dokumentation war die Arbeit mit Ghost wesentlich einfacher und übersichtlicher.


---
email: cms@3akift.at
Password: anh^nataliia

