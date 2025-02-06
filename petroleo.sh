#!/bin/bash
#
#===============================================================================
#
# File...........: ShellDocTemplate.sh
# Title..........: System Test ShellScript
# Program........: Shell Template Code -  GNU/Linux
#
# Description....: Cotação atual do Barril de Petroleo tipo Brent
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

# URL da página que contém a cotação do petróleo Brent
url="https://br.investing.com/commodities/brent-oil"

# Baixa o conteúdo da página e extrai a cotação do petróleo
petroleo=$(curl -s "$url" | grep -oP '(?<=data-test="instrument-price-last">)[\d,]+' | head -1)

# Exibir a cotação formatada
if [ -n "$petroleo" ]; then
    # Exibir o resultado formatado
    echo "Petroleo Barril/Brent: $ $petroleo"
else
    echo "Não foi possível obter a cotação do petróleo."
fi
