# O.MG
Repozitář pro payloady pro O.MG cable od HACK 5, případně USB Rubber Ducky a nebo pro vaše valstní zbastlené pico-ducky: https://sploitech.com/raspberry-pi-projects/how-to-create-usb-rubber-ducky-with-raspberry-pi-pico/

Výše najdete ozkoušené a mnou popsané payloady a návody na jejich úpravy.

# Čeština
Aby skripty co na netu najdete fungovaly, musí být být na začátku každého ducky scriptu tenhle string:

DUCKY_LANG CS

Je to proto, že skriptíky jso běžně psané pro EN rozložení klávesnice a tak předávají při přenosu z kabelu do PC blbý znaky, pokud není nastavená EN jazyková sada. DUCKY_LANG CS ji nastaví na českou a jste v poho. DUCKY_LANG umí více než 120 jazykových sad a je samozřejmě možné je měnit.

# Ofiko repo
Původní repozitář s payloady přímo od Hack5 a dalších najdete zde: https://github.com/hak5/omg-payloads/tree/master/payloads/library
