#!/bin/bash
#
#===============================================================================
#
# File...........: ShellDocTemplate.sh
# Title..........: System Test ShellScript
# Program........: Shell Template Code -  GNU/Linux
#
# Description....: Cotação atual do Dólar
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

# URL da API que retorna o JSON com a cotação do dólar
url="https://economia.awesomeapi.com.br/json/last/USD-BRL"

# Baixa o conteúdo da API e extrai a cotação do dólar usando jq
dolar=$(curl -s "$url" | jq -r '.USDBRL.ask')

# Exibir a cotação formatada
if [ -n "$dolar" ]; then
    # Converter para formato numérico com duas casas decimais
    dolar_formatado=$(LC_NUMERIC="en_US.UTF-8" printf "%.2f" "$dolar")
    
    # Substituir ponto por vírgula para o formato R$ 5,44
    dolar_formatado=$(echo "$dolar_formatado" | sed 's/\./,/')
    
    # Exibir o resultado formatado
    echo "Dólar: R$ $dolar_formatado"
else
    echo "ERRO"
fi
