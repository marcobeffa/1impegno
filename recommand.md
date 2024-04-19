

linkTree per developers https://www.youtube.com/watch?v=2cwjtRR9Rzk 

# 19 aprile 2024 07:48

rails g scaffold Resource user:references tipo nome descrizione body:text img_url email telefono costo:decimal ricavo:decimal data:datetime visibility:integer energy:integer importanza:integer


# 18 aprile 2024 19:30

rails g model Dash valore:decimal eur:decimal usd:decimal jpy:decimal chf:decimal cny:decimal oro_grammi:decimal gbp:decimal

rails g migration AddEnergyToContent energy:integer importanza:integer

# 11 aprile 2024 19:30

rails g migration AddVisibilityToContent visibility:integer



# 8 aprile 2024 19:30

Trasferire su github e farlo open source. Mettere il valore in dash 

rails d migration AddUserToContent user:references



rails g migration AddFieldToContent data:datetime

rails g scaffold Content tipo nome descrizione body:text img_url email telefono costo:decimal ricavo:decimal 



rails g migration AddFieldToUser avatar_url username nome_cognome telefono admin:boolean