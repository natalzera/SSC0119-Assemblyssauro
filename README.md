# SSC0119-Assemblyssauro
Este é o repositório do trabalho final da matéria de Prática em Organização de Computadores. 
Construindo um processador em VHDL que rode o jogo do dinossauro do Google programado em Assembly.

## Criadores
Gabriel Natal Coutinho. n° USP 12543461

Victor Cologni Seles. n° USP 11795398

## Processador
Conforme foi proposta inicialmente, a arquitetura do processador elaborada segue o seguinte princípio conforme mostra a imagem:

![arquitetura do processador do ICMC](https://github.com/natalzera/SSC0119-Assemblyssauro/blob/main/imgs/arq.png)

Dado isso, em "cpu.vhd" foram implementadas as funcionalidades já propostas em "manual_processador_ICMC.pdf" e a nossa nova funcionalidade criada: a **movst**.

## Nova funcionalidade
A **MOVE STORE**, como o próprio nome já diz, é capaz de mover o valor de um registrador RY para outro RX e, ao mesmo tempo, guardar esse valor na memóra (endereçada pelo antigo valor de RX). Sua sintaxe no assembly e sua interpretação binária é dada da seguinte forma:
```
movst rx, ry        110111|rx|ry|xxxx
```

A seguir, um exemplo de código em assembly utilizando da nova funcionalidade
```asm
End: var #1     ; endereço de memória para 1 palavra (16 bits)

loadn r0, #End  ; carrega r0 com o endereço de memória
loadn r1, #21   ; carrega r1 com o valor inteiro 21
movst r0, r1    ; tanto o endereço de memória "End" quanto r0 irão armazenar o valor de r1 (21)
```

### No Montador
Para essa funcionalidade funcionar, primeiramente ela é adicionada no montador para possibilitar a geração de seu código em binário:

No "defs.h"
```C
// código da instrução interpretado pelo montador
#define MOV_STORE_CODE 98
// ...

// como a instrução será chamada no assembly
#define MOV_STORE_STR "MOVST"
// ...

// opcode da instrução
#define MOVSTORE "110111"
// ...
```

No "montador.c"
```C
/* em void DetectarLabels(void) */
// para aceitar 2 argumentos no assembly e 1 linha de memória na cpu
case MOV_STORE_CODE :
    parser_SkipUntil(',');
    parser_SkipUntilEnd();
    end_cnt++;
    break;
// ...

/* em void MontarInstrucoes(void) */
// para montar o binário da instrução dado seus parâmetros
case MOV_STORE_CODE:
    str_tmp1 = parser_GetItem_s();
    val1 = BuscaRegistrador(str_tmp1);
    free(str_tmp1);
    parser_Match(',');
    str_tmp2 = parser_GetItem_s();
    val2 = BuscaRegistrador(str_tmp2);
    free(str_tmp2);
    str_tmp1 = ConverteRegistrador(val1);
    str_tmp2 = ConverteRegistrador(val2);
    sprintf(str_msg,"%s%s%s0000",MOVSTORE,str_tmp1,str_tmp2);
    free(str_tmp1);
    free(str_tmp2);
    parser_Write_Inst(str_msg,end_cnt);
    end_cnt += 1;
    break;
// ...

/* em int BuscaInstrucao(char *nome) */
// para quando ler no asm o comando da instrução, retornar seu código para o montador montá-la
else if (strcmp(str_tmp,MOV_STORE_STR) == 0) {
    return MOV_STORE_CODE;
}
// ...
```

### Na cpu.vhd
Visto isso, com o montador possibilitando a geração do código binário da nova instrução com seus diferentes parâmetros, modificamos o processador para receber esse código binário, interpretá-lo e executar a instrução:

```vhd
-- opcode da instrução
CONSTANT MOVSTORE: STD_LOGIC_VECTOR(5 downto 0) := "110111";
-- ...

-- no estado de decodificação da máquina de controle
IF(IR(15 DOWNTO 10) = MOVSTORE) THEN
        M4 := Reg(Rx);	-- pega o endereço da memória guardado no RX
        M1 <= M4;
        Rw <= '1';
        M3 := Reg(Ry);	-- manda para M5 escrever na memória o valor de RY
        M5 <= M3;

        state := exec;
END IF;
-- ...

-- no estado de execução da máquina de controle
IF(IR(15 DOWNTO 10) = MOVSTORE) THEN
        M4 := Reg(Ry);  -- Manda o valor de RY para RX
        selM2 := sM4;
        loadReg(Rx) := '1';
        state := fetch;
END IF;
-- ...
```

Por fim, é importante notar que o caminho de dados exigido por esta nova instrução não exigiu nenhuma outra modificação na arquitetura do processador.

### No testa_cpu.asm
Para a testagem da instrução implementada tanto no processador quanto no montador, foi adicionado no código assembly de testagem essa nova instrução, imprimindo a letra Q caso tenha funcionado.

```asm
; Teste do MOVST (nova instrução)
loadn r0, #32
loadn r1, #'Q'
loadn r2, #Ender
movst r2, r1	
outchar r2, r0		; Printa Q na linha 32

load r2, Ender
loadn r0, #34
outchar r2, r0		; Printa Q na linha 34
; ...
```
Dessa forma, nota-se que a letra Q é mostrada na tela quando ocorre o MOV de RY para RX e depois quando ocorre o STORE de RY para o endereço guardado em RX, mostrando 2 vezes o Q se a instrução funciona completamente.

Conforme essas condições, foi montado e executado no processador esse código de teste para todas as instruções implementadas e o resultado foi:

![testa cpu rodando no processador](https://github.com/natalzera/SSC0119-Assemblyssauro/blob/main/imgs/cpu_func.jpg)

Portanto, nota-se que o processador elaborado pelo grupo funciona para todas as funcionalidades exigidas e a nova implementada!

## Jogo
Com o processador pronto, foi elaborado um jogo na linguagem assembly que funcione nele. Ele consiste em se assemelhar ao do dinossauro do google (que fica disponível quando a conexão é interrompida).

Ao iniciar o jogo, é mostrada uma tela inicial que espera o usuário digitar a tecla de espaço para começa-lo.

![menu de início do jogo](https://github.com/natalzera/SSC0119-Assemblyssauro/blob/main/imgs/menu_inicio.png)

Após isso, o jogo funciona desenhando o dinossauro e o cenário com suas respectivas informações (score máximo no canto superior esquerdo e score atual no canto superior direito).

![tela principal do jogo](https://github.com/natalzera/SSC0119-Assemblyssauro/blob/main/imgs/jogando.png)

Além disso, vão se aproximando do dinossauro alguns obstáculos que deverão ser pulados (ou não) apertando a tecla de espaço. Esses obstáculos são gerados pseudo-aleatoriamente de acordo com uma lista pré definida de números no código em assembly do jogo, e os possíveis obstáculos serão:

![obstáculo cacto do jogo](https://github.com/natalzera/SSC0119-Assemblyssauro/blob/main/imgs/cacto.png)
![obstáculo pterodáctilo no chão do jogo](https://github.com/natalzera/SSC0119-Assemblyssauro/blob/main/imgs/ptero_chao.png)
![obstáculo pterodáctilo no alto do jogo](https://github.com/natalzera/SSC0119-Assemblyssauro/blob/main/imgs/ptero_alto.png)

Contudo, se o dinossauro acabar colidindo com algum obstáculo no jogo, o jogador será direcionado para a tela de fim, que atualiza e mostra o melhor score já feito pelo jogador desde o início do jogo, e poderá escolher entre jogar novamente (apertando a tecla de espaço) ou sair (apertando a tecla esc).

![menu de fim do jogo](https://github.com/natalzera/SSC0119-Assemblyssauro/blob/main/imgs/menu_fim.png)

Visto isso, temos uma pequena demostração do jogo funcionando no simulador com essas características descritas:

![asmssauro funcionando no simulador](https://github.com/natalzera/SSC0119-Assemblyssauro/blob/main/imgs/DinoGameDEMO.gif)
