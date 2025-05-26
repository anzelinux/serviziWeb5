```mermaid

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
      int ID_stato_consulenza FK
      int ID_cliente FK
    }

    STATO {
      int ID_stato_consulenza PK 
      string stato "In corso, Scaduta, Sostituita"
    }

    CONTRATTO {
      int ID_contratto PK
      date Data_inizio
      date Data_fine
      int ID_servizio FK
      int ID_consulenza FK
      int ID_fattura FK
    }
    
    SERVIZIO {
      int ID_servizio PK
      string Nome
    }
    
    FATTURA {
      int ID_fattura PK
      float Importo
      date Data_emissione
      int ID_consulenza FK "opzionale"
      int ID_fattura FK "opzionale"
    }
    
    PAGAMENTO {
      int ID_pagamento PK
      date Data_pagamento
      float Importo_pagato
      int ID_fattura FK
      int ID_modalita FK
      int ID_SALDO FK
    }
    
    MODALITA_PAGAMENTO {
    int ID_modalita PK
    string tipo_pagamento "Contanti, PayPal, Bancomat"
    }

    SALDO {
    int id_saldo PK
    string descrizione "Saldato, Non saldato"
    }


  
    CLIENTE ||--o{ CONSULENZA : "richiede"
    CONSULENZA ||--o{ CONTRATTO : "genera"
    SERVIZIO ||--o{ CONTRATTO : "riferito"
    STATO ||--o{ CONSULENZA : "definisce"
    MODALITA_PAGAMENTO ||--o{ PAGAMENTO : "effettuato"
    SALDO ||--o{ PAGAMENTO : "è riferito"

    %% FATTURA discende da  una CONSULENZA oppure da un CONTRATTO
    
    %% UN CONTRATTO o una CONSULENZA  producono una o più FATTURE
    CONSULENZA ||--o{ FATTURA : "può dar luogo a"
    CONTRATTO ||--o{ FATTURA : "può dar luogo a"
    
    
    FATTURA ||--o{ PAGAMENTO : "regola"
