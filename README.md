Progetto utile alla preparazione alla seconda prova dell' esame di stato

### Consegna Per la seconda prova del corso SIA (Sistemi Informativi Aziendali), una traccia verosimile potrebbe riguardare un caso aziendale che richieda l'analisi, la progettazione e l'implementazione di soluzioni informatiche per la gestione dei dati e dei processi aziendali.

Ecco un esempio di traccia:

**Titolo:** Ottimizzazione dei Processi Aziendali attraverso un Sistema Gestionale

**Scenario:** L'azienda "TechSolution S.r.l.", operante nel settore della consulenza informatica, ha riscontrato difficoltà nella gestione delle commesse dei clienti. Attualmente utilizza fogli di calcolo per monitorare le richieste, la fatturazione e il planning dei tecnici, ma questa metodologia porta a errori e rallentamenti nella gestione operativa.

**Obiettivi della prova:**
1. **Analisi del problema** – Identificare le criticità dell'attuale sistema di gestione.
2. **Progettazione della soluzione** – Ideare un database relazionale con le principali tabelle necessarie per la gestione delle commesse e dei clienti.
3. **Sviluppo** – Creare un’applicazione che permetta la registrazione delle commesse, il monitoraggio dello stato di avanzamento, la gestione dei pagamenti per i servizi offerti.
4. **Verifica e miglioramenti** – Testare il sistema proposto e suggerire eventuali miglioramenti.

**Consegna richiesta:** 
- Relazione con analisi, diagrammi UML e struttura del database.
- Script SQL per la creazione delle tabelle.
- Breve documento sull'uso dell’applicazione.

Questa traccia permette agli studenti di applicare le competenze di informatica e gestione aziendale in un contesto pratico e stimolante. Vuoi che aggiunga degli approfondimenti su qualche aspetto specifico?

#### Obiettivo
     Progettare un modello Entità‑Relazioni (ER) e uno schema logico per un sistema di gestione delle attività di consulenza, che includa la registrazione di clienti, consulenze, contratti e servizi, nonché la gestione di fatturazione e pagamenti. L’obiettivo è quello di garantire che il modello sia:
  
- **Normalizzato** (minimo ridondante, in 1NF, 2NF e 3NF)
- **Coerente**: Le entità sono collegate correttamente tramite chiavi esterne, e le relazioni (cardinalità) sono appropriate
- **Espandibile**: Sono presenti entità dedicate per gestire particolari aspetti (ad esempio, lo stato della consulenza e le modalità di pagamento)

#### Scenario
I requisiti del sistema sono i seguenti:

1. **Cliente**:  
   - Ogni cliente può richiedere una o più consulenze.

2. **Consulenza**:  
   - Rappresenta la richiesta di assistenza fatta dal cliente.
   - Ogni consulenza deve avere uno stato (es. "In corso", "Scaduta", "Sostituita") e si collega a un solo cliente.

3. **Contratto e Servizio**:  
   - Una consulenza può dare origine a uno o più contratti.
   - Un contratto comprende uno o più servizi erogati al cliente.

4. **Fattura**:  
   - Può derivare dalla consulenza diretta oppure dai servizi previsti da un contratto.
   - Perciò, la fattura conterrà chiavi esterne opzionali: una per la consulenza e una per il servizio (almeno una dovrà essere valorizzata nel record).

5. **Pagamento**:  
   - Ogni fattura viene regolata da uno o più pagamenti.
   - Il pagamento deve registrare la modalità (come "Contanti", "PayPal", "Bancomat") e lo stato (ad esempio "Saldato" o "Non saldato").
   - Le modalità e lo stato vengono gestiti tramite entità a parte, per evitare ripetizioni e rendere il modello scalabile.

#### Linee Guida e Domande da Porsi

- **Identificazione delle Entità:**  
  - Quali sono gli attori principali (es. Cliente, Consulenza, Contratto, Servizio, Fattura, Pagamento)?
  - Sono necessari elementi ausiliari per catturare dettagli specifici come lo stato della consulenza o la modalità di pagamento?

- **Definizione delle Cardinalità:**  
  - Un cliente può avere molte consulenze (1:N).
  - Ogni consulenza ha un solo stato, ma lo stesso stato può essere applicato a più consulenze (1:N).
  - Una consulenza può portare a più contratti, e ogni contratto appartiene a una sola consulenza (1:N).
  - Un contratto può comprendere più servizi (1:N).
  - La fattura può derivare sia dalla consulenza che dal servizio: bisogna gestirne il collegamento con FK opzionali.
  - Una fattura può essere regolata da più pagamenti (1:N).

- **Normalizzazione e Verifica:**  
  - Ogni entità contiene soltanto dati atomici e relativi a sé (ad es. la CONSULENZA contiene data, note e i riferimenti a CLIENTE e STATO).
  - Esiste una chiave primaria per ogni entità e le relazioni sono gestite tramite chiavi esterne appropriate.
  - Le entità che contengono “valori fisso” (come gli stati o le modalità di pagamento) sono separate per evitare ripetizioni nei record.

---

#### Il Modello ER Finale


### Come Usare Questa Consegna

1. **Leggere attentamente lo scenario e le richieste:**  
   Studenti e docenti possono analizzare lo scenario passo dopo passo, ponendosi le domande chiave elencate.
   
2. **Identificare e definire le entità e le relazioni:**  
   Usare le domande guida per strutturare il modello. Assicurarsi che ogni entità abbia attributi atomici e che le relazioni (cardinalità) siano corrette.
   
3. **Verificare la normalizzazione e aggiornare il modello se necessario:**  
   Discutere in gruppo o con l’AI eventuali ambiguità o possibilità di miglioramento.
   

