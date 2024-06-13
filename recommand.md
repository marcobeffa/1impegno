


## Valuta: 
rails g model Booking dataevent:references user:references invitato_da_user_id:integer approvato_da_user_id:integer prezzo_euro:decimal prezzo_dash:decimal data_pagamento:datetime conferma_presenza:datetime

rails g model Dataevent user:references content:references date_start:datetime date_end:datetime slot:boolean week_year:integer week_n:integer day_of_week:integer repetition:boolean unity_time:integer ogni_n:integer date_repeat_start:datetime date_repeat_end:datetime 


enum unity_time: {secondi: 0, minuti: 1, ore: 2, giorni: 3, settimane: 4, mesi: 5, bimestri: 6, trimestri: 7, quadrimestri: 8, semestri: 9, anni: 10 }

--- 
rails g scaffold Dataevent inizio:datetime fine:datetime content:references user:references  luogo_content_id:integer gmaps_link  seriale:boolean tipo:integer num_partecipanti:integer parent_id:integer valore_euro:decimal valore_dash:decimal  admin_u_id:integer resp_luogo_u_id:integer organizzatore_u_id conduttore_u_id partecipante_u_id partec_contat_content_id:

enum tipo: {data: 0,  ticket: 1, contabilità: 2}


# mer 6 Giu 2024 09:21
rails g controller Dashboard imprese progetti settimana obiettivo attivit processi todo

rails generate migration DropLinkcontentsTable
rails g model Linkcontent user:refernces content_1_id:integer content_2_id:integer



# 10 maggio 2024 07:48

rails g migration AddEurToContent costo_eur:decimal ricavo_eur:decimal

# 6 maggio 2024 07:48

rails g migration AddStatoToContent stato:integer

# 3 maggio 2024 07:48
rails g migration AddMermaidToContent mermaid:text


linkTree per developers https://www.youtube.com/watch?v=2cwjtRR9Rzk 


 modificato:             Gemfile
        modificato:             Gemfile.lock
        modificato:             config/environments/production.rb
        
# 23 aprile 2024 07:48
rails d migration AddDashToContent costo_dash:float ricavo_euro:float


# 19 aprile 2024 07:48
rails g migration RemoveFieldToDash bch xlm 

eur chf gbp  usd jpy  btc eth ltc eos dot link 

rails g migration AddBtcToDash btc:float eth:float ltc:float eos:float dot:float link:float 

rails g model Dash eur:decimal chf:decimal gbp:decimal  usd:decimal jpy:decimal cny:decimal kwd:decimal inr:decimal 



# 18 aprile 2024 19:30


rails g migration AddEnergyToContent energy:integer importanza:integer

# 11 aprile 2024 19:30

rails g migration AddVisibilityToContent visibility:integer



# 8 aprile 2024 19:30

Trasferire su github e farlo open source. Mettere il valore in dash 

rails d migration AddUserToContent user:references



rails g migration AddFieldToContent data:datetime

rails g scaffold Content tipo nome descrizione body:text img_url email telefono costo:decimal ricavo:decimal 



rails g migration AddFieldToUser avatar_url username nome_cognome telefono admin:boolean