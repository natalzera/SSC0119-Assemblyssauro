# SSC0119-Assemblyssauro
Este é o repositório do trabalho final da matéria de Prática em Organização de Computadores. 
Construindo um processador em VHDL que rode o jogo do dinossauro do Google programado em Assembly.

## Criadores
Gabriel Natal Coutinho. n° USP 12543461
Victor Cologni Seles. n° USP 11795398

## Processador
Conforme foi proposta inicialmente, a arquitetura do processador elaborada segue o seguinte princípio conforme mostra a imagem:

(imagem do processador do simões)

Dado isso, em "cpu.vhd" foram implementadas as funcionalidades já propostas em "manual_processador_ICMC.pdf" e a nossa nova funcionalidade criada: a **movst**.

## Nova funcionalidade
A **MOVE STORE** como o próprio nome já diz, é capaz de mover o valor de um registrador RY para outro RX e, ao mesmo tempo, guardar esse valor na memóra (endereçada pelo antigo valor de RX).

A seguir, um exemplo de código em assembly utilizando da nova funcionalidade
```asm
End : var #1    ; endereço de memória para 1 palavra

loadn r0, #End  ; carrega r0 com o endereço de memória
loadn r1, #21   ; carrega r1 com o valor inteiro 21
movst r0, r1    ; tanto o endereço de memória "End" quanto r0 irão armazenar o valor de r1 (21)
```
