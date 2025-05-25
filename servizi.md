erDiagram
    CLIENTE {
      int ID_cliente PK
      string Nome
      string Contatti
      string Azienda
    }
    
    CONSULENZA {
      int ID_consulenza PK
      date Data_creazione
      string Note
      string Stato_consulenza "In corso, Scaduta, Sostituita"
      int ID_cliente FK
    }
    
    CONTRATTO {
      int ID_contratto PK
      date Data_inizio
      date Data_fine
      string Tipo_servizio
      int ID_consulenza FK
    }
    
    SERVIZIO {
      int ID_servizio PK
      string Nome
      int ID_contratto FK
    }
    
    FATTURA {
      int ID_fattura PK
      float Importo
      date Data_emissione
      int ID_consulenza FK "opzionale"
      int ID_servizio FK "opzionale"
    }
    
    PAGAMENTO {
      int ID_pagamento PK
      date Data_pagamento
      float Importo_pagato
      int ID_fattura FK
      string Modalita "Contanti, PayPal, Bancomat"
      string Stato_pagamento "Saldato, Non saldato"
    }
    
    CLIENTE ||--o{ CONSULENZA : "richiede"
    CONSULENZA ||--o{ CONTRATTO : "genera"
    CONTRATTO ||--o{ SERVIZIO : "comprende"
    
    %% FATTURA può derivare o da una CONSULENZA oppure da un SERVIZIO  
    CONSULENZA ||--o{ FATTURA : "può dar luogo a"
    SERVIZIO ||--o{ FATTURA : "può dar luogo a"
    
    FATTURA ||--o{ PAGAMENTO : "regola"
