linkTree per developers https://www.youtube.com/watch?v=2cwjtRR9Rzk 

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