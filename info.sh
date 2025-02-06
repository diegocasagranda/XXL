#!/bin/bash
#
#===============================================================================
#
# File...........: ShellDocTemplate.sh
# Title..........: System Test ShellScript
# Program........: Shell Template Code -  GNU/Linux
#
# Description....: Cotações atuais em modo TXT
#
# Copyright......: Copyright(c) 2024 / @Diego.Casagranda - HackLab
# License........: GNU GENERAL PUBLIC LICENSE - Version 3, 29 June 2007
#
# Author.........: Diego Casagranda
# E-Mail.........: diego.casagranda@yahoo.com
#
# Dependency.....: None
#
# Date...........: 04/12/2024
# Update.........: None
#
# Version........: 0.1.0
#
#===============================================================================
#
# ###########
# # History #
# ###########
#
#     04/12/2024 : Criação do template
#
#===============================================================================

# Define a URL da API do CoinGecko
URL="https://api.coingecko.com/api/v3/simple/price?ids=bitcoin,ethereum,solana,polkadot&vs_currencies=usd"

# Faz a requisição e armazena a resposta
response=$(curl -s "$URL")

# Verifica se a resposta foi bem-sucedida
if [ $? -ne 0 ]; then
    echo "Erro ao buscar os dados da API."
    exit 1
fi

# Usa jq para extrair os valores
bitcoin=$(echo "$response" | jq -r '.bitcoin.usd')
ethereum=$(echo "$response" | jq -r '.ethereum.usd')
solana=$(echo "$response" | jq -r '.solana.usd')
polkadot=$(echo "$response" | jq -r '.polkadot.usd')

# Função para formatar os valores com ponto na casa do milhar
formatar_numero() {
    echo "$1" | awk '{printf "%\047.2f", $1}' | sed 's/,/./g'
}

# Formata os valores
formatted_bitcoin=$(formatar_numero "$bitcoin")
formatted_ethereum=$(formatar_numero "$ethereum")
formatted_solana=$(formatar_numero "$solana")
formatted_polkadot=$(formatar_numero "$polkadot")

gasolina=$(./gasolina.sh)
dolar=$(./dolar.sh)
prata=$(./prata.sh)
ouro=$(./ouro.sh)
petroleo=$(./petroleo.sh)

# Exibe as cotações formatadas
echo "$dolar"
echo "$gasolina"
echo "$prata"
echo "$ouro"
echo "$petroleo"
echo "BTC: $ $formatted_bitcoin"
echo "SOL: $ $formatted_solana" 
echo "DOT: $ $formatted_polkadot"
