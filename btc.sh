#!/bin/bash
#
#===============================================================================
#
# File...........: btc.sh
# Title..........: System Test ShellScript
# Program........: Shell Template Code -  GNU/Linux
#
# Description....: Cotação atual do Bitcoin
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

# URL da API que retorna o JSON com a cotação do Bitcoin
url="https://api.coindesk.com/v1/bpi/currentprice/BRL.json"

# Baixa o conteúdo da API e extrai a cotação do Bitcoin usando jq
bitcoin=$(curl -s "$url" | jq -r '.bpi.BRL.rate_float')

# Exibir a cotação formatada
if [ -n "$bitcoin" ]; then
    # Converter para formato numérico com duas casas decimais
    bitcoin_formatado=$(LC_NUMERIC="en_US.UTF-8" printf "%.2f" "$bitcoin")

    # Substituir ponto por vírgula para o formato R$ 5,44
    bitcoin_formatado=$(echo "$bitcoin_formatado" | sed 's/\./,/')

    # Exibir o resultado formatado
    echo "Bitcoin: R$ $bitcoin_formatado"
else
    echo "Não foi possível obter a cotação do Bitcoin."
fi
