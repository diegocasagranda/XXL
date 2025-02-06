#!/bin/bash
#
#===============================================================================
#
# File...........: ShellDocTemplate.sh
# Title..........: System Test ShellScript
# Program........: Shell Template Code -  GNU/Linux
#
# Description....: Cotação atual da Onça de ouro
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

# URL da página com a cotação do ouro
url="https://dolarhoje.com/ouro-hoje/"

# Baixar o conteúdo da página
page_content=$(curl -s "$url")

# Extrair o valor do atributo value usando grep e sed
valor_ouro=$(echo "$page_content" | grep -oP '<input type="text" id="nacional" value="\K[^"]+')

# Exibir o valor na tela e verificar se foi encontrado
if [ -n "$valor_ouro" ]; then
    # Formatar o valor substituindo a vírgula por ponto
    valor_ouro_formatado=$(echo "$valor_ouro" | sed 's/,/./')

    # Calculando o valor de uma onça troy de ouro (considerando que a cotação obtida é por grama)
    peso_onca_troy=3.11035
    valor_moeda=$(echo "scale=2; $valor_ouro_formatado * $peso_onca_troy" | bc -l)

    # Calculando a margem de lucro de 15%
    #lucro=0.15
    #valor_com_lucro=$(echo "scale=2; $valor_moeda * (1 + $lucro)" | bc -l)

    # Formatando o valor para duas casas decimais usando awk
    ouro_formatado=$(echo "$valor_moeda" | awk '{printf "%\047.2f", $0}' | sed 's/,/./g')

    # Exibindo o valor de uma onça troy de ouro em reais
    echo "Onça de Ouro: R$ $ouro_formatado"
else
    echo "ERRO"
fi
