; ---------------------------------------------
;                - DINO GAME -
; ---------------------------------------------
; by Victor Cologni Seles      Nº USP: 11795398
; and Gabriel Natal Coutinho   Nº USP: 12543461

jmp main

; NOTA: O trecho de código abaixo, referente à parte gráfica do jogo, foi 
; obtido do gerador de imagens em código Assembly, disponibilizado na página: 
; https://github.com/GustavoSelhorstMarconi/Create-Screens-in-Assembly-with
; -python. Um agradecimento a seus autores: Gustavo de Oliveira Martins e 
; Gustavo Selhorst Marconi.

; ---------------------------------------------
; (CHARACTER)                        DINO IMAGE
; ---------------------------------------------

DinoPosition : var #1

Dino : var #7
  static Dino + #0, #0 ;    Eye
  static Dino + #1, #1 ;     Mouth
  ;37  espacos para o proximo caractere
  static Dino + #2, #2 ;     Tail
  static Dino + #3, #3 ;     Back
  static Dino + #4, #23 ;     Arm
  ;39  espacos para o proximo caractere
  static Dino + #5, #5 ;    LeftFoot
  static Dino + #6, #6 ;    RightFoot

DinoGaps : var #7
  static DinoGaps + #0, #0
  static DinoGaps + #1, #0
  static DinoGaps + #2, #36
  static DinoGaps + #3, #0
  static DinoGaps + #4, #0
  static DinoGaps + #5, #38
  static DinoGaps + #6, #0

printDino:
  push R0
  push R1
  push R2
  push R3
  push R4
  push R5
  push R6

  loadn R0, #Dino
  loadn R1, #DinoGaps
  load R2, DinoPosition
  loadn R3, #7 ;tamanho Dino
  loadn R4, #0 ;incremetador

  printDinoLoop:
    add R5,R0,R4
    loadi R5, R5

    add R6,R1,R4
    loadi R6, R6

    add R2, R2, R6

    outchar R5, R2

    inc R2
     inc R4
     cmp R3, R4
    jne printDinoLoop

  pop R6
  pop R5
  pop R4
  pop R3
  pop R2
  pop R1
  pop R0
  rts

apagarDino:
  push R0
  push R1
  push R2
  push R3
  push R4
  push R5

  loadn R0, #3967
  loadn R1, #DinoGaps
  load R2, DinoPosition
  loadn R3, #7 ;tamanho Dino
  loadn R4, #0 ;incremetador

  apagarDinoLoop:
    add R5,R1,R4
    loadi R5, R5

    add R2,R2,R5
    outchar R0, R2

    inc R2
     inc R4
     cmp R3, R4
    jne apagarDinoLoop

  pop R5
  pop R4
  pop R3
  pop R2
  pop R1
  pop R0
  rts

; ---------------------------------------------
; (OBSTACLE)                       CACTUS IMAGE
; ---------------------------------------------

CactusPosition : var #1

Cactus : var #8
  static Cactus + #0, #9 ;   TrunkTip
  ;39  espacos para o proximo caractere
  static Cactus + #1, #11 ;    LeftTrunk
  static Cactus + #2, #7 ;   Trunk
  static Cactus + #3, #13 ;    RightTrunk
  ;38  espacos para o proximo caractere
  static Cactus + #4, #10 ;    LeftBranch
  static Cactus + #5, #8 ;   Brancher
  static Cactus + #6, #12 ;    RightBranch
  ;39  espacos para o proximo caractere
  static Cactus + #7, #7 ;   Trunk

CactusGaps : var #8
  static CactusGaps + #0, #0
  static CactusGaps + #1, #38
  static CactusGaps + #2, #0
  static CactusGaps + #3, #0
  static CactusGaps + #4, #37
  static CactusGaps + #5, #0
  static CactusGaps + #6, #0
  static CactusGaps + #7, #38

printCactus:
  push R0
  push R1
  push R2
  push R3
  push R4
  push R5
  push R6

  loadn R0, #Cactus
  loadn R1, #CactusGaps
  load R2, CactusPosition
  loadn R3, #8 ;tamanho Cactus
  loadn R4, #0 ;incremetador

  printCactusLoop:
    add R5,R0,R4
    loadi R5, R5

    add R6,R1,R4
    loadi R6, R6

    add R2, R2, R6

    outchar R5, R2

    inc R2
     inc R4
     cmp R3, R4
    jne printCactusLoop

  pop R6
  pop R5
  pop R4
  pop R3
  pop R2
  pop R1
  pop R0
  rts

apagarCactus:
  push R0
  push R1
  push R2
  push R3
  push R4
  push R5

  loadn R0, #3967
  loadn R1, #CactusGaps
  load R2, CactusPosition
  loadn R3, #8 ;tamanho Cactus
  loadn R4, #0 ;incremetador

  apagarCactusLoop:
    add R5,R1,R4
    loadi R5, R5

    add R2,R2,R5
    outchar R0, R2

    inc R2
     inc R4
     cmp R3, R4
    jne apagarCactusLoop

  pop R5
  pop R4
  pop R3
  pop R2
  pop R1
  pop R0
  rts

; ---------------------------------------------
; (OBSTACLE)                  PTERODACTYL IMAGE
; ---------------------------------------------

PterodactylPosition : var #1

Pterodactyl : var #6
  static Pterodactyl + #0, #18 ;  WingTip
  ;39  espacos para o proximo caractere
  static Pterodactyl + #1, #15 ;  Head
  static Pterodactyl + #2, #16 ;  Wing
  static Pterodactyl + #3, #17 ;  WingRest
  ;39  espacos para o proximo caractere
  static Pterodactyl + #4, #19 ;  Body
  static Pterodactyl + #5, #20 ;  BodyRest

PterodactylGaps : var #6
  static PterodactylGaps + #0, #0
  static PterodactylGaps + #1, #38
  static PterodactylGaps + #2, #0
  static PterodactylGaps + #3, #0
  static PterodactylGaps + #4, #38
  static PterodactylGaps + #5, #0

printPterodactyl:
  push R0
  push R1
  push R2
  push R3
  push R4
  push R5
  push R6

  loadn R0, #Pterodactyl
  loadn R1, #PterodactylGaps
  load R2, PterodactylPosition
  loadn R3, #6 ;tamanho Pterodactyl
  loadn R4, #0 ;incremetador

  printPterodactylLoop:
    add R5,R0,R4
    loadi R5, R5

    add R6,R1,R4
    loadi R6, R6

    add R2, R2, R6

    outchar R5, R2

    inc R2
     inc R4
     cmp R3, R4
    jne printPterodactylLoop

  pop R6
  pop R5
  pop R4
  pop R3
  pop R2
  pop R1
  pop R0
  rts

apagarPterodactyl:
  push R0
  push R1
  push R2
  push R3
  push R4
  push R5

  loadn R0, #3967
  loadn R1, #PterodactylGaps
  load R2, PterodactylPosition
  loadn R3, #6 ;tamanho Pterodactyl
  loadn R4, #0 ;incremetador

  apagarPterodactylLoop:
    add R5,R1,R4
    loadi R5, R5

    add R2,R2,R5
    outchar R0, R2

    inc R2
     inc R4
     cmp R3, R4
    jne apagarPterodactylLoop

  pop R5
  pop R4
  pop R3
  pop R2
  pop R1
  pop R0
  rts

; ---------------------------------------------
; (SCREEN)                     START MENU IMAGE
; ---------------------------------------------

StartMenu : var #1200
  ;Linha 0
  static StartMenu + #0, #127
  static StartMenu + #1, #127
  static StartMenu + #2, #127
  static StartMenu + #3, #127
  static StartMenu + #4, #127
  static StartMenu + #5, #127
  static StartMenu + #6, #127
  static StartMenu + #7, #127
  static StartMenu + #8, #127
  static StartMenu + #9, #127
  static StartMenu + #10, #127
  static StartMenu + #11, #127
  static StartMenu + #12, #127
  static StartMenu + #13, #127
  static StartMenu + #14, #127
  static StartMenu + #15, #127
  static StartMenu + #16, #127
  static StartMenu + #17, #127
  static StartMenu + #18, #127
  static StartMenu + #19, #127
  static StartMenu + #20, #127
  static StartMenu + #21, #127
  static StartMenu + #22, #127
  static StartMenu + #23, #127
  static StartMenu + #24, #127
  static StartMenu + #25, #127
  static StartMenu + #26, #127
  static StartMenu + #27, #127
  static StartMenu + #28, #127
  static StartMenu + #29, #127
  static StartMenu + #30, #127
  static StartMenu + #31, #127
  static StartMenu + #32, #127
  static StartMenu + #33, #127
  static StartMenu + #34, #127
  static StartMenu + #35, #127
  static StartMenu + #36, #127
  static StartMenu + #37, #127
  static StartMenu + #38, #127
  static StartMenu + #39, #127

  ;Linha 1
  static StartMenu + #40, #127
  static StartMenu + #41, #127
  static StartMenu + #42, #127
  static StartMenu + #43, #127
  static StartMenu + #44, #127
  static StartMenu + #45, #127
  static StartMenu + #46, #127
  static StartMenu + #47, #127
  static StartMenu + #48, #127
  static StartMenu + #49, #127
  static StartMenu + #50, #127
  static StartMenu + #51, #127
  static StartMenu + #52, #127
  static StartMenu + #53, #127
  static StartMenu + #54, #127
  static StartMenu + #55, #127
  static StartMenu + #56, #127
  static StartMenu + #57, #127
  static StartMenu + #58, #127
  static StartMenu + #59, #127
  static StartMenu + #60, #127
  static StartMenu + #61, #127
  static StartMenu + #62, #127
  static StartMenu + #63, #127
  static StartMenu + #64, #127
  static StartMenu + #65, #127
  static StartMenu + #66, #127
  static StartMenu + #67, #127
  static StartMenu + #68, #127
  static StartMenu + #69, #127
  static StartMenu + #70, #127
  static StartMenu + #71, #127
  static StartMenu + #72, #127
  static StartMenu + #73, #127
  static StartMenu + #74, #127
  static StartMenu + #75, #127
  static StartMenu + #76, #127
  static StartMenu + #77, #127
  static StartMenu + #78, #127
  static StartMenu + #79, #127

  ;Linha 2
  static StartMenu + #80, #127
  static StartMenu + #81, #127
  static StartMenu + #82, #127
  static StartMenu + #83, #127
  static StartMenu + #84, #127
  static StartMenu + #85, #127
  static StartMenu + #86, #127
  static StartMenu + #87, #127
  static StartMenu + #88, #127
  static StartMenu + #89, #127
  static StartMenu + #90, #127
  static StartMenu + #91, #127
  static StartMenu + #92, #127
  static StartMenu + #93, #127
  static StartMenu + #94, #127
  static StartMenu + #95, #127
  static StartMenu + #96, #127
  static StartMenu + #97, #127
  static StartMenu + #98, #127
  static StartMenu + #99, #127
  static StartMenu + #100, #127
  static StartMenu + #101, #127
  static StartMenu + #102, #127
  static StartMenu + #103, #127
  static StartMenu + #104, #127
  static StartMenu + #105, #127
  static StartMenu + #106, #127
  static StartMenu + #107, #127
  static StartMenu + #108, #127
  static StartMenu + #109, #127
  static StartMenu + #110, #127
  static StartMenu + #111, #127
  static StartMenu + #112, #127
  static StartMenu + #113, #127
  static StartMenu + #114, #127
  static StartMenu + #115, #127
  static StartMenu + #116, #127
  static StartMenu + #117, #127
  static StartMenu + #118, #127
  static StartMenu + #119, #127

  ;Linha 3
  static StartMenu + #120, #127
  static StartMenu + #121, #127
  static StartMenu + #122, #127
  static StartMenu + #123, #127
  static StartMenu + #124, #127
  static StartMenu + #125, #127
  static StartMenu + #126, #127
  static StartMenu + #127, #127
  static StartMenu + #128, #127
  static StartMenu + #129, #127
  static StartMenu + #130, #127
  static StartMenu + #131, #127
  static StartMenu + #132, #127
  static StartMenu + #133, #127
  static StartMenu + #134, #127
  static StartMenu + #135, #127
  static StartMenu + #136, #127
  static StartMenu + #137, #127
  static StartMenu + #138, #127
  static StartMenu + #139, #127
  static StartMenu + #140, #127
  static StartMenu + #141, #127
  static StartMenu + #142, #127
  static StartMenu + #143, #127
  static StartMenu + #144, #127
  static StartMenu + #145, #127
  static StartMenu + #146, #127
  static StartMenu + #147, #127
  static StartMenu + #148, #127
  static StartMenu + #149, #127
  static StartMenu + #150, #127
  static StartMenu + #151, #127
  static StartMenu + #152, #127
  static StartMenu + #153, #127
  static StartMenu + #154, #127
  static StartMenu + #155, #127
  static StartMenu + #156, #127
  static StartMenu + #157, #127
  static StartMenu + #158, #127
  static StartMenu + #159, #127

  ;Linha 4
  static StartMenu + #160, #127
  static StartMenu + #161, #127
  static StartMenu + #162, #127
  static StartMenu + #163, #127
  static StartMenu + #164, #127
  static StartMenu + #165, #127
  static StartMenu + #166, #127
  static StartMenu + #167, #127
  static StartMenu + #168, #127
  static StartMenu + #169, #127
  static StartMenu + #170, #127
  static StartMenu + #171, #127
  static StartMenu + #172, #127
  static StartMenu + #173, #127
  static StartMenu + #174, #127
  static StartMenu + #175, #127
  static StartMenu + #176, #127
  static StartMenu + #177, #127
  static StartMenu + #178, #127
  static StartMenu + #179, #127
  static StartMenu + #180, #127
  static StartMenu + #181, #127
  static StartMenu + #182, #127
  static StartMenu + #183, #127
  static StartMenu + #184, #127
  static StartMenu + #185, #127
  static StartMenu + #186, #127
  static StartMenu + #187, #127
  static StartMenu + #188, #127
  static StartMenu + #189, #127
  static StartMenu + #190, #127
  static StartMenu + #191, #127
  static StartMenu + #192, #127
  static StartMenu + #193, #127
  static StartMenu + #194, #127
  static StartMenu + #195, #127
  static StartMenu + #196, #127
  static StartMenu + #197, #127
  static StartMenu + #198, #127
  static StartMenu + #199, #127

  ;Linha 5
  static StartMenu + #200, #127
  static StartMenu + #201, #127
  static StartMenu + #202, #127
  static StartMenu + #203, #127
  static StartMenu + #204, #127
  static StartMenu + #205, #127
  static StartMenu + #206, #127
  static StartMenu + #207, #127
  static StartMenu + #208, #127
  static StartMenu + #209, #22
  static StartMenu + #210, #22
  static StartMenu + #211, #22
  static StartMenu + #212, #22
  static StartMenu + #213, #22
  static StartMenu + #214, #22
  static StartMenu + #215, #22
  static StartMenu + #216, #22
  static StartMenu + #217, #22
  static StartMenu + #218, #22
  static StartMenu + #219, #22
  static StartMenu + #220, #22
  static StartMenu + #221, #22
  static StartMenu + #222, #22
  static StartMenu + #223, #22
  static StartMenu + #224, #22
  static StartMenu + #225, #22
  static StartMenu + #226, #22
  static StartMenu + #227, #22
  static StartMenu + #228, #22
  static StartMenu + #229, #22
  static StartMenu + #230, #22
  static StartMenu + #231, #127
  static StartMenu + #232, #127
  static StartMenu + #233, #127
  static StartMenu + #234, #127
  static StartMenu + #235, #127
  static StartMenu + #236, #127
  static StartMenu + #237, #127
  static StartMenu + #238, #127
  static StartMenu + #239, #127

  ;Linha 6
  static StartMenu + #240, #127
  static StartMenu + #241, #127
  static StartMenu + #242, #127
  static StartMenu + #243, #127
  static StartMenu + #244, #127
  static StartMenu + #245, #127
  static StartMenu + #246, #127
  static StartMenu + #247, #127
  static StartMenu + #248, #127
  static StartMenu + #249, #22
  static StartMenu + #250, #3967
  static StartMenu + #251, #3967
  static StartMenu + #252, #3967
  static StartMenu + #253, #22
  static StartMenu + #254, #22
  static StartMenu + #255, #22
  static StartMenu + #256, #3967
  static StartMenu + #257, #22
  static StartMenu + #258, #22
  static StartMenu + #259, #3967
  static StartMenu + #260, #22
  static StartMenu + #261, #22
  static StartMenu + #262, #22
  static StartMenu + #263, #3967
  static StartMenu + #264, #22
  static StartMenu + #265, #22
  static StartMenu + #266, #22
  static StartMenu + #267, #3967
  static StartMenu + #268, #3967
  static StartMenu + #269, #22
  static StartMenu + #270, #22
  static StartMenu + #271, #127
  static StartMenu + #272, #127
  static StartMenu + #273, #127
  static StartMenu + #274, #127
  static StartMenu + #275, #127
  static StartMenu + #276, #127
  static StartMenu + #277, #127
  static StartMenu + #278, #127
  static StartMenu + #279, #127

  ;Linha 7
  static StartMenu + #280, #127
  static StartMenu + #281, #127
  static StartMenu + #282, #127
  static StartMenu + #283, #127
  static StartMenu + #284, #127
  static StartMenu + #285, #127
  static StartMenu + #286, #127
  static StartMenu + #287, #127
  static StartMenu + #288, #127
  static StartMenu + #289, #22
  static StartMenu + #290, #3967
  static StartMenu + #291, #22
  static StartMenu + #292, #22
  static StartMenu + #293, #3967
  static StartMenu + #294, #22
  static StartMenu + #295, #22
  static StartMenu + #296, #3967
  static StartMenu + #297, #22
  static StartMenu + #298, #22
  static StartMenu + #299, #3967
  static StartMenu + #300, #3967
  static StartMenu + #301, #22
  static StartMenu + #302, #22
  static StartMenu + #303, #3967
  static StartMenu + #304, #22
  static StartMenu + #305, #22
  static StartMenu + #306, #3967
  static StartMenu + #307, #22
  static StartMenu + #308, #22
  static StartMenu + #309, #3967
  static StartMenu + #310, #22
  static StartMenu + #311, #127
  static StartMenu + #312, #127
  static StartMenu + #313, #127
  static StartMenu + #314, #127
  static StartMenu + #315, #127
  static StartMenu + #316, #127
  static StartMenu + #317, #127
  static StartMenu + #318, #127
  static StartMenu + #319, #127

  ;Linha 8
  static StartMenu + #320, #127
  static StartMenu + #321, #127
  static StartMenu + #322, #127
  static StartMenu + #323, #127
  static StartMenu + #324, #127
  static StartMenu + #325, #127
  static StartMenu + #326, #127
  static StartMenu + #327, #127
  static StartMenu + #328, #127
  static StartMenu + #329, #22
  static StartMenu + #330, #3967
  static StartMenu + #331, #22
  static StartMenu + #332, #22
  static StartMenu + #333, #3967
  static StartMenu + #334, #22
  static StartMenu + #335, #22
  static StartMenu + #336, #3967
  static StartMenu + #337, #22
  static StartMenu + #338, #22
  static StartMenu + #339, #3967
  static StartMenu + #340, #22
  static StartMenu + #341, #3967
  static StartMenu + #342, #22
  static StartMenu + #343, #3967
  static StartMenu + #344, #22
  static StartMenu + #345, #22
  static StartMenu + #346, #3967
  static StartMenu + #347, #22
  static StartMenu + #348, #22
  static StartMenu + #349, #3967
  static StartMenu + #350, #22
  static StartMenu + #351, #127
  static StartMenu + #352, #127
  static StartMenu + #353, #127
  static StartMenu + #354, #127
  static StartMenu + #355, #127
  static StartMenu + #356, #127
  static StartMenu + #357, #127
  static StartMenu + #358, #127
  static StartMenu + #359, #127

  ;Linha 9
  static StartMenu + #360, #127
  static StartMenu + #361, #127
  static StartMenu + #362, #127
  static StartMenu + #363, #127
  static StartMenu + #364, #127
  static StartMenu + #365, #127
  static StartMenu + #366, #127
  static StartMenu + #367, #127
  static StartMenu + #368, #127
  static StartMenu + #369, #22
  static StartMenu + #370, #3967
  static StartMenu + #371, #22
  static StartMenu + #372, #22
  static StartMenu + #373, #3967
  static StartMenu + #374, #22
  static StartMenu + #375, #22
  static StartMenu + #376, #3967
  static StartMenu + #377, #22
  static StartMenu + #378, #22
  static StartMenu + #379, #3967
  static StartMenu + #380, #22
  static StartMenu + #381, #22
  static StartMenu + #382, #3967
  static StartMenu + #383, #3967
  static StartMenu + #384, #22
  static StartMenu + #385, #22
  static StartMenu + #386, #3967
  static StartMenu + #387, #22
  static StartMenu + #388, #22
  static StartMenu + #389, #3967
  static StartMenu + #390, #22
  static StartMenu + #391, #127
  static StartMenu + #392, #127
  static StartMenu + #393, #127
  static StartMenu + #394, #127
  static StartMenu + #395, #127
  static StartMenu + #396, #127
  static StartMenu + #397, #127
  static StartMenu + #398, #127
  static StartMenu + #399, #127

  ;Linha 10
  static StartMenu + #400, #127
  static StartMenu + #401, #127
  static StartMenu + #402, #127
  static StartMenu + #403, #127
  static StartMenu + #404, #127
  static StartMenu + #405, #127
  static StartMenu + #406, #127
  static StartMenu + #407, #127
  static StartMenu + #408, #127
  static StartMenu + #409, #22
  static StartMenu + #410, #3967
  static StartMenu + #411, #3967
  static StartMenu + #412, #3967
  static StartMenu + #413, #22
  static StartMenu + #414, #22
  static StartMenu + #415, #22
  static StartMenu + #416, #3967
  static StartMenu + #417, #22
  static StartMenu + #418, #22
  static StartMenu + #419, #3967
  static StartMenu + #420, #22
  static StartMenu + #421, #22
  static StartMenu + #422, #22
  static StartMenu + #423, #3967
  static StartMenu + #424, #22
  static StartMenu + #425, #22
  static StartMenu + #426, #22
  static StartMenu + #427, #3967
  static StartMenu + #428, #3967
  static StartMenu + #429, #22
  static StartMenu + #430, #22
  static StartMenu + #431, #127
  static StartMenu + #432, #127
  static StartMenu + #433, #127
  static StartMenu + #434, #127
  static StartMenu + #435, #127
  static StartMenu + #436, #127
  static StartMenu + #437, #127
  static StartMenu + #438, #127
  static StartMenu + #439, #127

  ;Linha 11
  static StartMenu + #440, #127
  static StartMenu + #441, #127
  static StartMenu + #442, #127
  static StartMenu + #443, #127
  static StartMenu + #444, #127
  static StartMenu + #445, #127
  static StartMenu + #446, #127
  static StartMenu + #447, #127
  static StartMenu + #448, #127
  static StartMenu + #449, #22
  static StartMenu + #450, #22
  static StartMenu + #451, #22
  static StartMenu + #452, #22
  static StartMenu + #453, #22
  static StartMenu + #454, #22
  static StartMenu + #455, #22
  static StartMenu + #456, #22
  static StartMenu + #457, #22
  static StartMenu + #458, #22
  static StartMenu + #459, #22
  static StartMenu + #460, #22
  static StartMenu + #461, #22
  static StartMenu + #462, #22
  static StartMenu + #463, #22
  static StartMenu + #464, #22
  static StartMenu + #465, #22
  static StartMenu + #466, #22
  static StartMenu + #467, #22
  static StartMenu + #468, #22
  static StartMenu + #469, #22
  static StartMenu + #470, #22
  static StartMenu + #471, #127
  static StartMenu + #472, #127
  static StartMenu + #473, #127
  static StartMenu + #474, #127
  static StartMenu + #475, #127
  static StartMenu + #476, #127
  static StartMenu + #477, #127
  static StartMenu + #478, #127
  static StartMenu + #479, #127

  ;Linha 12
  static StartMenu + #480, #127
  static StartMenu + #481, #127
  static StartMenu + #482, #127
  static StartMenu + #483, #127
  static StartMenu + #484, #127
  static StartMenu + #485, #127
  static StartMenu + #486, #127
  static StartMenu + #487, #127
  static StartMenu + #488, #127
  static StartMenu + #489, #127
  static StartMenu + #490, #127
  static StartMenu + #491, #127
  static StartMenu + #492, #127
  static StartMenu + #493, #127
  static StartMenu + #494, #127
  static StartMenu + #495, #127
  static StartMenu + #496, #127
  static StartMenu + #497, #127
  static StartMenu + #498, #127
  static StartMenu + #499, #3967
  static StartMenu + #500, #127
  static StartMenu + #501, #127
  static StartMenu + #502, #127
  static StartMenu + #503, #127
  static StartMenu + #504, #127
  static StartMenu + #505, #127
  static StartMenu + #506, #127
  static StartMenu + #507, #127
  static StartMenu + #508, #127
  static StartMenu + #509, #127
  static StartMenu + #510, #127
  static StartMenu + #511, #127
  static StartMenu + #512, #127
  static StartMenu + #513, #127
  static StartMenu + #514, #127
  static StartMenu + #515, #127
  static StartMenu + #516, #127
  static StartMenu + #517, #127
  static StartMenu + #518, #127
  static StartMenu + #519, #127

  ;Linha 13
  static StartMenu + #520, #127
  static StartMenu + #521, #127
  static StartMenu + #522, #127
  static StartMenu + #523, #127
  static StartMenu + #524, #127
  static StartMenu + #525, #127
  static StartMenu + #526, #127
  static StartMenu + #527, #127
  static StartMenu + #528, #127
  static StartMenu + #529, #127
  static StartMenu + #530, #3967
  static StartMenu + #531, #3967
  static StartMenu + #532, #3967
  static StartMenu + #533, #3967
  static StartMenu + #534, #3967
  static StartMenu + #535, #127
  static StartMenu + #536, #3967
  static StartMenu + #537, #3967
  static StartMenu + #538, #3967
  static StartMenu + #539, #3967
  static StartMenu + #540, #127
  static StartMenu + #541, #127
  static StartMenu + #542, #127
  static StartMenu + #543, #127
  static StartMenu + #544, #127
  static StartMenu + #545, #127
  static StartMenu + #546, #127
  static StartMenu + #547, #127
  static StartMenu + #548, #127
  static StartMenu + #549, #127
  static StartMenu + #550, #127
  static StartMenu + #551, #127
  static StartMenu + #552, #127
  static StartMenu + #553, #127
  static StartMenu + #554, #127
  static StartMenu + #555, #127
  static StartMenu + #556, #127
  static StartMenu + #557, #127
  static StartMenu + #558, #127
  static StartMenu + #559, #127

  ;Linha 14
  static StartMenu + #560, #127
  static StartMenu + #561, #127
  static StartMenu + #562, #127
  static StartMenu + #563, #127
  static StartMenu + #564, #127
  static StartMenu + #565, #127
  static StartMenu + #566, #127
  static StartMenu + #567, #127
  static StartMenu + #568, #127
  static StartMenu + #569, #3967
  static StartMenu + #570, #3967
  static StartMenu + #571, #3967
  static StartMenu + #572, #3967
  static StartMenu + #573, #3967
  static StartMenu + #574, #45
  static StartMenu + #575, #3967
  static StartMenu + #576, #84
  static StartMenu + #577, #72
  static StartMenu + #578, #69
  static StartMenu + #579, #3967
  static StartMenu + #580, #71
  static StartMenu + #581, #65
  static StartMenu + #582, #77
  static StartMenu + #583, #69
  static StartMenu + #584, #3967
  static StartMenu + #585, #45
  static StartMenu + #586, #127
  static StartMenu + #587, #3967
  static StartMenu + #588, #3967
  static StartMenu + #589, #3967
  static StartMenu + #590, #127
  static StartMenu + #591, #127
  static StartMenu + #592, #127
  static StartMenu + #593, #127
  static StartMenu + #594, #127
  static StartMenu + #595, #127
  static StartMenu + #596, #127
  static StartMenu + #597, #127
  static StartMenu + #598, #127
  static StartMenu + #599, #127

  ;Linha 15
  static StartMenu + #600, #127
  static StartMenu + #601, #127
  static StartMenu + #602, #127
  static StartMenu + #603, #127
  static StartMenu + #604, #127
  static StartMenu + #605, #127
  static StartMenu + #606, #127
  static StartMenu + #607, #127
  static StartMenu + #608, #127
  static StartMenu + #609, #127
  static StartMenu + #610, #3967
  static StartMenu + #611, #3967
  static StartMenu + #612, #3967
  static StartMenu + #613, #3967
  static StartMenu + #614, #3967
  static StartMenu + #615, #3967
  static StartMenu + #616, #3967
  static StartMenu + #617, #3967
  static StartMenu + #618, #3967
  static StartMenu + #619, #3967
  static StartMenu + #620, #127
  static StartMenu + #621, #3967
  static StartMenu + #622, #3967
  static StartMenu + #623, #3967
  static StartMenu + #624, #3967
  static StartMenu + #625, #127
  static StartMenu + #626, #127
  static StartMenu + #627, #3967
  static StartMenu + #628, #127
  static StartMenu + #629, #3967
  static StartMenu + #630, #127
  static StartMenu + #631, #127
  static StartMenu + #632, #127
  static StartMenu + #633, #127
  static StartMenu + #634, #127
  static StartMenu + #635, #127
  static StartMenu + #636, #127
  static StartMenu + #637, #127
  static StartMenu + #638, #127
  static StartMenu + #639, #127

  ;Linha 16
  static StartMenu + #640, #127
  static StartMenu + #641, #127
  static StartMenu + #642, #127
  static StartMenu + #643, #127
  static StartMenu + #644, #127
  static StartMenu + #645, #127
  static StartMenu + #646, #127
  static StartMenu + #647, #127
  static StartMenu + #648, #127
  static StartMenu + #649, #127
  static StartMenu + #650, #3967
  static StartMenu + #651, #3967
  static StartMenu + #652, #3967
  static StartMenu + #653, #3967
  static StartMenu + #654, #3967
  static StartMenu + #655, #3967
  static StartMenu + #656, #3967
  static StartMenu + #657, #3967
  static StartMenu + #658, #3967
  static StartMenu + #659, #3967
  static StartMenu + #660, #3967
  static StartMenu + #661, #3967
  static StartMenu + #662, #3967
  static StartMenu + #663, #3967
  static StartMenu + #664, #127
  static StartMenu + #665, #127
  static StartMenu + #666, #127
  static StartMenu + #667, #3967
  static StartMenu + #668, #3967
  static StartMenu + #669, #3967
  static StartMenu + #670, #3967
  static StartMenu + #671, #3967
  static StartMenu + #672, #127
  static StartMenu + #673, #127
  static StartMenu + #674, #127
  static StartMenu + #675, #127
  static StartMenu + #676, #127
  static StartMenu + #677, #127
  static StartMenu + #678, #127
  static StartMenu + #679, #127

  ;Linha 17
  static StartMenu + #680, #127
  static StartMenu + #681, #127
  static StartMenu + #682, #127
  static StartMenu + #683, #127
  static StartMenu + #684, #127
  static StartMenu + #685, #127
  static StartMenu + #686, #127
  static StartMenu + #687, #127
  static StartMenu + #688, #127
  static StartMenu + #689, #127
  static StartMenu + #690, #127
  static StartMenu + #691, #127
  static StartMenu + #692, #127
  static StartMenu + #693, #3967
  static StartMenu + #694, #3967
  static StartMenu + #695, #3967
  static StartMenu + #696, #3967
  static StartMenu + #697, #3967
  static StartMenu + #698, #3967
  static StartMenu + #699, #3967
  static StartMenu + #700, #3967
  static StartMenu + #701, #3967
  static StartMenu + #702, #3967
  static StartMenu + #703, #3967
  static StartMenu + #704, #3967
  static StartMenu + #705, #3967
  static StartMenu + #706, #3967
  static StartMenu + #707, #3967
  static StartMenu + #708, #3967
  static StartMenu + #709, #3967
  static StartMenu + #710, #3967
  static StartMenu + #711, #3967
  static StartMenu + #712, #3967
  static StartMenu + #713, #3967
  static StartMenu + #714, #3967
  static StartMenu + #715, #3967
  static StartMenu + #716, #127
  static StartMenu + #717, #127
  static StartMenu + #718, #127
  static StartMenu + #719, #127

  ;Linha 18
  static StartMenu + #720, #127
  static StartMenu + #721, #127
  static StartMenu + #722, #127
  static StartMenu + #723, #127
  static StartMenu + #724, #127
  static StartMenu + #725, #127
  static StartMenu + #726, #127
  static StartMenu + #727, #127
  static StartMenu + #728, #127
  static StartMenu + #729, #80
  static StartMenu + #730, #114
  static StartMenu + #731, #101
  static StartMenu + #732, #115
  static StartMenu + #733, #115
  static StartMenu + #734, #127
  static StartMenu + #735, #91
  static StartMenu + #736, #83
  static StartMenu + #737, #80
  static StartMenu + #738, #65
  static StartMenu + #739, #67
  static StartMenu + #740, #69
  static StartMenu + #741, #93
  static StartMenu + #742, #127
  static StartMenu + #743, #116
  static StartMenu + #744, #111
  static StartMenu + #745, #127
  static StartMenu + #746, #115
  static StartMenu + #747, #116
  static StartMenu + #748, #97
  static StartMenu + #749, #114
  static StartMenu + #750, #116
  static StartMenu + #751, #3967
  static StartMenu + #752, #3967
  static StartMenu + #753, #3967
  static StartMenu + #754, #3967
  static StartMenu + #755, #127
  static StartMenu + #756, #127
  static StartMenu + #757, #127
  static StartMenu + #758, #127
  static StartMenu + #759, #127

  ;Linha 19
  static StartMenu + #760, #127
  static StartMenu + #761, #127
  static StartMenu + #762, #127
  static StartMenu + #763, #127
  static StartMenu + #764, #127
  static StartMenu + #765, #127
  static StartMenu + #766, #127
  static StartMenu + #767, #127
  static StartMenu + #768, #127
  static StartMenu + #769, #127
  static StartMenu + #770, #127
  static StartMenu + #771, #127
  static StartMenu + #772, #127
  static StartMenu + #773, #127
  static StartMenu + #774, #127
  static StartMenu + #775, #127
  static StartMenu + #776, #127
  static StartMenu + #777, #127
  static StartMenu + #778, #127
  static StartMenu + #779, #127
  static StartMenu + #780, #127
  static StartMenu + #781, #127
  static StartMenu + #782, #127
  static StartMenu + #783, #127
  static StartMenu + #784, #127
  static StartMenu + #785, #127
  static StartMenu + #786, #127
  static StartMenu + #787, #3967
  static StartMenu + #788, #3967
  static StartMenu + #789, #3967
  static StartMenu + #790, #127
  static StartMenu + #791, #127
  static StartMenu + #792, #127
  static StartMenu + #793, #127
  static StartMenu + #794, #127
  static StartMenu + #795, #127
  static StartMenu + #796, #127
  static StartMenu + #797, #127
  static StartMenu + #798, #127
  static StartMenu + #799, #127

  ;Linha 20
  static StartMenu + #800, #127
  static StartMenu + #801, #127
  static StartMenu + #802, #127
  static StartMenu + #803, #127
  static StartMenu + #804, #127
  static StartMenu + #805, #127
  static StartMenu + #806, #127
  static StartMenu + #807, #127
  static StartMenu + #808, #127
  static StartMenu + #809, #127
  static StartMenu + #810, #127
  static StartMenu + #811, #127
  static StartMenu + #812, #127
  static StartMenu + #813, #127
  static StartMenu + #814, #127
  static StartMenu + #815, #127
  static StartMenu + #816, #127
  static StartMenu + #817, #127
  static StartMenu + #818, #127
  static StartMenu + #819, #127
  static StartMenu + #820, #127
  static StartMenu + #821, #127
  static StartMenu + #822, #127
  static StartMenu + #823, #127
  static StartMenu + #824, #127
  static StartMenu + #825, #127
  static StartMenu + #826, #127
  static StartMenu + #827, #127
  static StartMenu + #828, #127
  static StartMenu + #829, #127
  static StartMenu + #830, #127
  static StartMenu + #831, #127
  static StartMenu + #832, #127
  static StartMenu + #833, #127
  static StartMenu + #834, #127
  static StartMenu + #835, #127
  static StartMenu + #836, #127
  static StartMenu + #837, #127
  static StartMenu + #838, #127
  static StartMenu + #839, #127

  ;Linha 21
  static StartMenu + #840, #127
  static StartMenu + #841, #127
  static StartMenu + #842, #127
  static StartMenu + #843, #127
  static StartMenu + #844, #127
  static StartMenu + #845, #127
  static StartMenu + #846, #127
  static StartMenu + #847, #127
  static StartMenu + #848, #127
  static StartMenu + #849, #127
  static StartMenu + #850, #127
  static StartMenu + #851, #127
  static StartMenu + #852, #127
  static StartMenu + #853, #127
  static StartMenu + #854, #127
  static StartMenu + #855, #127
  static StartMenu + #856, #127
  static StartMenu + #857, #127
  static StartMenu + #858, #127
  static StartMenu + #859, #127
  static StartMenu + #860, #127
  static StartMenu + #861, #127
  static StartMenu + #862, #127
  static StartMenu + #863, #127
  static StartMenu + #864, #127
  static StartMenu + #865, #127
  static StartMenu + #866, #127
  static StartMenu + #867, #127
  static StartMenu + #868, #127
  static StartMenu + #869, #127
  static StartMenu + #870, #127
  static StartMenu + #871, #127
  static StartMenu + #872, #127
  static StartMenu + #873, #127
  static StartMenu + #874, #127
  static StartMenu + #875, #127
  static StartMenu + #876, #127
  static StartMenu + #877, #127
  static StartMenu + #878, #127
  static StartMenu + #879, #127

  ;Linha 22
  static StartMenu + #880, #127
  static StartMenu + #881, #127
  static StartMenu + #882, #127
  static StartMenu + #883, #127
  static StartMenu + #884, #127
  static StartMenu + #885, #127
  static StartMenu + #886, #127
  static StartMenu + #887, #127
  static StartMenu + #888, #127
  static StartMenu + #889, #127
  static StartMenu + #890, #127
  static StartMenu + #891, #127
  static StartMenu + #892, #127
  static StartMenu + #893, #127
  static StartMenu + #894, #127
  static StartMenu + #895, #127
  static StartMenu + #896, #127
  static StartMenu + #897, #127
  static StartMenu + #898, #127
  static StartMenu + #899, #127
  static StartMenu + #900, #127
  static StartMenu + #901, #127
  static StartMenu + #902, #127
  static StartMenu + #903, #127
  static StartMenu + #904, #127
  static StartMenu + #905, #127
  static StartMenu + #906, #127
  static StartMenu + #907, #127
  static StartMenu + #908, #127
  static StartMenu + #909, #127
  static StartMenu + #910, #127
  static StartMenu + #911, #127
  static StartMenu + #912, #127
  static StartMenu + #913, #127
  static StartMenu + #914, #127
  static StartMenu + #915, #127
  static StartMenu + #916, #127
  static StartMenu + #917, #127
  static StartMenu + #918, #127
  static StartMenu + #919, #127

  ;Linha 23
  static StartMenu + #920, #127
  static StartMenu + #921, #127
  static StartMenu + #922, #127
  static StartMenu + #923, #127
  static StartMenu + #924, #127
  static StartMenu + #925, #127
  static StartMenu + #926, #127
  static StartMenu + #927, #127
  static StartMenu + #928, #127
  static StartMenu + #929, #127
  static StartMenu + #930, #127
  static StartMenu + #931, #127
  static StartMenu + #932, #127
  static StartMenu + #933, #127
  static StartMenu + #934, #127
  static StartMenu + #935, #127
  static StartMenu + #936, #127
  static StartMenu + #937, #127
  static StartMenu + #938, #127
  static StartMenu + #939, #127
  static StartMenu + #940, #127
  static StartMenu + #941, #127
  static StartMenu + #942, #127
  static StartMenu + #943, #127
  static StartMenu + #944, #127
  static StartMenu + #945, #127
  static StartMenu + #946, #127
  static StartMenu + #947, #127
  static StartMenu + #948, #127
  static StartMenu + #949, #127
  static StartMenu + #950, #127
  static StartMenu + #951, #127
  static StartMenu + #952, #127
  static StartMenu + #953, #127
  static StartMenu + #954, #127
  static StartMenu + #955, #127
  static StartMenu + #956, #127
  static StartMenu + #957, #127
  static StartMenu + #958, #127
  static StartMenu + #959, #127

  ;Linha 24
  static StartMenu + #960, #127
  static StartMenu + #961, #127
  static StartMenu + #962, #127
  static StartMenu + #963, #127
  static StartMenu + #964, #127
  static StartMenu + #965, #127
  static StartMenu + #966, #127
  static StartMenu + #967, #127
  static StartMenu + #968, #127
  static StartMenu + #969, #127
  static StartMenu + #970, #127
  static StartMenu + #971, #127
  static StartMenu + #972, #127
  static StartMenu + #973, #127
  static StartMenu + #974, #127
  static StartMenu + #975, #127
  static StartMenu + #976, #127
  static StartMenu + #977, #127
  static StartMenu + #978, #127
  static StartMenu + #979, #127
  static StartMenu + #980, #127
  static StartMenu + #981, #127
  static StartMenu + #982, #127
  static StartMenu + #983, #127
  static StartMenu + #984, #127
  static StartMenu + #985, #127
  static StartMenu + #986, #127
  static StartMenu + #987, #127
  static StartMenu + #988, #127
  static StartMenu + #989, #127
  static StartMenu + #990, #127
  static StartMenu + #991, #127
  static StartMenu + #992, #127
  static StartMenu + #993, #127
  static StartMenu + #994, #127
  static StartMenu + #995, #127
  static StartMenu + #996, #127
  static StartMenu + #997, #127
  static StartMenu + #998, #127
  static StartMenu + #999, #127

  ;Linha 25
  static StartMenu + #1000, #127
  static StartMenu + #1001, #127
  static StartMenu + #1002, #127
  static StartMenu + #1003, #127
  static StartMenu + #1004, #127
  static StartMenu + #1005, #127
  static StartMenu + #1006, #127
  static StartMenu + #1007, #127
  static StartMenu + #1008, #127
  static StartMenu + #1009, #127
  static StartMenu + #1010, #127
  static StartMenu + #1011, #127
  static StartMenu + #1012, #127
  static StartMenu + #1013, #127
  static StartMenu + #1014, #127
  static StartMenu + #1015, #127
  static StartMenu + #1016, #127
  static StartMenu + #1017, #127
  static StartMenu + #1018, #127
  static StartMenu + #1019, #127
  static StartMenu + #1020, #127
  static StartMenu + #1021, #127
  static StartMenu + #1022, #127
  static StartMenu + #1023, #127
  static StartMenu + #1024, #127
  static StartMenu + #1025, #127
  static StartMenu + #1026, #127
  static StartMenu + #1027, #127
  static StartMenu + #1028, #127
  static StartMenu + #1029, #127
  static StartMenu + #1030, #127
  static StartMenu + #1031, #127
  static StartMenu + #1032, #127
  static StartMenu + #1033, #127
  static StartMenu + #1034, #127
  static StartMenu + #1035, #127
  static StartMenu + #1036, #127
  static StartMenu + #1037, #127
  static StartMenu + #1038, #127
  static StartMenu + #1039, #127

  ;Linha 26
  static StartMenu + #1040, #127
  static StartMenu + #1041, #127
  static StartMenu + #1042, #127
  static StartMenu + #1043, #127
  static StartMenu + #1044, #127
  static StartMenu + #1045, #127
  static StartMenu + #1046, #127
  static StartMenu + #1047, #127
  static StartMenu + #1048, #127
  static StartMenu + #1049, #127
  static StartMenu + #1050, #127
  static StartMenu + #1051, #127
  static StartMenu + #1052, #127
  static StartMenu + #1053, #127
  static StartMenu + #1054, #127
  static StartMenu + #1055, #127
  static StartMenu + #1056, #127
  static StartMenu + #1057, #127
  static StartMenu + #1058, #127
  static StartMenu + #1059, #127
  static StartMenu + #1060, #127
  static StartMenu + #1061, #127
  static StartMenu + #1062, #127
  static StartMenu + #1063, #127
  static StartMenu + #1064, #127
  static StartMenu + #1065, #127
  static StartMenu + #1066, #127
  static StartMenu + #1067, #127
  static StartMenu + #1068, #127
  static StartMenu + #1069, #127
  static StartMenu + #1070, #127
  static StartMenu + #1071, #127
  static StartMenu + #1072, #127
  static StartMenu + #1073, #127
  static StartMenu + #1074, #127
  static StartMenu + #1075, #127
  static StartMenu + #1076, #127
  static StartMenu + #1077, #127
  static StartMenu + #1078, #127
  static StartMenu + #1079, #127

  ;Linha 27
  static StartMenu + #1080, #127
  static StartMenu + #1081, #127
  static StartMenu + #1082, #127
  static StartMenu + #1083, #127
  static StartMenu + #1084, #127
  static StartMenu + #1085, #127
  static StartMenu + #1086, #127
  static StartMenu + #1087, #127
  static StartMenu + #1088, #127
  static StartMenu + #1089, #127
  static StartMenu + #1090, #127
  static StartMenu + #1091, #127
  static StartMenu + #1092, #127
  static StartMenu + #1093, #127
  static StartMenu + #1094, #127
  static StartMenu + #1095, #127
  static StartMenu + #1096, #127
  static StartMenu + #1097, #127
  static StartMenu + #1098, #127
  static StartMenu + #1099, #127
  static StartMenu + #1100, #127
  static StartMenu + #1101, #127
  static StartMenu + #1102, #127
  static StartMenu + #1103, #127
  static StartMenu + #1104, #127
  static StartMenu + #1105, #127
  static StartMenu + #1106, #127
  static StartMenu + #1107, #127
  static StartMenu + #1108, #127
  static StartMenu + #1109, #127
  static StartMenu + #1110, #127
  static StartMenu + #1111, #127
  static StartMenu + #1112, #127
  static StartMenu + #1113, #127
  static StartMenu + #1114, #127
  static StartMenu + #1115, #127
  static StartMenu + #1116, #127
  static StartMenu + #1117, #127
  static StartMenu + #1118, #127
  static StartMenu + #1119, #127

  ;Linha 28
  static StartMenu + #1120, #127
  static StartMenu + #1121, #127
  static StartMenu + #1122, #127
  static StartMenu + #1123, #127
  static StartMenu + #1124, #127
  static StartMenu + #1125, #127
  static StartMenu + #1126, #127
  static StartMenu + #1127, #127
  static StartMenu + #1128, #127
  static StartMenu + #1129, #127
  static StartMenu + #1130, #127
  static StartMenu + #1131, #127
  static StartMenu + #1132, #127
  static StartMenu + #1133, #127
  static StartMenu + #1134, #127
  static StartMenu + #1135, #127
  static StartMenu + #1136, #127
  static StartMenu + #1137, #127
  static StartMenu + #1138, #127
  static StartMenu + #1139, #127
  static StartMenu + #1140, #127
  static StartMenu + #1141, #127
  static StartMenu + #1142, #127
  static StartMenu + #1143, #127
  static StartMenu + #1144, #127
  static StartMenu + #1145, #127
  static StartMenu + #1146, #127
  static StartMenu + #1147, #127
  static StartMenu + #1148, #127
  static StartMenu + #1149, #127
  static StartMenu + #1150, #127
  static StartMenu + #1151, #127
  static StartMenu + #1152, #127
  static StartMenu + #1153, #127
  static StartMenu + #1154, #127
  static StartMenu + #1155, #127
  static StartMenu + #1156, #127
  static StartMenu + #1157, #127
  static StartMenu + #1158, #127
  static StartMenu + #1159, #127

  ;Linha 29
  static StartMenu + #1160, #127
  static StartMenu + #1161, #127
  static StartMenu + #1162, #127
  static StartMenu + #1163, #127
  static StartMenu + #1164, #127
  static StartMenu + #1165, #127
  static StartMenu + #1166, #127
  static StartMenu + #1167, #127
  static StartMenu + #1168, #127
  static StartMenu + #1169, #127
  static StartMenu + #1170, #127
  static StartMenu + #1171, #127
  static StartMenu + #1172, #127
  static StartMenu + #1173, #127
  static StartMenu + #1174, #127
  static StartMenu + #1175, #127
  static StartMenu + #1176, #127
  static StartMenu + #1177, #127
  static StartMenu + #1178, #127
  static StartMenu + #1179, #127
  static StartMenu + #1180, #127
  static StartMenu + #1181, #127
  static StartMenu + #1182, #127
  static StartMenu + #1183, #127
  static StartMenu + #1184, #127
  static StartMenu + #1185, #127
  static StartMenu + #1186, #127
  static StartMenu + #1187, #127
  static StartMenu + #1188, #127
  static StartMenu + #1189, #127
  static StartMenu + #1190, #127
  static StartMenu + #1191, #127
  static StartMenu + #1192, #127
  static StartMenu + #1193, #127
  static StartMenu + #1194, #127
  static StartMenu + #1195, #127
  static StartMenu + #1196, #127
  static StartMenu + #1197, #127
  static StartMenu + #1198, #127
  static StartMenu + #1199, #127

printStartMenuScreen:
  push R0
  push R1
  push R2
  push R3

  loadn R0, #StartMenu
  loadn R1, #0
  loadn R2, #1200

  printStartMenuScreenLoop:

    add R3,R0,R1
    loadi R3, R3
    outchar R3, R1
    inc R1
    cmp R1, R2

    jne printStartMenuScreenLoop

  pop R3
  pop R2
  pop R1
  pop R0
  rts

; ---------------------------------------------
; (SCREEN)                         GROUND IMAGE
; ---------------------------------------------

Ground : var #1200
  ;Linha 0
  static Ground + #0, #127
  static Ground + #1, #127
  static Ground + #2, #127
  static Ground + #3, #127
  static Ground + #4, #127
  static Ground + #5, #127
  static Ground + #6, #127
  static Ground + #7, #127
  static Ground + #8, #127
  static Ground + #9, #127
  static Ground + #10, #127
  static Ground + #11, #127
  static Ground + #12, #127
  static Ground + #13, #127
  static Ground + #14, #127
  static Ground + #15, #127
  static Ground + #16, #127
  static Ground + #17, #127
  static Ground + #18, #127
  static Ground + #19, #127
  static Ground + #20, #127
  static Ground + #21, #127
  static Ground + #22, #127
  static Ground + #23, #127
  static Ground + #24, #127
  static Ground + #25, #127
  static Ground + #26, #127
  static Ground + #27, #127
  static Ground + #28, #127
  static Ground + #29, #127
  static Ground + #30, #127
  static Ground + #31, #127
  static Ground + #32, #127
  static Ground + #33, #127
  static Ground + #34, #127
  static Ground + #35, #127
  static Ground + #36, #127
  static Ground + #37, #127
  static Ground + #38, #127
  static Ground + #39, #127

  ;Linha 1
  static Ground + #40, #127
  static Ground + #41, #127
  static Ground + #42, #127
  static Ground + #43, #127
  static Ground + #44, #127
  static Ground + #45, #127
  static Ground + #46, #127
  static Ground + #47, #127
  static Ground + #48, #127
  static Ground + #49, #127
  static Ground + #50, #127
  static Ground + #51, #127
  static Ground + #52, #127
  static Ground + #53, #127
  static Ground + #54, #127
  static Ground + #55, #127
  static Ground + #56, #127
  static Ground + #57, #127
  static Ground + #58, #127
  static Ground + #59, #127
  static Ground + #60, #127
  static Ground + #61, #127
  static Ground + #62, #127
  static Ground + #63, #127
  static Ground + #64, #127
  static Ground + #65, #127
  static Ground + #66, #127
  static Ground + #67, #127
  static Ground + #68, #127
  static Ground + #69, #127
  static Ground + #70, #127
  static Ground + #71, #127
  static Ground + #72, #127
  static Ground + #73, #127
  static Ground + #74, #127
  static Ground + #75, #127
  static Ground + #76, #127
  static Ground + #77, #127
  static Ground + #78, #127
  static Ground + #79, #127

  ;Linha 2
  static Ground + #80, #127
  static Ground + #81, #127
  static Ground + #82, #127
  static Ground + #83, #127
  static Ground + #84, #127
  static Ground + #85, #127
  static Ground + #86, #127
  static Ground + #87, #127
  static Ground + #88, #127
  static Ground + #89, #127
  static Ground + #90, #127
  static Ground + #91, #127
  static Ground + #92, #127
  static Ground + #93, #127
  static Ground + #94, #127
  static Ground + #95, #127
  static Ground + #96, #127
  static Ground + #97, #127
  static Ground + #98, #127
  static Ground + #99, #127
  static Ground + #100, #127
  static Ground + #101, #127
  static Ground + #102, #127
  static Ground + #103, #127
  static Ground + #104, #127
  static Ground + #105, #127
  static Ground + #106, #127
  static Ground + #107, #127
  static Ground + #108, #127
  static Ground + #109, #127
  static Ground + #110, #127
  static Ground + #111, #127
  static Ground + #112, #127
  static Ground + #113, #3967
  static Ground + #114, #3967
  static Ground + #115, #3967
  static Ground + #116, #3967
  static Ground + #117, #3967
  static Ground + #118, #3967
  static Ground + #119, #127

  ;Linha 3
  static Ground + #120, #127
  static Ground + #121, #127
  static Ground + #122, #127
  static Ground + #123, #127
  static Ground + #124, #127
  static Ground + #125, #127
  static Ground + #126, #127
  static Ground + #127, #127
  static Ground + #128, #127
  static Ground + #129, #127
  static Ground + #130, #127
  static Ground + #131, #127
  static Ground + #132, #127
  static Ground + #133, #127
  static Ground + #134, #127
  static Ground + #135, #127
  static Ground + #136, #127
  static Ground + #137, #127
  static Ground + #138, #127
  static Ground + #139, #127
  static Ground + #140, #127
  static Ground + #141, #127
  static Ground + #142, #127
  static Ground + #143, #127
  static Ground + #144, #127
  static Ground + #145, #127
  static Ground + #146, #127
  static Ground + #147, #127
  static Ground + #148, #127
  static Ground + #149, #127
  static Ground + #150, #127
  static Ground + #151, #127
  static Ground + #152, #127
  static Ground + #153, #127
  static Ground + #154, #127
  static Ground + #155, #127
  static Ground + #156, #127
  static Ground + #157, #127
  static Ground + #158, #127
  static Ground + #159, #127

  ;Linha 4
  static Ground + #160, #127
  static Ground + #161, #127
  static Ground + #162, #127
  static Ground + #163, #127
  static Ground + #164, #127
  static Ground + #165, #127
  static Ground + #166, #127
  static Ground + #167, #127
  static Ground + #168, #127
  static Ground + #169, #127
  static Ground + #170, #127
  static Ground + #171, #127
  static Ground + #172, #127
  static Ground + #173, #127
  static Ground + #174, #127
  static Ground + #175, #127
  static Ground + #176, #127
  static Ground + #177, #127
  static Ground + #178, #127
  static Ground + #179, #127
  static Ground + #180, #127
  static Ground + #181, #127
  static Ground + #182, #127
  static Ground + #183, #127
  static Ground + #184, #127
  static Ground + #185, #127
  static Ground + #186, #127
  static Ground + #187, #127
  static Ground + #188, #127
  static Ground + #189, #127
  static Ground + #190, #127
  static Ground + #191, #127
  static Ground + #192, #127
  static Ground + #193, #127
  static Ground + #194, #127
  static Ground + #195, #127
  static Ground + #196, #127
  static Ground + #197, #127
  static Ground + #198, #127
  static Ground + #199, #127

  ;Linha 5
  static Ground + #200, #127
  static Ground + #201, #127
  static Ground + #202, #127
  static Ground + #203, #127
  static Ground + #204, #127
  static Ground + #205, #127
  static Ground + #206, #127
  static Ground + #207, #127
  static Ground + #208, #127
  static Ground + #209, #127
  static Ground + #210, #127
  static Ground + #211, #127
  static Ground + #212, #127
  static Ground + #213, #127
  static Ground + #214, #127
  static Ground + #215, #127
  static Ground + #216, #127
  static Ground + #217, #127
  static Ground + #218, #127
  static Ground + #219, #127
  static Ground + #220, #127
  static Ground + #221, #127
  static Ground + #222, #127
  static Ground + #223, #127
  static Ground + #224, #127
  static Ground + #225, #127
  static Ground + #226, #127
  static Ground + #227, #127
  static Ground + #228, #127
  static Ground + #229, #127
  static Ground + #230, #127
  static Ground + #231, #127
  static Ground + #232, #127
  static Ground + #233, #127
  static Ground + #234, #127
  static Ground + #235, #127
  static Ground + #236, #127
  static Ground + #237, #127
  static Ground + #238, #127
  static Ground + #239, #127

  ;Linha 6
  static Ground + #240, #127
  static Ground + #241, #127
  static Ground + #242, #127
  static Ground + #243, #127
  static Ground + #244, #127
  static Ground + #245, #127
  static Ground + #246, #127
  static Ground + #247, #127
  static Ground + #248, #127
  static Ground + #249, #127
  static Ground + #250, #127
  static Ground + #251, #127
  static Ground + #252, #127
  static Ground + #253, #127
  static Ground + #254, #127
  static Ground + #255, #127
  static Ground + #256, #127
  static Ground + #257, #127
  static Ground + #258, #127
  static Ground + #259, #127
  static Ground + #260, #127
  static Ground + #261, #127
  static Ground + #262, #127
  static Ground + #263, #127
  static Ground + #264, #127
  static Ground + #265, #127
  static Ground + #266, #127
  static Ground + #267, #127
  static Ground + #268, #127
  static Ground + #269, #127
  static Ground + #270, #127
  static Ground + #271, #127
  static Ground + #272, #127
  static Ground + #273, #127
  static Ground + #274, #127
  static Ground + #275, #127
  static Ground + #276, #127
  static Ground + #277, #127
  static Ground + #278, #127
  static Ground + #279, #127

  ;Linha 7
  static Ground + #280, #127
  static Ground + #281, #127
  static Ground + #282, #127
  static Ground + #283, #127
  static Ground + #284, #127
  static Ground + #285, #127
  static Ground + #286, #127
  static Ground + #287, #127
  static Ground + #288, #127
  static Ground + #289, #127
  static Ground + #290, #127
  static Ground + #291, #127
  static Ground + #292, #127
  static Ground + #293, #127
  static Ground + #294, #127
  static Ground + #295, #127
  static Ground + #296, #127
  static Ground + #297, #127
  static Ground + #298, #127
  static Ground + #299, #127
  static Ground + #300, #127
  static Ground + #301, #127
  static Ground + #302, #127
  static Ground + #303, #127
  static Ground + #304, #127
  static Ground + #305, #127
  static Ground + #306, #127
  static Ground + #307, #127
  static Ground + #308, #127
  static Ground + #309, #127
  static Ground + #310, #127
  static Ground + #311, #127
  static Ground + #312, #127
  static Ground + #313, #127
  static Ground + #314, #127
  static Ground + #315, #127
  static Ground + #316, #127
  static Ground + #317, #127
  static Ground + #318, #127
  static Ground + #319, #127

  ;Linha 8
  static Ground + #320, #127
  static Ground + #321, #127
  static Ground + #322, #127
  static Ground + #323, #127
  static Ground + #324, #127
  static Ground + #325, #127
  static Ground + #326, #127
  static Ground + #327, #127
  static Ground + #328, #127
  static Ground + #329, #127
  static Ground + #330, #127
  static Ground + #331, #127
  static Ground + #332, #127
  static Ground + #333, #127
  static Ground + #334, #127
  static Ground + #335, #127
  static Ground + #336, #127
  static Ground + #337, #127
  static Ground + #338, #127
  static Ground + #339, #127
  static Ground + #340, #127
  static Ground + #341, #127
  static Ground + #342, #127
  static Ground + #343, #127
  static Ground + #344, #127
  static Ground + #345, #127
  static Ground + #346, #127
  static Ground + #347, #127
  static Ground + #348, #127
  static Ground + #349, #127
  static Ground + #350, #127
  static Ground + #351, #127
  static Ground + #352, #127
  static Ground + #353, #127
  static Ground + #354, #127
  static Ground + #355, #127
  static Ground + #356, #127
  static Ground + #357, #127
  static Ground + #358, #127
  static Ground + #359, #127

  ;Linha 9
  static Ground + #360, #127
  static Ground + #361, #127
  static Ground + #362, #127
  static Ground + #363, #127
  static Ground + #364, #127
  static Ground + #365, #127
  static Ground + #366, #127
  static Ground + #367, #127
  static Ground + #368, #127
  static Ground + #369, #127
  static Ground + #370, #127
  static Ground + #371, #127
  static Ground + #372, #127
  static Ground + #373, #127
  static Ground + #374, #127
  static Ground + #375, #127
  static Ground + #376, #127
  static Ground + #377, #127
  static Ground + #378, #127
  static Ground + #379, #127
  static Ground + #380, #127
  static Ground + #381, #127
  static Ground + #382, #127
  static Ground + #383, #127
  static Ground + #384, #127
  static Ground + #385, #127
  static Ground + #386, #127
  static Ground + #387, #127
  static Ground + #388, #127
  static Ground + #389, #127
  static Ground + #390, #127
  static Ground + #391, #127
  static Ground + #392, #127
  static Ground + #393, #127
  static Ground + #394, #127
  static Ground + #395, #127
  static Ground + #396, #127
  static Ground + #397, #127
  static Ground + #398, #127
  static Ground + #399, #127

  ;Linha 10
  static Ground + #400, #127
  static Ground + #401, #127
  static Ground + #402, #127
  static Ground + #403, #127
  static Ground + #404, #127
  static Ground + #405, #127
  static Ground + #406, #127
  static Ground + #407, #127
  static Ground + #408, #127
  static Ground + #409, #127
  static Ground + #410, #127
  static Ground + #411, #127
  static Ground + #412, #127
  static Ground + #413, #127
  static Ground + #414, #127
  static Ground + #415, #127
  static Ground + #416, #127
  static Ground + #417, #127
  static Ground + #418, #127
  static Ground + #419, #127
  static Ground + #420, #127
  static Ground + #421, #127
  static Ground + #422, #127
  static Ground + #423, #127
  static Ground + #424, #127
  static Ground + #425, #127
  static Ground + #426, #127
  static Ground + #427, #127
  static Ground + #428, #127
  static Ground + #429, #127
  static Ground + #430, #127
  static Ground + #431, #127
  static Ground + #432, #127
  static Ground + #433, #127
  static Ground + #434, #127
  static Ground + #435, #127
  static Ground + #436, #127
  static Ground + #437, #127
  static Ground + #438, #127
  static Ground + #439, #127

  ;Linha 11
  static Ground + #440, #127
  static Ground + #441, #127
  static Ground + #442, #127
  static Ground + #443, #127
  static Ground + #444, #127
  static Ground + #445, #127
  static Ground + #446, #127
  static Ground + #447, #127
  static Ground + #448, #127
  static Ground + #449, #127
  static Ground + #450, #127
  static Ground + #451, #127
  static Ground + #452, #127
  static Ground + #453, #127
  static Ground + #454, #127
  static Ground + #455, #127
  static Ground + #456, #127
  static Ground + #457, #127
  static Ground + #458, #127
  static Ground + #459, #127
  static Ground + #460, #127
  static Ground + #461, #127
  static Ground + #462, #127
  static Ground + #463, #127
  static Ground + #464, #127
  static Ground + #465, #127
  static Ground + #466, #127
  static Ground + #467, #127
  static Ground + #468, #127
  static Ground + #469, #127
  static Ground + #470, #127
  static Ground + #471, #127
  static Ground + #472, #127
  static Ground + #473, #127
  static Ground + #474, #127
  static Ground + #475, #127
  static Ground + #476, #127
  static Ground + #477, #127
  static Ground + #478, #127
  static Ground + #479, #127

  ;Linha 12
  static Ground + #480, #127
  static Ground + #481, #127
  static Ground + #482, #127
  static Ground + #483, #127
  static Ground + #484, #127
  static Ground + #485, #127
  static Ground + #486, #127
  static Ground + #487, #127
  static Ground + #488, #127
  static Ground + #489, #127
  static Ground + #490, #127
  static Ground + #491, #127
  static Ground + #492, #127
  static Ground + #493, #127
  static Ground + #494, #127
  static Ground + #495, #127
  static Ground + #496, #127
  static Ground + #497, #127
  static Ground + #498, #127
  static Ground + #499, #127
  static Ground + #500, #127
  static Ground + #501, #127
  static Ground + #502, #127
  static Ground + #503, #127
  static Ground + #504, #127
  static Ground + #505, #127
  static Ground + #506, #127
  static Ground + #507, #127
  static Ground + #508, #127
  static Ground + #509, #127
  static Ground + #510, #127
  static Ground + #511, #127
  static Ground + #512, #127
  static Ground + #513, #127
  static Ground + #514, #127
  static Ground + #515, #127
  static Ground + #516, #127
  static Ground + #517, #127
  static Ground + #518, #127
  static Ground + #519, #127

  ;Linha 13
  static Ground + #520, #127
  static Ground + #521, #127
  static Ground + #522, #127
  static Ground + #523, #127
  static Ground + #524, #127
  static Ground + #525, #127
  static Ground + #526, #127
  static Ground + #527, #127
  static Ground + #528, #127
  static Ground + #529, #127
  static Ground + #530, #127
  static Ground + #531, #127
  static Ground + #532, #127
  static Ground + #533, #127
  static Ground + #534, #127
  static Ground + #535, #127
  static Ground + #536, #127
  static Ground + #537, #127
  static Ground + #538, #127
  static Ground + #539, #127
  static Ground + #540, #127
  static Ground + #541, #127
  static Ground + #542, #127
  static Ground + #543, #127
  static Ground + #544, #127
  static Ground + #545, #127
  static Ground + #546, #127
  static Ground + #547, #127
  static Ground + #548, #127
  static Ground + #549, #127
  static Ground + #550, #127
  static Ground + #551, #127
  static Ground + #552, #127
  static Ground + #553, #127
  static Ground + #554, #127
  static Ground + #555, #127
  static Ground + #556, #127
  static Ground + #557, #127
  static Ground + #558, #127
  static Ground + #559, #127

  ;Linha 14
  static Ground + #560, #127
  static Ground + #561, #127
  static Ground + #562, #127
  static Ground + #563, #127
  static Ground + #564, #127
  static Ground + #565, #127
  static Ground + #566, #127
  static Ground + #567, #127
  static Ground + #568, #127
  static Ground + #569, #127
  static Ground + #570, #127
  static Ground + #571, #127
  static Ground + #572, #127
  static Ground + #573, #127
  static Ground + #574, #127
  static Ground + #575, #127
  static Ground + #576, #127
  static Ground + #577, #127
  static Ground + #578, #127
  static Ground + #579, #127
  static Ground + #580, #127
  static Ground + #581, #127
  static Ground + #582, #127
  static Ground + #583, #127
  static Ground + #584, #127
  static Ground + #585, #127
  static Ground + #586, #127
  static Ground + #587, #127
  static Ground + #588, #127
  static Ground + #589, #127
  static Ground + #590, #127
  static Ground + #591, #127
  static Ground + #592, #127
  static Ground + #593, #127
  static Ground + #594, #127
  static Ground + #595, #127
  static Ground + #596, #127
  static Ground + #597, #127
  static Ground + #598, #127
  static Ground + #599, #127

  ;Linha 15
  static Ground + #600, #3967
  static Ground + #601, #127
  static Ground + #602, #127
  static Ground + #603, #3967
  static Ground + #604, #3967
  static Ground + #605, #3967
  static Ground + #606, #127
  static Ground + #607, #127
  static Ground + #608, #127
  static Ground + #609, #127
  static Ground + #610, #127
  static Ground + #611, #127
  static Ground + #612, #127
  static Ground + #613, #127
  static Ground + #614, #127
  static Ground + #615, #127
  static Ground + #616, #127
  static Ground + #617, #127
  static Ground + #618, #127
  static Ground + #619, #127
  static Ground + #620, #127
  static Ground + #621, #127
  static Ground + #622, #127
  static Ground + #623, #127
  static Ground + #624, #127
  static Ground + #625, #127
  static Ground + #626, #127
  static Ground + #627, #127
  static Ground + #628, #127
  static Ground + #629, #127
  static Ground + #630, #127
  static Ground + #631, #127
  static Ground + #632, #127
  static Ground + #633, #127
  static Ground + #634, #127
  static Ground + #635, #127
  static Ground + #636, #127
  static Ground + #637, #127
  static Ground + #638, #127
  static Ground + #639, #127

  ;Linha 16
  static Ground + #640, #3967
  static Ground + #641, #127
  static Ground + #642, #3967
  static Ground + #643, #3967
  static Ground + #644, #3967
  static Ground + #645, #3967
  static Ground + #646, #3967
  static Ground + #647, #3967
  static Ground + #648, #127
  static Ground + #649, #127
  static Ground + #650, #127
  static Ground + #651, #127
  static Ground + #652, #3967
  static Ground + #653, #3967
  static Ground + #654, #3967
  static Ground + #655, #127
  static Ground + #656, #3967
  static Ground + #657, #127
  static Ground + #658, #3967
  static Ground + #659, #3967
  static Ground + #660, #3967
  static Ground + #661, #3967
  static Ground + #662, #127
  static Ground + #663, #127
  static Ground + #664, #127
  static Ground + #665, #127
  static Ground + #666, #127
  static Ground + #667, #127
  static Ground + #668, #127
  static Ground + #669, #127
  static Ground + #670, #3967
  static Ground + #671, #3967
  static Ground + #672, #3967
  static Ground + #673, #3967
  static Ground + #674, #127
  static Ground + #675, #127
  static Ground + #676, #127
  static Ground + #677, #127
  static Ground + #678, #127
  static Ground + #679, #127

  ;Linha 17
  static Ground + #680, #3967
  static Ground + #681, #3967
  static Ground + #682, #3967
  static Ground + #683, #3967
  static Ground + #684, #3967
  static Ground + #685, #3967
  static Ground + #686, #3967
  static Ground + #687, #3967
  static Ground + #688, #3967
  static Ground + #689, #3967
  static Ground + #690, #3967
  static Ground + #691, #3967
  static Ground + #692, #3967
  static Ground + #693, #3967
  static Ground + #694, #3967
  static Ground + #695, #3967
  static Ground + #696, #3967
  static Ground + #697, #3967
  static Ground + #698, #3967
  static Ground + #699, #3967
  static Ground + #700, #3967
  static Ground + #701, #3967
  static Ground + #702, #3967
  static Ground + #703, #3967
  static Ground + #704, #3967
  static Ground + #705, #3967
  static Ground + #706, #3967
  static Ground + #707, #3967
  static Ground + #708, #3967
  static Ground + #709, #3967
  static Ground + #710, #3967
  static Ground + #711, #3967
  static Ground + #712, #3967
  static Ground + #713, #3967
  static Ground + #714, #3967
  static Ground + #715, #3967
  static Ground + #716, #3967
  static Ground + #717, #3967
  static Ground + #718, #3967
  static Ground + #719, #3967

  ;Linha 18
  static Ground + #720, #14
  static Ground + #721, #14
  static Ground + #722, #14
  static Ground + #723, #14
  static Ground + #724, #14
  static Ground + #725, #14
  static Ground + #726, #14
  static Ground + #727, #14
  static Ground + #728, #14
  static Ground + #729, #14
  static Ground + #730, #14
  static Ground + #731, #14
  static Ground + #732, #14
  static Ground + #733, #14
  static Ground + #734, #14
  static Ground + #735, #14
  static Ground + #736, #14
  static Ground + #737, #14
  static Ground + #738, #14
  static Ground + #739, #14
  static Ground + #740, #14
  static Ground + #741, #14
  static Ground + #742, #14
  static Ground + #743, #14
  static Ground + #744, #14
  static Ground + #745, #14
  static Ground + #746, #14
  static Ground + #747, #14
  static Ground + #748, #14
  static Ground + #749, #14
  static Ground + #750, #14
  static Ground + #751, #14
  static Ground + #752, #14
  static Ground + #753, #14
  static Ground + #754, #14
  static Ground + #755, #14
  static Ground + #756, #14
  static Ground + #757, #14
  static Ground + #758, #14
  static Ground + #759, #14

  ;Linha 19
  static Ground + #760, #3967
  static Ground + #761, #3967
  static Ground + #762, #3967
  static Ground + #763, #3967
  static Ground + #764, #3967
  static Ground + #765, #3967
  static Ground + #766, #3967
  static Ground + #767, #3967
  static Ground + #768, #3967
  static Ground + #769, #3967
  static Ground + #770, #3967
  static Ground + #771, #3967
  static Ground + #772, #3967
  static Ground + #773, #3967
  static Ground + #774, #3967
  static Ground + #775, #3967
  static Ground + #776, #3967
  static Ground + #777, #3967
  static Ground + #778, #3967
  static Ground + #779, #3967
  static Ground + #780, #3967
  static Ground + #781, #3967
  static Ground + #782, #3967
  static Ground + #783, #3967
  static Ground + #784, #3967
  static Ground + #785, #3967
  static Ground + #786, #3967
  static Ground + #787, #3967
  static Ground + #788, #3967
  static Ground + #789, #3967
  static Ground + #790, #3967
  static Ground + #791, #3967
  static Ground + #792, #3967
  static Ground + #793, #3967
  static Ground + #794, #3967
  static Ground + #795, #3967
  static Ground + #796, #3967
  static Ground + #797, #3967
  static Ground + #798, #3967
  static Ground + #799, #3967

  ;Linha 20
  static Ground + #800, #127
  static Ground + #801, #127
  static Ground + #802, #127
  static Ground + #803, #127
  static Ground + #804, #127
  static Ground + #805, #127
  static Ground + #806, #127
  static Ground + #807, #127
  static Ground + #808, #127
  static Ground + #809, #127
  static Ground + #810, #127
  static Ground + #811, #127
  static Ground + #812, #127
  static Ground + #813, #127
  static Ground + #814, #127
  static Ground + #815, #127
  static Ground + #816, #127
  static Ground + #817, #127
  static Ground + #818, #127
  static Ground + #819, #127
  static Ground + #820, #127
  static Ground + #821, #127
  static Ground + #822, #127
  static Ground + #823, #127
  static Ground + #824, #127
  static Ground + #825, #127
  static Ground + #826, #127
  static Ground + #827, #127
  static Ground + #828, #127
  static Ground + #829, #3967
  static Ground + #830, #3967
  static Ground + #831, #3967
  static Ground + #832, #127
  static Ground + #833, #127
  static Ground + #834, #127
  static Ground + #835, #127
  static Ground + #836, #127
  static Ground + #837, #127
  static Ground + #838, #127
  static Ground + #839, #127

  ;Linha 21
  static Ground + #840, #127
  static Ground + #841, #127
  static Ground + #842, #127
  static Ground + #843, #127
  static Ground + #844, #127
  static Ground + #845, #127
  static Ground + #846, #127
  static Ground + #847, #127
  static Ground + #848, #127
  static Ground + #849, #127
  static Ground + #850, #127
  static Ground + #851, #127
  static Ground + #852, #127
  static Ground + #853, #127
  static Ground + #854, #127
  static Ground + #855, #127
  static Ground + #856, #127
  static Ground + #857, #127
  static Ground + #858, #127
  static Ground + #859, #127
  static Ground + #860, #127
  static Ground + #861, #127
  static Ground + #862, #127
  static Ground + #863, #127
  static Ground + #864, #127
  static Ground + #865, #127
  static Ground + #866, #127
  static Ground + #867, #127
  static Ground + #868, #127
  static Ground + #869, #127
  static Ground + #870, #127
  static Ground + #871, #127
  static Ground + #872, #127
  static Ground + #873, #127
  static Ground + #874, #127
  static Ground + #875, #127
  static Ground + #876, #127
  static Ground + #877, #127
  static Ground + #878, #127
  static Ground + #879, #127

  ;Linha 22
  static Ground + #880, #127
  static Ground + #881, #127
  static Ground + #882, #127
  static Ground + #883, #127
  static Ground + #884, #127
  static Ground + #885, #127
  static Ground + #886, #127
  static Ground + #887, #127
  static Ground + #888, #127
  static Ground + #889, #127
  static Ground + #890, #127
  static Ground + #891, #127
  static Ground + #892, #127
  static Ground + #893, #127
  static Ground + #894, #127
  static Ground + #895, #127
  static Ground + #896, #127
  static Ground + #897, #127
  static Ground + #898, #127
  static Ground + #899, #127
  static Ground + #900, #127
  static Ground + #901, #127
  static Ground + #902, #127
  static Ground + #903, #127
  static Ground + #904, #127
  static Ground + #905, #127
  static Ground + #906, #127
  static Ground + #907, #127
  static Ground + #908, #127
  static Ground + #909, #127
  static Ground + #910, #127
  static Ground + #911, #127
  static Ground + #912, #127
  static Ground + #913, #127
  static Ground + #914, #127
  static Ground + #915, #127
  static Ground + #916, #127
  static Ground + #917, #127
  static Ground + #918, #127
  static Ground + #919, #127

  ;Linha 23
  static Ground + #920, #127
  static Ground + #921, #127
  static Ground + #922, #127
  static Ground + #923, #127
  static Ground + #924, #127
  static Ground + #925, #127
  static Ground + #926, #127
  static Ground + #927, #127
  static Ground + #928, #127
  static Ground + #929, #127
  static Ground + #930, #127
  static Ground + #931, #127
  static Ground + #932, #127
  static Ground + #933, #127
  static Ground + #934, #127
  static Ground + #935, #127
  static Ground + #936, #127
  static Ground + #937, #127
  static Ground + #938, #127
  static Ground + #939, #127
  static Ground + #940, #127
  static Ground + #941, #127
  static Ground + #942, #127
  static Ground + #943, #127
  static Ground + #944, #127
  static Ground + #945, #127
  static Ground + #946, #127
  static Ground + #947, #127
  static Ground + #948, #127
  static Ground + #949, #127
  static Ground + #950, #127
  static Ground + #951, #127
  static Ground + #952, #127
  static Ground + #953, #127
  static Ground + #954, #127
  static Ground + #955, #127
  static Ground + #956, #127
  static Ground + #957, #127
  static Ground + #958, #127
  static Ground + #959, #127

  ;Linha 24
  static Ground + #960, #127
  static Ground + #961, #127
  static Ground + #962, #127
  static Ground + #963, #127
  static Ground + #964, #127
  static Ground + #965, #127
  static Ground + #966, #127
  static Ground + #967, #127
  static Ground + #968, #127
  static Ground + #969, #127
  static Ground + #970, #127
  static Ground + #971, #127
  static Ground + #972, #127
  static Ground + #973, #127
  static Ground + #974, #127
  static Ground + #975, #127
  static Ground + #976, #127
  static Ground + #977, #127
  static Ground + #978, #127
  static Ground + #979, #127
  static Ground + #980, #127
  static Ground + #981, #127
  static Ground + #982, #127
  static Ground + #983, #127
  static Ground + #984, #127
  static Ground + #985, #127
  static Ground + #986, #127
  static Ground + #987, #127
  static Ground + #988, #127
  static Ground + #989, #127
  static Ground + #990, #127
  static Ground + #991, #127
  static Ground + #992, #127
  static Ground + #993, #127
  static Ground + #994, #127
  static Ground + #995, #127
  static Ground + #996, #127
  static Ground + #997, #127
  static Ground + #998, #127
  static Ground + #999, #127

  ;Linha 25
  static Ground + #1000, #127
  static Ground + #1001, #127
  static Ground + #1002, #127
  static Ground + #1003, #127
  static Ground + #1004, #127
  static Ground + #1005, #127
  static Ground + #1006, #127
  static Ground + #1007, #127
  static Ground + #1008, #127
  static Ground + #1009, #127
  static Ground + #1010, #127
  static Ground + #1011, #127
  static Ground + #1012, #127
  static Ground + #1013, #127
  static Ground + #1014, #127
  static Ground + #1015, #127
  static Ground + #1016, #127
  static Ground + #1017, #127
  static Ground + #1018, #127
  static Ground + #1019, #127
  static Ground + #1020, #127
  static Ground + #1021, #127
  static Ground + #1022, #127
  static Ground + #1023, #127
  static Ground + #1024, #127
  static Ground + #1025, #127
  static Ground + #1026, #127
  static Ground + #1027, #127
  static Ground + #1028, #127
  static Ground + #1029, #127
  static Ground + #1030, #127
  static Ground + #1031, #127
  static Ground + #1032, #127
  static Ground + #1033, #127
  static Ground + #1034, #127
  static Ground + #1035, #127
  static Ground + #1036, #127
  static Ground + #1037, #127
  static Ground + #1038, #127
  static Ground + #1039, #127

  ;Linha 26
  static Ground + #1040, #127
  static Ground + #1041, #127
  static Ground + #1042, #127
  static Ground + #1043, #127
  static Ground + #1044, #127
  static Ground + #1045, #127
  static Ground + #1046, #127
  static Ground + #1047, #127
  static Ground + #1048, #127
  static Ground + #1049, #127
  static Ground + #1050, #127
  static Ground + #1051, #127
  static Ground + #1052, #127
  static Ground + #1053, #127
  static Ground + #1054, #127
  static Ground + #1055, #127
  static Ground + #1056, #127
  static Ground + #1057, #127
  static Ground + #1058, #127
  static Ground + #1059, #127
  static Ground + #1060, #127
  static Ground + #1061, #127
  static Ground + #1062, #127
  static Ground + #1063, #127
  static Ground + #1064, #127
  static Ground + #1065, #127
  static Ground + #1066, #127
  static Ground + #1067, #127
  static Ground + #1068, #127
  static Ground + #1069, #127
  static Ground + #1070, #127
  static Ground + #1071, #127
  static Ground + #1072, #127
  static Ground + #1073, #127
  static Ground + #1074, #127
  static Ground + #1075, #127
  static Ground + #1076, #127
  static Ground + #1077, #127
  static Ground + #1078, #127
  static Ground + #1079, #127

  ;Linha 27
  static Ground + #1080, #127
  static Ground + #1081, #127
  static Ground + #1082, #127
  static Ground + #1083, #127
  static Ground + #1084, #127
  static Ground + #1085, #127
  static Ground + #1086, #127
  static Ground + #1087, #127
  static Ground + #1088, #127
  static Ground + #1089, #127
  static Ground + #1090, #127
  static Ground + #1091, #127
  static Ground + #1092, #127
  static Ground + #1093, #127
  static Ground + #1094, #127
  static Ground + #1095, #127
  static Ground + #1096, #127
  static Ground + #1097, #127
  static Ground + #1098, #127
  static Ground + #1099, #127
  static Ground + #1100, #127
  static Ground + #1101, #127
  static Ground + #1102, #127
  static Ground + #1103, #127
  static Ground + #1104, #127
  static Ground + #1105, #127
  static Ground + #1106, #127
  static Ground + #1107, #127
  static Ground + #1108, #127
  static Ground + #1109, #127
  static Ground + #1110, #127
  static Ground + #1111, #127
  static Ground + #1112, #127
  static Ground + #1113, #127
  static Ground + #1114, #127
  static Ground + #1115, #127
  static Ground + #1116, #127
  static Ground + #1117, #127
  static Ground + #1118, #127
  static Ground + #1119, #127

  ;Linha 28
  static Ground + #1120, #127
  static Ground + #1121, #127
  static Ground + #1122, #127
  static Ground + #1123, #127
  static Ground + #1124, #127
  static Ground + #1125, #127
  static Ground + #1126, #127
  static Ground + #1127, #127
  static Ground + #1128, #127
  static Ground + #1129, #127
  static Ground + #1130, #127
  static Ground + #1131, #127
  static Ground + #1132, #127
  static Ground + #1133, #127
  static Ground + #1134, #127
  static Ground + #1135, #127
  static Ground + #1136, #127
  static Ground + #1137, #127
  static Ground + #1138, #127
  static Ground + #1139, #127
  static Ground + #1140, #127
  static Ground + #1141, #127
  static Ground + #1142, #127
  static Ground + #1143, #127
  static Ground + #1144, #127
  static Ground + #1145, #127
  static Ground + #1146, #127
  static Ground + #1147, #127
  static Ground + #1148, #127
  static Ground + #1149, #127
  static Ground + #1150, #127
  static Ground + #1151, #127
  static Ground + #1152, #127
  static Ground + #1153, #127
  static Ground + #1154, #127
  static Ground + #1155, #127
  static Ground + #1156, #127
  static Ground + #1157, #127
  static Ground + #1158, #127
  static Ground + #1159, #127

  ;Linha 29
  static Ground + #1160, #127
  static Ground + #1161, #127
  static Ground + #1162, #127
  static Ground + #1163, #127
  static Ground + #1164, #127
  static Ground + #1165, #127
  static Ground + #1166, #127
  static Ground + #1167, #127
  static Ground + #1168, #127
  static Ground + #1169, #127
  static Ground + #1170, #127
  static Ground + #1171, #127
  static Ground + #1172, #127
  static Ground + #1173, #127
  static Ground + #1174, #127
  static Ground + #1175, #127
  static Ground + #1176, #127
  static Ground + #1177, #127
  static Ground + #1178, #127
  static Ground + #1179, #127
  static Ground + #1180, #127
  static Ground + #1181, #127
  static Ground + #1182, #127
  static Ground + #1183, #127
  static Ground + #1184, #127
  static Ground + #1185, #127
  static Ground + #1186, #127
  static Ground + #1187, #127
  static Ground + #1188, #127
  static Ground + #1189, #127
  static Ground + #1190, #127
  static Ground + #1191, #127
  static Ground + #1192, #127
  static Ground + #1193, #127
  static Ground + #1194, #127
  static Ground + #1195, #127
  static Ground + #1196, #127
  static Ground + #1197, #127
  static Ground + #1198, #127
  static Ground + #1199, #127

printGroundScreen:
  push R0
  push R1
  push R2
  push R3

  loadn R0, #Ground
  loadn R1, #0
  loadn R2, #1200

  printGroundScreenLoop:

    add R3,R0,R1
    loadi R3, R3
    outchar R3, R1
    inc R1
    cmp R1, R2

    jne printGroundScreenLoop

  pop R3
  pop R2
  pop R1
  pop R0
  rts

; ---------------------------------------------
; (SCREEN)                      GAME OVER IMAGE
; ---------------------------------------------

GameOver : var #1200
  ;Linha 0
  static GameOver + #0, #127
  static GameOver + #1, #127
  static GameOver + #2, #127
  static GameOver + #3, #127
  static GameOver + #4, #127
  static GameOver + #5, #127
  static GameOver + #6, #127
  static GameOver + #7, #127
  static GameOver + #8, #127
  static GameOver + #9, #127
  static GameOver + #10, #127
  static GameOver + #11, #127
  static GameOver + #12, #127
  static GameOver + #13, #127
  static GameOver + #14, #127
  static GameOver + #15, #127
  static GameOver + #16, #127
  static GameOver + #17, #127
  static GameOver + #18, #127
  static GameOver + #19, #127
  static GameOver + #20, #127
  static GameOver + #21, #127
  static GameOver + #22, #127
  static GameOver + #23, #127
  static GameOver + #24, #127
  static GameOver + #25, #127
  static GameOver + #26, #127
  static GameOver + #27, #127
  static GameOver + #28, #127
  static GameOver + #29, #127
  static GameOver + #30, #127
  static GameOver + #31, #127
  static GameOver + #32, #127
  static GameOver + #33, #127
  static GameOver + #34, #127
  static GameOver + #35, #127
  static GameOver + #36, #127
  static GameOver + #37, #127
  static GameOver + #38, #127
  static GameOver + #39, #127

  ;Linha 1
  static GameOver + #40, #127
  static GameOver + #41, #127
  static GameOver + #42, #127
  static GameOver + #43, #127
  static GameOver + #44, #127
  static GameOver + #45, #127
  static GameOver + #46, #127
  static GameOver + #47, #127
  static GameOver + #48, #127
  static GameOver + #49, #127
  static GameOver + #50, #127
  static GameOver + #51, #127
  static GameOver + #52, #127
  static GameOver + #53, #127
  static GameOver + #54, #127
  static GameOver + #55, #127
  static GameOver + #56, #127
  static GameOver + #57, #127
  static GameOver + #58, #127
  static GameOver + #59, #127
  static GameOver + #60, #127
  static GameOver + #61, #127
  static GameOver + #62, #127
  static GameOver + #63, #127
  static GameOver + #64, #127
  static GameOver + #65, #127
  static GameOver + #66, #127
  static GameOver + #67, #127
  static GameOver + #68, #127
  static GameOver + #69, #127
  static GameOver + #70, #127
  static GameOver + #71, #127
  static GameOver + #72, #127
  static GameOver + #73, #127
  static GameOver + #74, #3967
  static GameOver + #75, #3967
  static GameOver + #76, #3967
  static GameOver + #77, #3967
  static GameOver + #78, #3967
  static GameOver + #79, #3967

  ;Linha 2
  static GameOver + #80, #127
  static GameOver + #81, #127
  static GameOver + #82, #127
  static GameOver + #83, #127
  static GameOver + #84, #127
  static GameOver + #85, #127
  static GameOver + #86, #127
  static GameOver + #87, #127
  static GameOver + #88, #127
  static GameOver + #89, #127
  static GameOver + #90, #127
  static GameOver + #91, #127
  static GameOver + #92, #127
  static GameOver + #93, #127
  static GameOver + #94, #127
  static GameOver + #95, #127
  static GameOver + #96, #127
  static GameOver + #97, #127
  static GameOver + #98, #127
  static GameOver + #99, #127
  static GameOver + #100, #127
  static GameOver + #101, #127
  static GameOver + #102, #127
  static GameOver + #103, #127
  static GameOver + #104, #127
  static GameOver + #105, #127
  static GameOver + #106, #127
  static GameOver + #107, #127
  static GameOver + #108, #127
  static GameOver + #109, #127
  static GameOver + #110, #127
  static GameOver + #111, #127
  static GameOver + #112, #127
  static GameOver + #113, #3967
  static GameOver + #114, #3967
  static GameOver + #115, #3967
  static GameOver + #116, #3967
  static GameOver + #117, #3967
  static GameOver + #118, #127
  static GameOver + #119, #127

  ;Linha 3
  static GameOver + #120, #127
  static GameOver + #121, #127
  static GameOver + #122, #127
  static GameOver + #123, #127
  static GameOver + #124, #127
  static GameOver + #125, #127
  static GameOver + #126, #127
  static GameOver + #127, #127
  static GameOver + #128, #127
  static GameOver + #129, #127
  static GameOver + #130, #127
  static GameOver + #131, #127
  static GameOver + #132, #127
  static GameOver + #133, #127
  static GameOver + #134, #127
  static GameOver + #135, #127
  static GameOver + #136, #127
  static GameOver + #137, #127
  static GameOver + #138, #127
  static GameOver + #139, #127
  static GameOver + #140, #127
  static GameOver + #141, #127
  static GameOver + #142, #127
  static GameOver + #143, #127
  static GameOver + #144, #127
  static GameOver + #145, #127
  static GameOver + #146, #127
  static GameOver + #147, #127
  static GameOver + #148, #127
  static GameOver + #149, #127
  static GameOver + #150, #127
  static GameOver + #151, #127
  static GameOver + #152, #127
  static GameOver + #153, #127
  static GameOver + #154, #127
  static GameOver + #155, #127
  static GameOver + #156, #127
  static GameOver + #157, #127
  static GameOver + #158, #127
  static GameOver + #159, #127

  ;Linha 4
  static GameOver + #160, #127
  static GameOver + #161, #127
  static GameOver + #162, #127
  static GameOver + #163, #127
  static GameOver + #164, #127
  static GameOver + #165, #127
  static GameOver + #166, #127
  static GameOver + #167, #127
  static GameOver + #168, #127
  static GameOver + #169, #127
  static GameOver + #170, #127
  static GameOver + #171, #127
  static GameOver + #172, #127
  static GameOver + #173, #127
  static GameOver + #174, #127
  static GameOver + #175, #127
  static GameOver + #176, #127
  static GameOver + #177, #127
  static GameOver + #178, #127
  static GameOver + #179, #127
  static GameOver + #180, #127
  static GameOver + #181, #127
  static GameOver + #182, #127
  static GameOver + #183, #127
  static GameOver + #184, #127
  static GameOver + #185, #127
  static GameOver + #186, #127
  static GameOver + #187, #127
  static GameOver + #188, #127
  static GameOver + #189, #127
  static GameOver + #190, #127
  static GameOver + #191, #127
  static GameOver + #192, #127
  static GameOver + #193, #127
  static GameOver + #194, #127
  static GameOver + #195, #127
  static GameOver + #196, #127
  static GameOver + #197, #127
  static GameOver + #198, #127
  static GameOver + #199, #127

  ;Linha 5
  static GameOver + #200, #127
  static GameOver + #201, #127
  static GameOver + #202, #127
  static GameOver + #203, #127
  static GameOver + #204, #127
  static GameOver + #205, #127
  static GameOver + #206, #127
  static GameOver + #207, #127
  static GameOver + #208, #127
  static GameOver + #209, #127
  static GameOver + #210, #127
  static GameOver + #211, #127
  static GameOver + #212, #127
  static GameOver + #213, #127
  static GameOver + #214, #127
  static GameOver + #215, #127
  static GameOver + #216, #127
  static GameOver + #217, #127
  static GameOver + #218, #127
  static GameOver + #219, #127
  static GameOver + #220, #127
  static GameOver + #221, #127
  static GameOver + #222, #127
  static GameOver + #223, #127
  static GameOver + #224, #127
  static GameOver + #225, #127
  static GameOver + #226, #127
  static GameOver + #227, #127
  static GameOver + #228, #127
  static GameOver + #229, #127
  static GameOver + #230, #127
  static GameOver + #231, #127
  static GameOver + #232, #127
  static GameOver + #233, #127
  static GameOver + #234, #127
  static GameOver + #235, #127
  static GameOver + #236, #127
  static GameOver + #237, #127
  static GameOver + #238, #127
  static GameOver + #239, #127

  ;Linha 6
  static GameOver + #240, #127
  static GameOver + #241, #127
  static GameOver + #242, #127
  static GameOver + #243, #127
  static GameOver + #244, #127
  static GameOver + #245, #127
  static GameOver + #246, #127
  static GameOver + #247, #127
  static GameOver + #248, #127
  static GameOver + #249, #127
  static GameOver + #250, #127
  static GameOver + #251, #127
  static GameOver + #252, #127
  static GameOver + #253, #127
  static GameOver + #254, #127
  static GameOver + #255, #127
  static GameOver + #256, #127
  static GameOver + #257, #127
  static GameOver + #258, #127
  static GameOver + #259, #127
  static GameOver + #260, #127
  static GameOver + #261, #127
  static GameOver + #262, #127
  static GameOver + #263, #127
  static GameOver + #264, #127
  static GameOver + #265, #127
  static GameOver + #266, #127
  static GameOver + #267, #127
  static GameOver + #268, #127
  static GameOver + #269, #127
  static GameOver + #270, #127
  static GameOver + #271, #127
  static GameOver + #272, #127
  static GameOver + #273, #127
  static GameOver + #274, #127
  static GameOver + #275, #127
  static GameOver + #276, #127
  static GameOver + #277, #127
  static GameOver + #278, #127
  static GameOver + #279, #127

  ;Linha 7
  static GameOver + #280, #127
  static GameOver + #281, #127
  static GameOver + #282, #127
  static GameOver + #283, #127
  static GameOver + #284, #127
  static GameOver + #285, #127
  static GameOver + #286, #127
  static GameOver + #287, #127
  static GameOver + #288, #127
  static GameOver + #289, #127
  static GameOver + #290, #127
  static GameOver + #291, #127
  static GameOver + #292, #127
  static GameOver + #293, #127
  static GameOver + #294, #127
  static GameOver + #295, #127
  static GameOver + #296, #127
  static GameOver + #297, #127
  static GameOver + #298, #127
  static GameOver + #299, #127
  static GameOver + #300, #127
  static GameOver + #301, #127
  static GameOver + #302, #127
  static GameOver + #303, #127
  static GameOver + #304, #127
  static GameOver + #305, #127
  static GameOver + #306, #127
  static GameOver + #307, #127
  static GameOver + #308, #127
  static GameOver + #309, #127
  static GameOver + #310, #127
  static GameOver + #311, #127
  static GameOver + #312, #127
  static GameOver + #313, #127
  static GameOver + #314, #127
  static GameOver + #315, #127
  static GameOver + #316, #127
  static GameOver + #317, #127
  static GameOver + #318, #127
  static GameOver + #319, #127

  ;Linha 8
  static GameOver + #320, #127
  static GameOver + #321, #127
  static GameOver + #322, #127
  static GameOver + #323, #127
  static GameOver + #324, #127
  static GameOver + #325, #127
  static GameOver + #326, #127
  static GameOver + #327, #127
  static GameOver + #328, #127
  static GameOver + #329, #127
  static GameOver + #330, #127
  static GameOver + #331, #127
  static GameOver + #332, #127
  static GameOver + #333, #127
  static GameOver + #334, #127
  static GameOver + #335, #127
  static GameOver + #336, #127
  static GameOver + #337, #127
  static GameOver + #338, #127
  static GameOver + #339, #127
  static GameOver + #340, #127
  static GameOver + #341, #127
  static GameOver + #342, #127
  static GameOver + #343, #127
  static GameOver + #344, #127
  static GameOver + #345, #127
  static GameOver + #346, #127
  static GameOver + #347, #127
  static GameOver + #348, #127
  static GameOver + #349, #127
  static GameOver + #350, #127
  static GameOver + #351, #127
  static GameOver + #352, #127
  static GameOver + #353, #127
  static GameOver + #354, #127
  static GameOver + #355, #127
  static GameOver + #356, #127
  static GameOver + #357, #127
  static GameOver + #358, #127
  static GameOver + #359, #127

  ;Linha 9
  static GameOver + #360, #127
  static GameOver + #361, #127
  static GameOver + #362, #127
  static GameOver + #363, #127
  static GameOver + #364, #127
  static GameOver + #365, #127
  static GameOver + #366, #127
  static GameOver + #367, #127
  static GameOver + #368, #127
  static GameOver + #369, #127
  static GameOver + #370, #127
  static GameOver + #371, #127
  static GameOver + #372, #127
  static GameOver + #373, #127
  static GameOver + #374, #127
  static GameOver + #375, #127
  static GameOver + #376, #127
  static GameOver + #377, #127
  static GameOver + #378, #127
  static GameOver + #379, #127
  static GameOver + #380, #127
  static GameOver + #381, #127
  static GameOver + #382, #127
  static GameOver + #383, #127
  static GameOver + #384, #127
  static GameOver + #385, #127
  static GameOver + #386, #127
  static GameOver + #387, #127
  static GameOver + #388, #127
  static GameOver + #389, #127
  static GameOver + #390, #127
  static GameOver + #391, #127
  static GameOver + #392, #127
  static GameOver + #393, #127
  static GameOver + #394, #127
  static GameOver + #395, #127
  static GameOver + #396, #127
  static GameOver + #397, #127
  static GameOver + #398, #127
  static GameOver + #399, #127

  ;Linha 10
  static GameOver + #400, #127
  static GameOver + #401, #127
  static GameOver + #402, #127
  static GameOver + #403, #127
  static GameOver + #404, #127
  static GameOver + #405, #127
  static GameOver + #406, #127
  static GameOver + #407, #127
  static GameOver + #408, #127
  static GameOver + #409, #127
  static GameOver + #410, #127
  static GameOver + #411, #127
  static GameOver + #412, #127
  static GameOver + #413, #127
  static GameOver + #414, #127
  static GameOver + #415, #127
  static GameOver + #416, #127
  static GameOver + #417, #127
  static GameOver + #418, #127
  static GameOver + #419, #127
  static GameOver + #420, #127
  static GameOver + #421, #127
  static GameOver + #422, #127
  static GameOver + #423, #127
  static GameOver + #424, #127
  static GameOver + #425, #127
  static GameOver + #426, #127
  static GameOver + #427, #127
  static GameOver + #428, #127
  static GameOver + #429, #127
  static GameOver + #430, #127
  static GameOver + #431, #127
  static GameOver + #432, #127
  static GameOver + #433, #127
  static GameOver + #434, #127
  static GameOver + #435, #127
  static GameOver + #436, #127
  static GameOver + #437, #127
  static GameOver + #438, #127
  static GameOver + #439, #127

  ;Linha 11
  static GameOver + #440, #127
  static GameOver + #441, #127
  static GameOver + #442, #127
  static GameOver + #443, #127
  static GameOver + #444, #127
  static GameOver + #445, #127
  static GameOver + #446, #127
  static GameOver + #447, #127
  static GameOver + #448, #127
  static GameOver + #449, #127
  static GameOver + #450, #127
  static GameOver + #451, #127
  static GameOver + #452, #127
  static GameOver + #453, #45
  static GameOver + #454, #127
  static GameOver + #455, #71
  static GameOver + #456, #65
  static GameOver + #457, #77
  static GameOver + #458, #69
  static GameOver + #459, #127
  static GameOver + #460, #79
  static GameOver + #461, #86
  static GameOver + #462, #69
  static GameOver + #463, #82
  static GameOver + #464, #127
  static GameOver + #465, #45
  static GameOver + #466, #127
  static GameOver + #467, #127
  static GameOver + #468, #127
  static GameOver + #469, #127
  static GameOver + #470, #127
  static GameOver + #471, #127
  static GameOver + #472, #127
  static GameOver + #473, #127
  static GameOver + #474, #127
  static GameOver + #475, #127
  static GameOver + #476, #127
  static GameOver + #477, #127
  static GameOver + #478, #127
  static GameOver + #479, #127

  ;Linha 12
  static GameOver + #480, #127
  static GameOver + #481, #127
  static GameOver + #482, #127
  static GameOver + #483, #127
  static GameOver + #484, #127
  static GameOver + #485, #127
  static GameOver + #486, #127
  static GameOver + #487, #127
  static GameOver + #488, #127
  static GameOver + #489, #127
  static GameOver + #490, #127
  static GameOver + #491, #127
  static GameOver + #492, #127
  static GameOver + #493, #3967
  static GameOver + #494, #3967
  static GameOver + #495, #3967
  static GameOver + #496, #3967
  static GameOver + #497, #3967
  static GameOver + #498, #3967
  static GameOver + #499, #3967
  static GameOver + #500, #3967
  static GameOver + #501, #3967
  static GameOver + #502, #3967
  static GameOver + #503, #3967
  static GameOver + #504, #3967
  static GameOver + #505, #3967
  static GameOver + #506, #127
  static GameOver + #507, #127
  static GameOver + #508, #127
  static GameOver + #509, #127
  static GameOver + #510, #127
  static GameOver + #511, #127
  static GameOver + #512, #127
  static GameOver + #513, #127
  static GameOver + #514, #127
  static GameOver + #515, #127
  static GameOver + #516, #127
  static GameOver + #517, #127
  static GameOver + #518, #127
  static GameOver + #519, #127

  ;Linha 13
  static GameOver + #520, #127
  static GameOver + #521, #127
  static GameOver + #522, #127
  static GameOver + #523, #127
  static GameOver + #524, #127
  static GameOver + #525, #127
  static GameOver + #526, #127
  static GameOver + #527, #127
  static GameOver + #528, #127
  static GameOver + #529, #127
  static GameOver + #530, #127
  static GameOver + #531, #127
  static GameOver + #532, #127
  static GameOver + #533, #127
  static GameOver + #534, #127
  static GameOver + #535, #127
  static GameOver + #536, #127
  static GameOver + #537, #127
  static GameOver + #538, #127
  static GameOver + #539, #127
  static GameOver + #540, #127
  static GameOver + #541, #127
  static GameOver + #542, #127
  static GameOver + #543, #127
  static GameOver + #544, #127
  static GameOver + #545, #127
  static GameOver + #546, #127
  static GameOver + #547, #127
  static GameOver + #548, #127
  static GameOver + #549, #127
  static GameOver + #550, #127
  static GameOver + #551, #127
  static GameOver + #552, #127
  static GameOver + #553, #127
  static GameOver + #554, #127
  static GameOver + #555, #127
  static GameOver + #556, #127
  static GameOver + #557, #127
  static GameOver + #558, #127
  static GameOver + #559, #127

  ;Linha 14
  static GameOver + #560, #127
  static GameOver + #561, #127
  static GameOver + #562, #127
  static GameOver + #563, #127
  static GameOver + #564, #127
  static GameOver + #565, #127
  static GameOver + #566, #127
  static GameOver + #567, #127
  static GameOver + #568, #127
  static GameOver + #569, #127
  static GameOver + #570, #21
  static GameOver + #571, #127
  static GameOver + #572, #82
  static GameOver + #573, #101
  static GameOver + #574, #115
  static GameOver + #575, #116
  static GameOver + #576, #97
  static GameOver + #577, #114
  static GameOver + #578, #116
  static GameOver + #579, #46
  static GameOver + #580, #46
  static GameOver + #581, #46
  static GameOver + #582, #91
  static GameOver + #583, #83
  static GameOver + #584, #80
  static GameOver + #585, #65
  static GameOver + #586, #67
  static GameOver + #587, #69
  static GameOver + #588, #93
  static GameOver + #589, #127
  static GameOver + #590, #127
  static GameOver + #591, #127
  static GameOver + #592, #127
  static GameOver + #593, #127
  static GameOver + #594, #127
  static GameOver + #595, #127
  static GameOver + #596, #127
  static GameOver + #597, #127
  static GameOver + #598, #127
  static GameOver + #599, #127

  ;Linha 15
  static GameOver + #600, #127
  static GameOver + #601, #127
  static GameOver + #602, #127
  static GameOver + #603, #127
  static GameOver + #604, #127
  static GameOver + #605, #127
  static GameOver + #606, #127
  static GameOver + #607, #127
  static GameOver + #608, #127
  static GameOver + #609, #127
  static GameOver + #610, #127
  static GameOver + #611, #127
  static GameOver + #612, #127
  static GameOver + #613, #127
  static GameOver + #614, #127
  static GameOver + #615, #127
  static GameOver + #616, #127
  static GameOver + #617, #127
  static GameOver + #618, #127
  static GameOver + #619, #127
  static GameOver + #620, #127
  static GameOver + #621, #127
  static GameOver + #622, #127
  static GameOver + #623, #127
  static GameOver + #624, #127
  static GameOver + #625, #127
  static GameOver + #626, #127
  static GameOver + #627, #127
  static GameOver + #628, #127
  static GameOver + #629, #127
  static GameOver + #630, #127
  static GameOver + #631, #127
  static GameOver + #632, #127
  static GameOver + #633, #127
  static GameOver + #634, #127
  static GameOver + #635, #127
  static GameOver + #636, #127
  static GameOver + #637, #127
  static GameOver + #638, #127
  static GameOver + #639, #127

  ;Linha 16
  static GameOver + #640, #127
  static GameOver + #641, #127
  static GameOver + #642, #127
  static GameOver + #643, #127
  static GameOver + #644, #127
  static GameOver + #645, #127
  static GameOver + #646, #127
  static GameOver + #647, #127
  static GameOver + #648, #127
  static GameOver + #649, #127
  static GameOver + #650, #21
  static GameOver + #651, #127
  static GameOver + #652, #81
  static GameOver + #653, #117
  static GameOver + #654, #105
  static GameOver + #655, #116
  static GameOver + #656, #46
  static GameOver + #657, #46
  static GameOver + #658, #46
  static GameOver + #659, #46
  static GameOver + #660, #46
  static GameOver + #661, #46
  static GameOver + #662, #46
  static GameOver + #663, #46
  static GameOver + #664, #91
  static GameOver + #665, #69
  static GameOver + #666, #83
  static GameOver + #667, #67
  static GameOver + #668, #93
  static GameOver + #669, #127
  static GameOver + #670, #127
  static GameOver + #671, #127
  static GameOver + #672, #127
  static GameOver + #673, #127
  static GameOver + #674, #127
  static GameOver + #675, #127
  static GameOver + #676, #127
  static GameOver + #677, #127
  static GameOver + #678, #127
  static GameOver + #679, #127

  ;Linha 17
  static GameOver + #680, #127
  static GameOver + #681, #127
  static GameOver + #682, #127
  static GameOver + #683, #127
  static GameOver + #684, #127
  static GameOver + #685, #127
  static GameOver + #686, #127
  static GameOver + #687, #127
  static GameOver + #688, #127
  static GameOver + #689, #127
  static GameOver + #690, #127
  static GameOver + #691, #127
  static GameOver + #692, #127
  static GameOver + #693, #127
  static GameOver + #694, #127
  static GameOver + #695, #127
  static GameOver + #696, #127
  static GameOver + #697, #127
  static GameOver + #698, #127
  static GameOver + #699, #127
  static GameOver + #700, #127
  static GameOver + #701, #127
  static GameOver + #702, #127
  static GameOver + #703, #127
  static GameOver + #704, #127
  static GameOver + #705, #127
  static GameOver + #706, #127
  static GameOver + #707, #127
  static GameOver + #708, #127
  static GameOver + #709, #127
  static GameOver + #710, #127
  static GameOver + #711, #127
  static GameOver + #712, #127
  static GameOver + #713, #127
  static GameOver + #714, #127
  static GameOver + #715, #127
  static GameOver + #716, #127
  static GameOver + #717, #127
  static GameOver + #718, #127
  static GameOver + #719, #127

  ;Linha 18
  static GameOver + #720, #127
  static GameOver + #721, #127
  static GameOver + #722, #127
  static GameOver + #723, #127
  static GameOver + #724, #127
  static GameOver + #725, #127
  static GameOver + #726, #127
  static GameOver + #727, #127
  static GameOver + #728, #127
  static GameOver + #729, #127
  static GameOver + #730, #127
  static GameOver + #731, #127
  static GameOver + #732, #127
  static GameOver + #733, #127
  static GameOver + #734, #127
  static GameOver + #735, #127
  static GameOver + #736, #127
  static GameOver + #737, #127
  static GameOver + #738, #127
  static GameOver + #739, #127
  static GameOver + #740, #127
  static GameOver + #741, #127
  static GameOver + #742, #127
  static GameOver + #743, #127
  static GameOver + #744, #127
  static GameOver + #745, #127
  static GameOver + #746, #127
  static GameOver + #747, #127
  static GameOver + #748, #127
  static GameOver + #749, #127
  static GameOver + #750, #127
  static GameOver + #751, #127
  static GameOver + #752, #127
  static GameOver + #753, #127
  static GameOver + #754, #127
  static GameOver + #755, #127
  static GameOver + #756, #127
  static GameOver + #757, #127
  static GameOver + #758, #127
  static GameOver + #759, #127

  ;Linha 19
  static GameOver + #760, #127
  static GameOver + #761, #127
  static GameOver + #762, #127
  static GameOver + #763, #127
  static GameOver + #764, #127
  static GameOver + #765, #127
  static GameOver + #766, #127
  static GameOver + #767, #127
  static GameOver + #768, #127
  static GameOver + #769, #127
  static GameOver + #770, #3967
  static GameOver + #771, #3967
  static GameOver + #772, #3967
  static GameOver + #773, #127
  static GameOver + #774, #127
  static GameOver + #775, #127
  static GameOver + #776, #127
  static GameOver + #777, #127
  static GameOver + #778, #127
  static GameOver + #779, #127
  static GameOver + #780, #127
  static GameOver + #781, #127
  static GameOver + #782, #127
  static GameOver + #783, #127
  static GameOver + #784, #127
  static GameOver + #785, #127
  static GameOver + #786, #127
  static GameOver + #787, #127
  static GameOver + #788, #127
  static GameOver + #789, #127
  static GameOver + #790, #127
  static GameOver + #791, #127
  static GameOver + #792, #127
  static GameOver + #793, #127
  static GameOver + #794, #127
  static GameOver + #795, #127
  static GameOver + #796, #127
  static GameOver + #797, #127
  static GameOver + #798, #127
  static GameOver + #799, #127

  ;Linha 20
  static GameOver + #800, #127
  static GameOver + #801, #127
  static GameOver + #802, #127
  static GameOver + #803, #127
  static GameOver + #804, #127
  static GameOver + #805, #127
  static GameOver + #806, #127
  static GameOver + #807, #127
  static GameOver + #808, #127
  static GameOver + #809, #127
  static GameOver + #810, #127
  static GameOver + #811, #127
  static GameOver + #812, #127
  static GameOver + #813, #127
  static GameOver + #814, #127
  static GameOver + #815, #127
  static GameOver + #816, #127
  static GameOver + #817, #127
  static GameOver + #818, #127
  static GameOver + #819, #127
  static GameOver + #820, #127
  static GameOver + #821, #127
  static GameOver + #822, #127
  static GameOver + #823, #127
  static GameOver + #824, #127
  static GameOver + #825, #127
  static GameOver + #826, #127
  static GameOver + #827, #127
  static GameOver + #828, #127
  static GameOver + #829, #127
  static GameOver + #830, #127
  static GameOver + #831, #127
  static GameOver + #832, #127
  static GameOver + #833, #127
  static GameOver + #834, #127
  static GameOver + #835, #127
  static GameOver + #836, #127
  static GameOver + #837, #127
  static GameOver + #838, #127
  static GameOver + #839, #127

  ;Linha 21
  static GameOver + #840, #127
  static GameOver + #841, #127
  static GameOver + #842, #127
  static GameOver + #843, #127
  static GameOver + #844, #127
  static GameOver + #845, #127
  static GameOver + #846, #127
  static GameOver + #847, #127
  static GameOver + #848, #127
  static GameOver + #849, #127
  static GameOver + #850, #127
  static GameOver + #851, #127
  static GameOver + #852, #127
  static GameOver + #853, #127
  static GameOver + #854, #127
  static GameOver + #855, #127
  static GameOver + #856, #127
  static GameOver + #857, #127
  static GameOver + #858, #127
  static GameOver + #859, #127
  static GameOver + #860, #127
  static GameOver + #861, #127
  static GameOver + #862, #127
  static GameOver + #863, #127
  static GameOver + #864, #127
  static GameOver + #865, #127
  static GameOver + #866, #127
  static GameOver + #867, #127
  static GameOver + #868, #127
  static GameOver + #869, #127
  static GameOver + #870, #127
  static GameOver + #871, #127
  static GameOver + #872, #127
  static GameOver + #873, #127
  static GameOver + #874, #127
  static GameOver + #875, #127
  static GameOver + #876, #127
  static GameOver + #877, #127
  static GameOver + #878, #127
  static GameOver + #879, #127

  ;Linha 22
  static GameOver + #880, #127
  static GameOver + #881, #127
  static GameOver + #882, #127
  static GameOver + #883, #127
  static GameOver + #884, #127
  static GameOver + #885, #127
  static GameOver + #886, #127
  static GameOver + #887, #127
  static GameOver + #888, #127
  static GameOver + #889, #127
  static GameOver + #890, #127
  static GameOver + #891, #127
  static GameOver + #892, #127
  static GameOver + #893, #127
  static GameOver + #894, #127
  static GameOver + #895, #127
  static GameOver + #896, #127
  static GameOver + #897, #127
  static GameOver + #898, #127
  static GameOver + #899, #127
  static GameOver + #900, #127
  static GameOver + #901, #127
  static GameOver + #902, #127
  static GameOver + #903, #127
  static GameOver + #904, #127
  static GameOver + #905, #127
  static GameOver + #906, #127
  static GameOver + #907, #127
  static GameOver + #908, #127
  static GameOver + #909, #127
  static GameOver + #910, #127
  static GameOver + #911, #127
  static GameOver + #912, #127
  static GameOver + #913, #127
  static GameOver + #914, #127
  static GameOver + #915, #127
  static GameOver + #916, #127
  static GameOver + #917, #127
  static GameOver + #918, #127
  static GameOver + #919, #127

  ;Linha 23
  static GameOver + #920, #127
  static GameOver + #921, #127
  static GameOver + #922, #127
  static GameOver + #923, #127
  static GameOver + #924, #127
  static GameOver + #925, #127
  static GameOver + #926, #127
  static GameOver + #927, #127
  static GameOver + #928, #127
  static GameOver + #929, #127
  static GameOver + #930, #127
  static GameOver + #931, #127
  static GameOver + #932, #127
  static GameOver + #933, #127
  static GameOver + #934, #127
  static GameOver + #935, #127
  static GameOver + #936, #127
  static GameOver + #937, #127
  static GameOver + #938, #127
  static GameOver + #939, #127
  static GameOver + #940, #127
  static GameOver + #941, #127
  static GameOver + #942, #127
  static GameOver + #943, #127
  static GameOver + #944, #127
  static GameOver + #945, #127
  static GameOver + #946, #127
  static GameOver + #947, #127
  static GameOver + #948, #127
  static GameOver + #949, #127
  static GameOver + #950, #127
  static GameOver + #951, #127
  static GameOver + #952, #127
  static GameOver + #953, #127
  static GameOver + #954, #127
  static GameOver + #955, #127
  static GameOver + #956, #127
  static GameOver + #957, #127
  static GameOver + #958, #127
  static GameOver + #959, #127

  ;Linha 24
  static GameOver + #960, #127
  static GameOver + #961, #127
  static GameOver + #962, #127
  static GameOver + #963, #127
  static GameOver + #964, #127
  static GameOver + #965, #127
  static GameOver + #966, #127
  static GameOver + #967, #127
  static GameOver + #968, #127
  static GameOver + #969, #127
  static GameOver + #970, #127
  static GameOver + #971, #127
  static GameOver + #972, #127
  static GameOver + #973, #127
  static GameOver + #974, #127
  static GameOver + #975, #127
  static GameOver + #976, #127
  static GameOver + #977, #127
  static GameOver + #978, #127
  static GameOver + #979, #127
  static GameOver + #980, #127
  static GameOver + #981, #127
  static GameOver + #982, #127
  static GameOver + #983, #127
  static GameOver + #984, #127
  static GameOver + #985, #127
  static GameOver + #986, #127
  static GameOver + #987, #127
  static GameOver + #988, #127
  static GameOver + #989, #127
  static GameOver + #990, #127
  static GameOver + #991, #127
  static GameOver + #992, #127
  static GameOver + #993, #127
  static GameOver + #994, #127
  static GameOver + #995, #127
  static GameOver + #996, #127
  static GameOver + #997, #127
  static GameOver + #998, #127
  static GameOver + #999, #127

  ;Linha 25
  static GameOver + #1000, #127
  static GameOver + #1001, #127
  static GameOver + #1002, #127
  static GameOver + #1003, #127
  static GameOver + #1004, #127
  static GameOver + #1005, #127
  static GameOver + #1006, #127
  static GameOver + #1007, #127
  static GameOver + #1008, #127
  static GameOver + #1009, #127
  static GameOver + #1010, #127
  static GameOver + #1011, #127
  static GameOver + #1012, #127
  static GameOver + #1013, #127
  static GameOver + #1014, #127
  static GameOver + #1015, #127
  static GameOver + #1016, #127
  static GameOver + #1017, #127
  static GameOver + #1018, #127
  static GameOver + #1019, #127
  static GameOver + #1020, #127
  static GameOver + #1021, #127
  static GameOver + #1022, #127
  static GameOver + #1023, #127
  static GameOver + #1024, #127
  static GameOver + #1025, #127
  static GameOver + #1026, #127
  static GameOver + #1027, #127
  static GameOver + #1028, #127
  static GameOver + #1029, #127
  static GameOver + #1030, #127
  static GameOver + #1031, #127
  static GameOver + #1032, #127
  static GameOver + #1033, #127
  static GameOver + #1034, #127
  static GameOver + #1035, #127
  static GameOver + #1036, #127
  static GameOver + #1037, #127
  static GameOver + #1038, #127
  static GameOver + #1039, #127

  ;Linha 26
  static GameOver + #1040, #127
  static GameOver + #1041, #127
  static GameOver + #1042, #127
  static GameOver + #1043, #127
  static GameOver + #1044, #127
  static GameOver + #1045, #127
  static GameOver + #1046, #127
  static GameOver + #1047, #127
  static GameOver + #1048, #127
  static GameOver + #1049, #127
  static GameOver + #1050, #127
  static GameOver + #1051, #127
  static GameOver + #1052, #127
  static GameOver + #1053, #127
  static GameOver + #1054, #127
  static GameOver + #1055, #127
  static GameOver + #1056, #127
  static GameOver + #1057, #127
  static GameOver + #1058, #127
  static GameOver + #1059, #127
  static GameOver + #1060, #127
  static GameOver + #1061, #127
  static GameOver + #1062, #127
  static GameOver + #1063, #127
  static GameOver + #1064, #127
  static GameOver + #1065, #127
  static GameOver + #1066, #127
  static GameOver + #1067, #127
  static GameOver + #1068, #127
  static GameOver + #1069, #127
  static GameOver + #1070, #127
  static GameOver + #1071, #127
  static GameOver + #1072, #127
  static GameOver + #1073, #127
  static GameOver + #1074, #127
  static GameOver + #1075, #127
  static GameOver + #1076, #127
  static GameOver + #1077, #127
  static GameOver + #1078, #127
  static GameOver + #1079, #127

  ;Linha 27
  static GameOver + #1080, #127
  static GameOver + #1081, #127
  static GameOver + #1082, #127
  static GameOver + #1083, #127
  static GameOver + #1084, #127
  static GameOver + #1085, #127
  static GameOver + #1086, #127
  static GameOver + #1087, #127
  static GameOver + #1088, #127
  static GameOver + #1089, #127
  static GameOver + #1090, #127
  static GameOver + #1091, #127
  static GameOver + #1092, #127
  static GameOver + #1093, #127
  static GameOver + #1094, #127
  static GameOver + #1095, #127
  static GameOver + #1096, #127
  static GameOver + #1097, #127
  static GameOver + #1098, #127
  static GameOver + #1099, #127
  static GameOver + #1100, #127
  static GameOver + #1101, #127
  static GameOver + #1102, #127
  static GameOver + #1103, #127
  static GameOver + #1104, #127
  static GameOver + #1105, #127
  static GameOver + #1106, #127
  static GameOver + #1107, #127
  static GameOver + #1108, #127
  static GameOver + #1109, #127
  static GameOver + #1110, #127
  static GameOver + #1111, #127
  static GameOver + #1112, #127
  static GameOver + #1113, #127
  static GameOver + #1114, #127
  static GameOver + #1115, #127
  static GameOver + #1116, #127
  static GameOver + #1117, #127
  static GameOver + #1118, #127
  static GameOver + #1119, #127

  ;Linha 28
  static GameOver + #1120, #127
  static GameOver + #1121, #127
  static GameOver + #1122, #127
  static GameOver + #1123, #127
  static GameOver + #1124, #127
  static GameOver + #1125, #127
  static GameOver + #1126, #127
  static GameOver + #1127, #127
  static GameOver + #1128, #127
  static GameOver + #1129, #127
  static GameOver + #1130, #127
  static GameOver + #1131, #127
  static GameOver + #1132, #127
  static GameOver + #1133, #127
  static GameOver + #1134, #127
  static GameOver + #1135, #127
  static GameOver + #1136, #127
  static GameOver + #1137, #127
  static GameOver + #1138, #127
  static GameOver + #1139, #127
  static GameOver + #1140, #127
  static GameOver + #1141, #127
  static GameOver + #1142, #127
  static GameOver + #1143, #127
  static GameOver + #1144, #127
  static GameOver + #1145, #127
  static GameOver + #1146, #127
  static GameOver + #1147, #127
  static GameOver + #1148, #127
  static GameOver + #1149, #127
  static GameOver + #1150, #127
  static GameOver + #1151, #127
  static GameOver + #1152, #127
  static GameOver + #1153, #127
  static GameOver + #1154, #127
  static GameOver + #1155, #127
  static GameOver + #1156, #127
  static GameOver + #1157, #127
  static GameOver + #1158, #127
  static GameOver + #1159, #127

  ;Linha 29
  static GameOver + #1160, #127
  static GameOver + #1161, #127
  static GameOver + #1162, #127
  static GameOver + #1163, #127
  static GameOver + #1164, #127
  static GameOver + #1165, #127
  static GameOver + #1166, #127
  static GameOver + #1167, #127
  static GameOver + #1168, #127
  static GameOver + #1169, #127
  static GameOver + #1170, #127
  static GameOver + #1171, #127
  static GameOver + #1172, #127
  static GameOver + #1173, #127
  static GameOver + #1174, #127
  static GameOver + #1175, #127
  static GameOver + #1176, #127
  static GameOver + #1177, #127
  static GameOver + #1178, #127
  static GameOver + #1179, #127
  static GameOver + #1180, #127
  static GameOver + #1181, #127
  static GameOver + #1182, #127
  static GameOver + #1183, #127
  static GameOver + #1184, #127
  static GameOver + #1185, #127
  static GameOver + #1186, #127
  static GameOver + #1187, #127
  static GameOver + #1188, #127
  static GameOver + #1189, #127
  static GameOver + #1190, #127
  static GameOver + #1191, #127
  static GameOver + #1192, #127
  static GameOver + #1193, #127
  static GameOver + #1194, #127
  static GameOver + #1195, #127
  static GameOver + #1196, #127
  static GameOver + #1197, #127
  static GameOver + #1198, #127
  static GameOver + #1199, #127

printGameOverScreen:
  push R0
  push R1
  push R2
  push R3

  loadn R0, #GameOver
  loadn R1, #0
  loadn R2, #1200

  printGameOverScreenLoop:

    add R3,R0,R1
    loadi R3, R3
    outchar R3, R1
    inc R1
    cmp R1, R2

    jne printGameOverScreenLoop

  pop R3
  pop R2
  pop R1
  pop R0
  rts

; ---------------------------------------------
; (SCREEN)                         BLACK SCREEN
; ---------------------------------------------

BlackScreen : var #1200
  ;Linha 0
  static BlackScreen + #0, #3967
  static BlackScreen + #1, #3967
  static BlackScreen + #2, #3967
  static BlackScreen + #3, #3967
  static BlackScreen + #4, #3967
  static BlackScreen + #5, #3967
  static BlackScreen + #6, #3967
  static BlackScreen + #7, #3967
  static BlackScreen + #8, #3967
  static BlackScreen + #9, #3967
  static BlackScreen + #10, #3967
  static BlackScreen + #11, #3967
  static BlackScreen + #12, #3967
  static BlackScreen + #13, #3967
  static BlackScreen + #14, #3967
  static BlackScreen + #15, #3967
  static BlackScreen + #16, #3967
  static BlackScreen + #17, #3967
  static BlackScreen + #18, #3967
  static BlackScreen + #19, #3967
  static BlackScreen + #20, #3967
  static BlackScreen + #21, #3967
  static BlackScreen + #22, #3967
  static BlackScreen + #23, #3967
  static BlackScreen + #24, #3967
  static BlackScreen + #25, #3967
  static BlackScreen + #26, #3967
  static BlackScreen + #27, #3967
  static BlackScreen + #28, #3967
  static BlackScreen + #29, #3967
  static BlackScreen + #30, #3967
  static BlackScreen + #31, #3967
  static BlackScreen + #32, #3967
  static BlackScreen + #33, #3967
  static BlackScreen + #34, #3967
  static BlackScreen + #35, #3967
  static BlackScreen + #36, #3967
  static BlackScreen + #37, #3967
  static BlackScreen + #38, #3967
  static BlackScreen + #39, #3967

  ;Linha 1
  static BlackScreen + #40, #3967
  static BlackScreen + #41, #3967
  static BlackScreen + #42, #3967
  static BlackScreen + #43, #3967
  static BlackScreen + #44, #3967
  static BlackScreen + #45, #3967
  static BlackScreen + #46, #3967
  static BlackScreen + #47, #3967
  static BlackScreen + #48, #3967
  static BlackScreen + #49, #3967
  static BlackScreen + #50, #3967
  static BlackScreen + #51, #3967
  static BlackScreen + #52, #3967
  static BlackScreen + #53, #3967
  static BlackScreen + #54, #3967
  static BlackScreen + #55, #3967
  static BlackScreen + #56, #3967
  static BlackScreen + #57, #3967
  static BlackScreen + #58, #3967
  static BlackScreen + #59, #3967
  static BlackScreen + #60, #3967
  static BlackScreen + #61, #3967
  static BlackScreen + #62, #3967
  static BlackScreen + #63, #3967
  static BlackScreen + #64, #3967
  static BlackScreen + #65, #3967
  static BlackScreen + #66, #3967
  static BlackScreen + #67, #3967
  static BlackScreen + #68, #3967
  static BlackScreen + #69, #3967
  static BlackScreen + #70, #3967
  static BlackScreen + #71, #3967
  static BlackScreen + #72, #3967
  static BlackScreen + #73, #3967
  static BlackScreen + #74, #3967
  static BlackScreen + #75, #3967
  static BlackScreen + #76, #3967
  static BlackScreen + #77, #3967
  static BlackScreen + #78, #3967
  static BlackScreen + #79, #3967

  ;Linha 2
  static BlackScreen + #80, #3967
  static BlackScreen + #81, #3967
  static BlackScreen + #82, #3967
  static BlackScreen + #83, #3967
  static BlackScreen + #84, #3967
  static BlackScreen + #85, #3967
  static BlackScreen + #86, #3967
  static BlackScreen + #87, #3967
  static BlackScreen + #88, #3967
  static BlackScreen + #89, #3967
  static BlackScreen + #90, #3967
  static BlackScreen + #91, #3967
  static BlackScreen + #92, #3967
  static BlackScreen + #93, #3967
  static BlackScreen + #94, #3967
  static BlackScreen + #95, #3967
  static BlackScreen + #96, #3967
  static BlackScreen + #97, #3967
  static BlackScreen + #98, #3967
  static BlackScreen + #99, #3967
  static BlackScreen + #100, #3967
  static BlackScreen + #101, #3967
  static BlackScreen + #102, #3967
  static BlackScreen + #103, #3967
  static BlackScreen + #104, #3967
  static BlackScreen + #105, #3967
  static BlackScreen + #106, #3967
  static BlackScreen + #107, #3967
  static BlackScreen + #108, #3967
  static BlackScreen + #109, #3967
  static BlackScreen + #110, #3967
  static BlackScreen + #111, #3967
  static BlackScreen + #112, #3967
  static BlackScreen + #113, #3967
  static BlackScreen + #114, #3967
  static BlackScreen + #115, #3967
  static BlackScreen + #116, #3967
  static BlackScreen + #117, #3967
  static BlackScreen + #118, #3967
  static BlackScreen + #119, #3967

  ;Linha 3
  static BlackScreen + #120, #3967
  static BlackScreen + #121, #3967
  static BlackScreen + #122, #3967
  static BlackScreen + #123, #3967
  static BlackScreen + #124, #3967
  static BlackScreen + #125, #3967
  static BlackScreen + #126, #3967
  static BlackScreen + #127, #3967
  static BlackScreen + #128, #3967
  static BlackScreen + #129, #3967
  static BlackScreen + #130, #3967
  static BlackScreen + #131, #3967
  static BlackScreen + #132, #3967
  static BlackScreen + #133, #3967
  static BlackScreen + #134, #3967
  static BlackScreen + #135, #3967
  static BlackScreen + #136, #3967
  static BlackScreen + #137, #3967
  static BlackScreen + #138, #3967
  static BlackScreen + #139, #3967
  static BlackScreen + #140, #3967
  static BlackScreen + #141, #3967
  static BlackScreen + #142, #3967
  static BlackScreen + #143, #3967
  static BlackScreen + #144, #3967
  static BlackScreen + #145, #3967
  static BlackScreen + #146, #3967
  static BlackScreen + #147, #3967
  static BlackScreen + #148, #3967
  static BlackScreen + #149, #3967
  static BlackScreen + #150, #3967
  static BlackScreen + #151, #3967
  static BlackScreen + #152, #3967
  static BlackScreen + #153, #3967
  static BlackScreen + #154, #3967
  static BlackScreen + #155, #3967
  static BlackScreen + #156, #3967
  static BlackScreen + #157, #3967
  static BlackScreen + #158, #3967
  static BlackScreen + #159, #3967

  ;Linha 4
  static BlackScreen + #160, #3967
  static BlackScreen + #161, #3967
  static BlackScreen + #162, #3967
  static BlackScreen + #163, #3967
  static BlackScreen + #164, #3967
  static BlackScreen + #165, #3967
  static BlackScreen + #166, #3967
  static BlackScreen + #167, #3967
  static BlackScreen + #168, #3967
  static BlackScreen + #169, #3967
  static BlackScreen + #170, #3967
  static BlackScreen + #171, #3967
  static BlackScreen + #172, #3967
  static BlackScreen + #173, #3967
  static BlackScreen + #174, #3967
  static BlackScreen + #175, #3967
  static BlackScreen + #176, #3967
  static BlackScreen + #177, #3967
  static BlackScreen + #178, #3967
  static BlackScreen + #179, #3967
  static BlackScreen + #180, #3967
  static BlackScreen + #181, #3967
  static BlackScreen + #182, #3967
  static BlackScreen + #183, #3967
  static BlackScreen + #184, #3967
  static BlackScreen + #185, #3967
  static BlackScreen + #186, #3967
  static BlackScreen + #187, #3967
  static BlackScreen + #188, #3967
  static BlackScreen + #189, #3967
  static BlackScreen + #190, #3967
  static BlackScreen + #191, #3967
  static BlackScreen + #192, #3967
  static BlackScreen + #193, #3967
  static BlackScreen + #194, #3967
  static BlackScreen + #195, #3967
  static BlackScreen + #196, #3967
  static BlackScreen + #197, #3967
  static BlackScreen + #198, #3967
  static BlackScreen + #199, #3967

  ;Linha 5
  static BlackScreen + #200, #3967
  static BlackScreen + #201, #3967
  static BlackScreen + #202, #3967
  static BlackScreen + #203, #3967
  static BlackScreen + #204, #3967
  static BlackScreen + #205, #3967
  static BlackScreen + #206, #3967
  static BlackScreen + #207, #3967
  static BlackScreen + #208, #3967
  static BlackScreen + #209, #3967
  static BlackScreen + #210, #3967
  static BlackScreen + #211, #3967
  static BlackScreen + #212, #3967
  static BlackScreen + #213, #3967
  static BlackScreen + #214, #3967
  static BlackScreen + #215, #3967
  static BlackScreen + #216, #3967
  static BlackScreen + #217, #3967
  static BlackScreen + #218, #3967
  static BlackScreen + #219, #3967
  static BlackScreen + #220, #3967
  static BlackScreen + #221, #3967
  static BlackScreen + #222, #3967
  static BlackScreen + #223, #3967
  static BlackScreen + #224, #3967
  static BlackScreen + #225, #3967
  static BlackScreen + #226, #3967
  static BlackScreen + #227, #3967
  static BlackScreen + #228, #3967
  static BlackScreen + #229, #3967
  static BlackScreen + #230, #3967
  static BlackScreen + #231, #3967
  static BlackScreen + #232, #3967
  static BlackScreen + #233, #3967
  static BlackScreen + #234, #3967
  static BlackScreen + #235, #3967
  static BlackScreen + #236, #3967
  static BlackScreen + #237, #3967
  static BlackScreen + #238, #3967
  static BlackScreen + #239, #3967

  ;Linha 6
  static BlackScreen + #240, #3967
  static BlackScreen + #241, #3967
  static BlackScreen + #242, #3967
  static BlackScreen + #243, #3967
  static BlackScreen + #244, #3967
  static BlackScreen + #245, #3967
  static BlackScreen + #246, #3967
  static BlackScreen + #247, #3967
  static BlackScreen + #248, #3967
  static BlackScreen + #249, #3967
  static BlackScreen + #250, #3967
  static BlackScreen + #251, #3967
  static BlackScreen + #252, #3967
  static BlackScreen + #253, #3967
  static BlackScreen + #254, #3967
  static BlackScreen + #255, #3967
  static BlackScreen + #256, #3967
  static BlackScreen + #257, #3967
  static BlackScreen + #258, #3967
  static BlackScreen + #259, #3967
  static BlackScreen + #260, #3967
  static BlackScreen + #261, #3967
  static BlackScreen + #262, #3967
  static BlackScreen + #263, #3967
  static BlackScreen + #264, #3967
  static BlackScreen + #265, #3967
  static BlackScreen + #266, #3967
  static BlackScreen + #267, #3967
  static BlackScreen + #268, #3967
  static BlackScreen + #269, #3967
  static BlackScreen + #270, #3967
  static BlackScreen + #271, #3967
  static BlackScreen + #272, #3967
  static BlackScreen + #273, #3967
  static BlackScreen + #274, #3967
  static BlackScreen + #275, #3967
  static BlackScreen + #276, #3967
  static BlackScreen + #277, #3967
  static BlackScreen + #278, #3967
  static BlackScreen + #279, #3967

  ;Linha 7
  static BlackScreen + #280, #3967
  static BlackScreen + #281, #3967
  static BlackScreen + #282, #3967
  static BlackScreen + #283, #3967
  static BlackScreen + #284, #3967
  static BlackScreen + #285, #3967
  static BlackScreen + #286, #3967
  static BlackScreen + #287, #3967
  static BlackScreen + #288, #3967
  static BlackScreen + #289, #3967
  static BlackScreen + #290, #3967
  static BlackScreen + #291, #3967
  static BlackScreen + #292, #3967
  static BlackScreen + #293, #3967
  static BlackScreen + #294, #3967
  static BlackScreen + #295, #3967
  static BlackScreen + #296, #3967
  static BlackScreen + #297, #3967
  static BlackScreen + #298, #3967
  static BlackScreen + #299, #3967
  static BlackScreen + #300, #3967
  static BlackScreen + #301, #3967
  static BlackScreen + #302, #3967
  static BlackScreen + #303, #3967
  static BlackScreen + #304, #3967
  static BlackScreen + #305, #3967
  static BlackScreen + #306, #3967
  static BlackScreen + #307, #3967
  static BlackScreen + #308, #3967
  static BlackScreen + #309, #3967
  static BlackScreen + #310, #3967
  static BlackScreen + #311, #3967
  static BlackScreen + #312, #3967
  static BlackScreen + #313, #3967
  static BlackScreen + #314, #3967
  static BlackScreen + #315, #3967
  static BlackScreen + #316, #3967
  static BlackScreen + #317, #3967
  static BlackScreen + #318, #3967
  static BlackScreen + #319, #3967

  ;Linha 8
  static BlackScreen + #320, #3967
  static BlackScreen + #321, #3967
  static BlackScreen + #322, #3967
  static BlackScreen + #323, #3967
  static BlackScreen + #324, #3967
  static BlackScreen + #325, #3967
  static BlackScreen + #326, #3967
  static BlackScreen + #327, #3967
  static BlackScreen + #328, #3967
  static BlackScreen + #329, #3967
  static BlackScreen + #330, #3967
  static BlackScreen + #331, #3967
  static BlackScreen + #332, #3967
  static BlackScreen + #333, #3967
  static BlackScreen + #334, #3967
  static BlackScreen + #335, #3967
  static BlackScreen + #336, #3967
  static BlackScreen + #337, #3967
  static BlackScreen + #338, #3967
  static BlackScreen + #339, #3967
  static BlackScreen + #340, #3967
  static BlackScreen + #341, #3967
  static BlackScreen + #342, #3967
  static BlackScreen + #343, #3967
  static BlackScreen + #344, #3967
  static BlackScreen + #345, #3967
  static BlackScreen + #346, #3967
  static BlackScreen + #347, #3967
  static BlackScreen + #348, #3967
  static BlackScreen + #349, #3967
  static BlackScreen + #350, #3967
  static BlackScreen + #351, #3967
  static BlackScreen + #352, #3967
  static BlackScreen + #353, #3967
  static BlackScreen + #354, #3967
  static BlackScreen + #355, #3967
  static BlackScreen + #356, #3967
  static BlackScreen + #357, #3967
  static BlackScreen + #358, #3967
  static BlackScreen + #359, #3967

  ;Linha 9
  static BlackScreen + #360, #3967
  static BlackScreen + #361, #3967
  static BlackScreen + #362, #3967
  static BlackScreen + #363, #3967
  static BlackScreen + #364, #3967
  static BlackScreen + #365, #3967
  static BlackScreen + #366, #3967
  static BlackScreen + #367, #3967
  static BlackScreen + #368, #3967
  static BlackScreen + #369, #3967
  static BlackScreen + #370, #3967
  static BlackScreen + #371, #3967
  static BlackScreen + #372, #3967
  static BlackScreen + #373, #3967
  static BlackScreen + #374, #3967
  static BlackScreen + #375, #3967
  static BlackScreen + #376, #3967
  static BlackScreen + #377, #3967
  static BlackScreen + #378, #3967
  static BlackScreen + #379, #3967
  static BlackScreen + #380, #3967
  static BlackScreen + #381, #3967
  static BlackScreen + #382, #3967
  static BlackScreen + #383, #3967
  static BlackScreen + #384, #3967
  static BlackScreen + #385, #3967
  static BlackScreen + #386, #3967
  static BlackScreen + #387, #3967
  static BlackScreen + #388, #3967
  static BlackScreen + #389, #3967
  static BlackScreen + #390, #3967
  static BlackScreen + #391, #3967
  static BlackScreen + #392, #3967
  static BlackScreen + #393, #3967
  static BlackScreen + #394, #3967
  static BlackScreen + #395, #3967
  static BlackScreen + #396, #3967
  static BlackScreen + #397, #3967
  static BlackScreen + #398, #3967
  static BlackScreen + #399, #3967

  ;Linha 10
  static BlackScreen + #400, #3967
  static BlackScreen + #401, #3967
  static BlackScreen + #402, #3967
  static BlackScreen + #403, #3967
  static BlackScreen + #404, #3967
  static BlackScreen + #405, #3967
  static BlackScreen + #406, #3967
  static BlackScreen + #407, #3967
  static BlackScreen + #408, #3967
  static BlackScreen + #409, #3967
  static BlackScreen + #410, #3967
  static BlackScreen + #411, #3967
  static BlackScreen + #412, #3967
  static BlackScreen + #413, #3967
  static BlackScreen + #414, #3967
  static BlackScreen + #415, #3967
  static BlackScreen + #416, #3967
  static BlackScreen + #417, #3967
  static BlackScreen + #418, #3967
  static BlackScreen + #419, #3967
  static BlackScreen + #420, #3967
  static BlackScreen + #421, #3967
  static BlackScreen + #422, #3967
  static BlackScreen + #423, #3967
  static BlackScreen + #424, #3967
  static BlackScreen + #425, #3967
  static BlackScreen + #426, #3967
  static BlackScreen + #427, #3967
  static BlackScreen + #428, #3967
  static BlackScreen + #429, #3967
  static BlackScreen + #430, #3967
  static BlackScreen + #431, #3967
  static BlackScreen + #432, #3967
  static BlackScreen + #433, #3967
  static BlackScreen + #434, #3967
  static BlackScreen + #435, #3967
  static BlackScreen + #436, #3967
  static BlackScreen + #437, #3967
  static BlackScreen + #438, #3967
  static BlackScreen + #439, #3967

  ;Linha 11
  static BlackScreen + #440, #3967
  static BlackScreen + #441, #3967
  static BlackScreen + #442, #3967
  static BlackScreen + #443, #3967
  static BlackScreen + #444, #3967
  static BlackScreen + #445, #3967
  static BlackScreen + #446, #3967
  static BlackScreen + #447, #3967
  static BlackScreen + #448, #3967
  static BlackScreen + #449, #3967
  static BlackScreen + #450, #3967
  static BlackScreen + #451, #3967
  static BlackScreen + #452, #3967
  static BlackScreen + #453, #3967
  static BlackScreen + #454, #3967
  static BlackScreen + #455, #3967
  static BlackScreen + #456, #3967
  static BlackScreen + #457, #3967
  static BlackScreen + #458, #3967
  static BlackScreen + #459, #3967
  static BlackScreen + #460, #3967
  static BlackScreen + #461, #3967
  static BlackScreen + #462, #3967
  static BlackScreen + #463, #3967
  static BlackScreen + #464, #3967
  static BlackScreen + #465, #3967
  static BlackScreen + #466, #3967
  static BlackScreen + #467, #3967
  static BlackScreen + #468, #3967
  static BlackScreen + #469, #3967
  static BlackScreen + #470, #3967
  static BlackScreen + #471, #3967
  static BlackScreen + #472, #3967
  static BlackScreen + #473, #3967
  static BlackScreen + #474, #3967
  static BlackScreen + #475, #3967
  static BlackScreen + #476, #3967
  static BlackScreen + #477, #3967
  static BlackScreen + #478, #3967
  static BlackScreen + #479, #3967

  ;Linha 12
  static BlackScreen + #480, #3967
  static BlackScreen + #481, #3967
  static BlackScreen + #482, #3967
  static BlackScreen + #483, #3967
  static BlackScreen + #484, #3967
  static BlackScreen + #485, #3967
  static BlackScreen + #486, #3967
  static BlackScreen + #487, #3967
  static BlackScreen + #488, #3967
  static BlackScreen + #489, #3967
  static BlackScreen + #490, #3967
  static BlackScreen + #491, #3967
  static BlackScreen + #492, #3967
  static BlackScreen + #493, #3967
  static BlackScreen + #494, #3967
  static BlackScreen + #495, #3967
  static BlackScreen + #496, #3967
  static BlackScreen + #497, #3967
  static BlackScreen + #498, #3967
  static BlackScreen + #499, #3967
  static BlackScreen + #500, #3967
  static BlackScreen + #501, #3967
  static BlackScreen + #502, #3967
  static BlackScreen + #503, #3967
  static BlackScreen + #504, #3967
  static BlackScreen + #505, #3967
  static BlackScreen + #506, #3967
  static BlackScreen + #507, #3967
  static BlackScreen + #508, #3967
  static BlackScreen + #509, #3967
  static BlackScreen + #510, #3967
  static BlackScreen + #511, #3967
  static BlackScreen + #512, #3967
  static BlackScreen + #513, #3967
  static BlackScreen + #514, #3967
  static BlackScreen + #515, #3967
  static BlackScreen + #516, #3967
  static BlackScreen + #517, #3967
  static BlackScreen + #518, #3967
  static BlackScreen + #519, #3967

  ;Linha 13
  static BlackScreen + #520, #3967
  static BlackScreen + #521, #3967
  static BlackScreen + #522, #3967
  static BlackScreen + #523, #3967
  static BlackScreen + #524, #3967
  static BlackScreen + #525, #3967
  static BlackScreen + #526, #3967
  static BlackScreen + #527, #3967
  static BlackScreen + #528, #3967
  static BlackScreen + #529, #3967
  static BlackScreen + #530, #3967
  static BlackScreen + #531, #3967
  static BlackScreen + #532, #3967
  static BlackScreen + #533, #3967
  static BlackScreen + #534, #3967
  static BlackScreen + #535, #3967
  static BlackScreen + #536, #3967
  static BlackScreen + #537, #3967
  static BlackScreen + #538, #3967
  static BlackScreen + #539, #3967
  static BlackScreen + #540, #3967
  static BlackScreen + #541, #3967
  static BlackScreen + #542, #3967
  static BlackScreen + #543, #3967
  static BlackScreen + #544, #3967
  static BlackScreen + #545, #3967
  static BlackScreen + #546, #3967
  static BlackScreen + #547, #3967
  static BlackScreen + #548, #3967
  static BlackScreen + #549, #3967
  static BlackScreen + #550, #3967
  static BlackScreen + #551, #3967
  static BlackScreen + #552, #3967
  static BlackScreen + #553, #3967
  static BlackScreen + #554, #3967
  static BlackScreen + #555, #3967
  static BlackScreen + #556, #3967
  static BlackScreen + #557, #3967
  static BlackScreen + #558, #3967
  static BlackScreen + #559, #3967

  ;Linha 14
  static BlackScreen + #560, #3967
  static BlackScreen + #561, #3967
  static BlackScreen + #562, #3967
  static BlackScreen + #563, #3967
  static BlackScreen + #564, #3967
  static BlackScreen + #565, #3967
  static BlackScreen + #566, #3967
  static BlackScreen + #567, #3967
  static BlackScreen + #568, #3967
  static BlackScreen + #569, #3967
  static BlackScreen + #570, #3967
  static BlackScreen + #571, #3967
  static BlackScreen + #572, #3967
  static BlackScreen + #573, #3967
  static BlackScreen + #574, #3967
  static BlackScreen + #575, #3967
  static BlackScreen + #576, #3967
  static BlackScreen + #577, #3967
  static BlackScreen + #578, #3967
  static BlackScreen + #579, #3967
  static BlackScreen + #580, #3967
  static BlackScreen + #581, #3967
  static BlackScreen + #582, #3967
  static BlackScreen + #583, #3967
  static BlackScreen + #584, #3967
  static BlackScreen + #585, #3967
  static BlackScreen + #586, #3967
  static BlackScreen + #587, #3967
  static BlackScreen + #588, #3967
  static BlackScreen + #589, #3967
  static BlackScreen + #590, #3967
  static BlackScreen + #591, #3967
  static BlackScreen + #592, #3967
  static BlackScreen + #593, #3967
  static BlackScreen + #594, #3967
  static BlackScreen + #595, #3967
  static BlackScreen + #596, #3967
  static BlackScreen + #597, #3967
  static BlackScreen + #598, #3967
  static BlackScreen + #599, #3967

  ;Linha 15
  static BlackScreen + #600, #3967
  static BlackScreen + #601, #3967
  static BlackScreen + #602, #3967
  static BlackScreen + #603, #3967
  static BlackScreen + #604, #3967
  static BlackScreen + #605, #3967
  static BlackScreen + #606, #3967
  static BlackScreen + #607, #3967
  static BlackScreen + #608, #3967
  static BlackScreen + #609, #3967
  static BlackScreen + #610, #3967
  static BlackScreen + #611, #3967
  static BlackScreen + #612, #3967
  static BlackScreen + #613, #3967
  static BlackScreen + #614, #3967
  static BlackScreen + #615, #3967
  static BlackScreen + #616, #3967
  static BlackScreen + #617, #3967
  static BlackScreen + #618, #3967
  static BlackScreen + #619, #3967
  static BlackScreen + #620, #3967
  static BlackScreen + #621, #3967
  static BlackScreen + #622, #3967
  static BlackScreen + #623, #3967
  static BlackScreen + #624, #3967
  static BlackScreen + #625, #3967
  static BlackScreen + #626, #3967
  static BlackScreen + #627, #3967
  static BlackScreen + #628, #3967
  static BlackScreen + #629, #3967
  static BlackScreen + #630, #3967
  static BlackScreen + #631, #3967
  static BlackScreen + #632, #3967
  static BlackScreen + #633, #3967
  static BlackScreen + #634, #3967
  static BlackScreen + #635, #3967
  static BlackScreen + #636, #3967
  static BlackScreen + #637, #3967
  static BlackScreen + #638, #3967
  static BlackScreen + #639, #3967

  ;Linha 16
  static BlackScreen + #640, #3967
  static BlackScreen + #641, #3967
  static BlackScreen + #642, #3967
  static BlackScreen + #643, #3967
  static BlackScreen + #644, #3967
  static BlackScreen + #645, #3967
  static BlackScreen + #646, #3967
  static BlackScreen + #647, #3967
  static BlackScreen + #648, #3967
  static BlackScreen + #649, #3967
  static BlackScreen + #650, #3967
  static BlackScreen + #651, #3967
  static BlackScreen + #652, #3967
  static BlackScreen + #653, #3967
  static BlackScreen + #654, #3967
  static BlackScreen + #655, #3967
  static BlackScreen + #656, #3967
  static BlackScreen + #657, #3967
  static BlackScreen + #658, #3967
  static BlackScreen + #659, #3967
  static BlackScreen + #660, #3967
  static BlackScreen + #661, #3967
  static BlackScreen + #662, #3967
  static BlackScreen + #663, #3967
  static BlackScreen + #664, #3967
  static BlackScreen + #665, #3967
  static BlackScreen + #666, #3967
  static BlackScreen + #667, #3967
  static BlackScreen + #668, #3967
  static BlackScreen + #669, #3967
  static BlackScreen + #670, #3967
  static BlackScreen + #671, #3967
  static BlackScreen + #672, #3967
  static BlackScreen + #673, #3967
  static BlackScreen + #674, #3967
  static BlackScreen + #675, #3967
  static BlackScreen + #676, #3967
  static BlackScreen + #677, #3967
  static BlackScreen + #678, #3967
  static BlackScreen + #679, #3967

  ;Linha 17
  static BlackScreen + #680, #3967
  static BlackScreen + #681, #3967
  static BlackScreen + #682, #3967
  static BlackScreen + #683, #3967
  static BlackScreen + #684, #3967
  static BlackScreen + #685, #3967
  static BlackScreen + #686, #3967
  static BlackScreen + #687, #3967
  static BlackScreen + #688, #3967
  static BlackScreen + #689, #3967
  static BlackScreen + #690, #3967
  static BlackScreen + #691, #3967
  static BlackScreen + #692, #3967
  static BlackScreen + #693, #3967
  static BlackScreen + #694, #3967
  static BlackScreen + #695, #3967
  static BlackScreen + #696, #3967
  static BlackScreen + #697, #3967
  static BlackScreen + #698, #3967
  static BlackScreen + #699, #3967
  static BlackScreen + #700, #3967
  static BlackScreen + #701, #3967
  static BlackScreen + #702, #3967
  static BlackScreen + #703, #3967
  static BlackScreen + #704, #3967
  static BlackScreen + #705, #3967
  static BlackScreen + #706, #3967
  static BlackScreen + #707, #3967
  static BlackScreen + #708, #3967
  static BlackScreen + #709, #3967
  static BlackScreen + #710, #3967
  static BlackScreen + #711, #3967
  static BlackScreen + #712, #3967
  static BlackScreen + #713, #3967
  static BlackScreen + #714, #3967
  static BlackScreen + #715, #3967
  static BlackScreen + #716, #3967
  static BlackScreen + #717, #3967
  static BlackScreen + #718, #3967
  static BlackScreen + #719, #3967

  ;Linha 18
  static BlackScreen + #720, #3967
  static BlackScreen + #721, #3967
  static BlackScreen + #722, #3967
  static BlackScreen + #723, #3967
  static BlackScreen + #724, #3967
  static BlackScreen + #725, #3967
  static BlackScreen + #726, #3967
  static BlackScreen + #727, #3967
  static BlackScreen + #728, #3967
  static BlackScreen + #729, #3967
  static BlackScreen + #730, #3967
  static BlackScreen + #731, #3967
  static BlackScreen + #732, #3967
  static BlackScreen + #733, #3967
  static BlackScreen + #734, #3967
  static BlackScreen + #735, #3967
  static BlackScreen + #736, #3967
  static BlackScreen + #737, #3967
  static BlackScreen + #738, #3967
  static BlackScreen + #739, #3967
  static BlackScreen + #740, #3967
  static BlackScreen + #741, #3967
  static BlackScreen + #742, #3967
  static BlackScreen + #743, #3967
  static BlackScreen + #744, #3967
  static BlackScreen + #745, #3967
  static BlackScreen + #746, #3967
  static BlackScreen + #747, #3967
  static BlackScreen + #748, #3967
  static BlackScreen + #749, #3967
  static BlackScreen + #750, #3967
  static BlackScreen + #751, #3967
  static BlackScreen + #752, #3967
  static BlackScreen + #753, #3967
  static BlackScreen + #754, #3967
  static BlackScreen + #755, #3967
  static BlackScreen + #756, #3967
  static BlackScreen + #757, #3967
  static BlackScreen + #758, #3967
  static BlackScreen + #759, #3967

  ;Linha 19
  static BlackScreen + #760, #3967
  static BlackScreen + #761, #3967
  static BlackScreen + #762, #3967
  static BlackScreen + #763, #3967
  static BlackScreen + #764, #3967
  static BlackScreen + #765, #3967
  static BlackScreen + #766, #3967
  static BlackScreen + #767, #3967
  static BlackScreen + #768, #3967
  static BlackScreen + #769, #3967
  static BlackScreen + #770, #3967
  static BlackScreen + #771, #3967
  static BlackScreen + #772, #3967
  static BlackScreen + #773, #3967
  static BlackScreen + #774, #3967
  static BlackScreen + #775, #3967
  static BlackScreen + #776, #3967
  static BlackScreen + #777, #3967
  static BlackScreen + #778, #3967
  static BlackScreen + #779, #3967
  static BlackScreen + #780, #3967
  static BlackScreen + #781, #3967
  static BlackScreen + #782, #3967
  static BlackScreen + #783, #3967
  static BlackScreen + #784, #3967
  static BlackScreen + #785, #3967
  static BlackScreen + #786, #3967
  static BlackScreen + #787, #3967
  static BlackScreen + #788, #3967
  static BlackScreen + #789, #3967
  static BlackScreen + #790, #3967
  static BlackScreen + #791, #3967
  static BlackScreen + #792, #3967
  static BlackScreen + #793, #3967
  static BlackScreen + #794, #3967
  static BlackScreen + #795, #3967
  static BlackScreen + #796, #3967
  static BlackScreen + #797, #3967
  static BlackScreen + #798, #3967
  static BlackScreen + #799, #3967

  ;Linha 20
  static BlackScreen + #800, #3967
  static BlackScreen + #801, #3967
  static BlackScreen + #802, #3967
  static BlackScreen + #803, #3967
  static BlackScreen + #804, #3967
  static BlackScreen + #805, #3967
  static BlackScreen + #806, #3967
  static BlackScreen + #807, #3967
  static BlackScreen + #808, #3967
  static BlackScreen + #809, #3967
  static BlackScreen + #810, #3967
  static BlackScreen + #811, #3967
  static BlackScreen + #812, #3967
  static BlackScreen + #813, #3967
  static BlackScreen + #814, #3967
  static BlackScreen + #815, #3967
  static BlackScreen + #816, #3967
  static BlackScreen + #817, #3967
  static BlackScreen + #818, #3967
  static BlackScreen + #819, #3967
  static BlackScreen + #820, #3967
  static BlackScreen + #821, #3967
  static BlackScreen + #822, #3967
  static BlackScreen + #823, #3967
  static BlackScreen + #824, #3967
  static BlackScreen + #825, #3967
  static BlackScreen + #826, #3967
  static BlackScreen + #827, #3967
  static BlackScreen + #828, #3967
  static BlackScreen + #829, #3967
  static BlackScreen + #830, #3967
  static BlackScreen + #831, #3967
  static BlackScreen + #832, #3967
  static BlackScreen + #833, #3967
  static BlackScreen + #834, #3967
  static BlackScreen + #835, #3967
  static BlackScreen + #836, #3967
  static BlackScreen + #837, #3967
  static BlackScreen + #838, #3967
  static BlackScreen + #839, #3967

  ;Linha 21
  static BlackScreen + #840, #3967
  static BlackScreen + #841, #3967
  static BlackScreen + #842, #3967
  static BlackScreen + #843, #3967
  static BlackScreen + #844, #3967
  static BlackScreen + #845, #3967
  static BlackScreen + #846, #3967
  static BlackScreen + #847, #3967
  static BlackScreen + #848, #3967
  static BlackScreen + #849, #3967
  static BlackScreen + #850, #3967
  static BlackScreen + #851, #3967
  static BlackScreen + #852, #3967
  static BlackScreen + #853, #3967
  static BlackScreen + #854, #3967
  static BlackScreen + #855, #3967
  static BlackScreen + #856, #3967
  static BlackScreen + #857, #3967
  static BlackScreen + #858, #3967
  static BlackScreen + #859, #3967
  static BlackScreen + #860, #3967
  static BlackScreen + #861, #3967
  static BlackScreen + #862, #3967
  static BlackScreen + #863, #3967
  static BlackScreen + #864, #3967
  static BlackScreen + #865, #3967
  static BlackScreen + #866, #3967
  static BlackScreen + #867, #3967
  static BlackScreen + #868, #3967
  static BlackScreen + #869, #3967
  static BlackScreen + #870, #3967
  static BlackScreen + #871, #3967
  static BlackScreen + #872, #3967
  static BlackScreen + #873, #3967
  static BlackScreen + #874, #3967
  static BlackScreen + #875, #3967
  static BlackScreen + #876, #3967
  static BlackScreen + #877, #3967
  static BlackScreen + #878, #3967
  static BlackScreen + #879, #3967

  ;Linha 22
  static BlackScreen + #880, #3967
  static BlackScreen + #881, #3967
  static BlackScreen + #882, #3967
  static BlackScreen + #883, #3967
  static BlackScreen + #884, #3967
  static BlackScreen + #885, #3967
  static BlackScreen + #886, #3967
  static BlackScreen + #887, #3967
  static BlackScreen + #888, #3967
  static BlackScreen + #889, #3967
  static BlackScreen + #890, #3967
  static BlackScreen + #891, #3967
  static BlackScreen + #892, #3967
  static BlackScreen + #893, #3967
  static BlackScreen + #894, #3967
  static BlackScreen + #895, #3967
  static BlackScreen + #896, #3967
  static BlackScreen + #897, #3967
  static BlackScreen + #898, #3967
  static BlackScreen + #899, #3967
  static BlackScreen + #900, #3967
  static BlackScreen + #901, #3967
  static BlackScreen + #902, #3967
  static BlackScreen + #903, #3967
  static BlackScreen + #904, #3967
  static BlackScreen + #905, #3967
  static BlackScreen + #906, #3967
  static BlackScreen + #907, #3967
  static BlackScreen + #908, #3967
  static BlackScreen + #909, #3967
  static BlackScreen + #910, #3967
  static BlackScreen + #911, #3967
  static BlackScreen + #912, #3967
  static BlackScreen + #913, #3967
  static BlackScreen + #914, #3967
  static BlackScreen + #915, #3967
  static BlackScreen + #916, #3967
  static BlackScreen + #917, #3967
  static BlackScreen + #918, #3967
  static BlackScreen + #919, #3967

  ;Linha 23
  static BlackScreen + #920, #3967
  static BlackScreen + #921, #3967
  static BlackScreen + #922, #3967
  static BlackScreen + #923, #3967
  static BlackScreen + #924, #3967
  static BlackScreen + #925, #3967
  static BlackScreen + #926, #3967
  static BlackScreen + #927, #3967
  static BlackScreen + #928, #3967
  static BlackScreen + #929, #3967
  static BlackScreen + #930, #3967
  static BlackScreen + #931, #3967
  static BlackScreen + #932, #3967
  static BlackScreen + #933, #3967
  static BlackScreen + #934, #3967
  static BlackScreen + #935, #3967
  static BlackScreen + #936, #3967
  static BlackScreen + #937, #3967
  static BlackScreen + #938, #3967
  static BlackScreen + #939, #3967
  static BlackScreen + #940, #3967
  static BlackScreen + #941, #3967
  static BlackScreen + #942, #3967
  static BlackScreen + #943, #3967
  static BlackScreen + #944, #3967
  static BlackScreen + #945, #3967
  static BlackScreen + #946, #3967
  static BlackScreen + #947, #3967
  static BlackScreen + #948, #3967
  static BlackScreen + #949, #3967
  static BlackScreen + #950, #3967
  static BlackScreen + #951, #3967
  static BlackScreen + #952, #3967
  static BlackScreen + #953, #3967
  static BlackScreen + #954, #3967
  static BlackScreen + #955, #3967
  static BlackScreen + #956, #3967
  static BlackScreen + #957, #3967
  static BlackScreen + #958, #3967
  static BlackScreen + #959, #3967

  ;Linha 24
  static BlackScreen + #960, #3967
  static BlackScreen + #961, #3967
  static BlackScreen + #962, #3967
  static BlackScreen + #963, #3967
  static BlackScreen + #964, #3967
  static BlackScreen + #965, #3967
  static BlackScreen + #966, #3967
  static BlackScreen + #967, #3967
  static BlackScreen + #968, #3967
  static BlackScreen + #969, #3967
  static BlackScreen + #970, #3967
  static BlackScreen + #971, #3967
  static BlackScreen + #972, #3967
  static BlackScreen + #973, #3967
  static BlackScreen + #974, #3967
  static BlackScreen + #975, #3967
  static BlackScreen + #976, #3967
  static BlackScreen + #977, #3967
  static BlackScreen + #978, #3967
  static BlackScreen + #979, #3967
  static BlackScreen + #980, #3967
  static BlackScreen + #981, #3967
  static BlackScreen + #982, #3967
  static BlackScreen + #983, #3967
  static BlackScreen + #984, #3967
  static BlackScreen + #985, #3967
  static BlackScreen + #986, #3967
  static BlackScreen + #987, #3967
  static BlackScreen + #988, #3967
  static BlackScreen + #989, #3967
  static BlackScreen + #990, #3967
  static BlackScreen + #991, #3967
  static BlackScreen + #992, #3967
  static BlackScreen + #993, #3967
  static BlackScreen + #994, #3967
  static BlackScreen + #995, #3967
  static BlackScreen + #996, #3967
  static BlackScreen + #997, #3967
  static BlackScreen + #998, #3967
  static BlackScreen + #999, #3967

  ;Linha 25
  static BlackScreen + #1000, #3967
  static BlackScreen + #1001, #3967
  static BlackScreen + #1002, #3967
  static BlackScreen + #1003, #3967
  static BlackScreen + #1004, #3967
  static BlackScreen + #1005, #3967
  static BlackScreen + #1006, #3967
  static BlackScreen + #1007, #3967
  static BlackScreen + #1008, #3967
  static BlackScreen + #1009, #3967
  static BlackScreen + #1010, #3967
  static BlackScreen + #1011, #3967
  static BlackScreen + #1012, #3967
  static BlackScreen + #1013, #3967
  static BlackScreen + #1014, #3967
  static BlackScreen + #1015, #3967
  static BlackScreen + #1016, #3967
  static BlackScreen + #1017, #3967
  static BlackScreen + #1018, #3967
  static BlackScreen + #1019, #3967
  static BlackScreen + #1020, #3967
  static BlackScreen + #1021, #3967
  static BlackScreen + #1022, #3967
  static BlackScreen + #1023, #3967
  static BlackScreen + #1024, #3967
  static BlackScreen + #1025, #3967
  static BlackScreen + #1026, #3967
  static BlackScreen + #1027, #3967
  static BlackScreen + #1028, #3967
  static BlackScreen + #1029, #3967
  static BlackScreen + #1030, #3967
  static BlackScreen + #1031, #3967
  static BlackScreen + #1032, #3967
  static BlackScreen + #1033, #3967
  static BlackScreen + #1034, #3967
  static BlackScreen + #1035, #3967
  static BlackScreen + #1036, #3967
  static BlackScreen + #1037, #3967
  static BlackScreen + #1038, #3967
  static BlackScreen + #1039, #3967

  ;Linha 26
  static BlackScreen + #1040, #3967
  static BlackScreen + #1041, #3967
  static BlackScreen + #1042, #3967
  static BlackScreen + #1043, #3967
  static BlackScreen + #1044, #3967
  static BlackScreen + #1045, #3967
  static BlackScreen + #1046, #3967
  static BlackScreen + #1047, #3967
  static BlackScreen + #1048, #3967
  static BlackScreen + #1049, #3967
  static BlackScreen + #1050, #3967
  static BlackScreen + #1051, #3967
  static BlackScreen + #1052, #3967
  static BlackScreen + #1053, #3967
  static BlackScreen + #1054, #3967
  static BlackScreen + #1055, #3967
  static BlackScreen + #1056, #3967
  static BlackScreen + #1057, #3967
  static BlackScreen + #1058, #3967
  static BlackScreen + #1059, #3967
  static BlackScreen + #1060, #3967
  static BlackScreen + #1061, #3967
  static BlackScreen + #1062, #3967
  static BlackScreen + #1063, #3967
  static BlackScreen + #1064, #3967
  static BlackScreen + #1065, #3967
  static BlackScreen + #1066, #3967
  static BlackScreen + #1067, #3967
  static BlackScreen + #1068, #3967
  static BlackScreen + #1069, #3967
  static BlackScreen + #1070, #3967
  static BlackScreen + #1071, #3967
  static BlackScreen + #1072, #3967
  static BlackScreen + #1073, #3967
  static BlackScreen + #1074, #3967
  static BlackScreen + #1075, #3967
  static BlackScreen + #1076, #3967
  static BlackScreen + #1077, #3967
  static BlackScreen + #1078, #3967
  static BlackScreen + #1079, #3967

  ;Linha 27
  static BlackScreen + #1080, #3967
  static BlackScreen + #1081, #3967
  static BlackScreen + #1082, #3967
  static BlackScreen + #1083, #3967
  static BlackScreen + #1084, #3967
  static BlackScreen + #1085, #3967
  static BlackScreen + #1086, #3967
  static BlackScreen + #1087, #3967
  static BlackScreen + #1088, #3967
  static BlackScreen + #1089, #3967
  static BlackScreen + #1090, #3967
  static BlackScreen + #1091, #3967
  static BlackScreen + #1092, #3967
  static BlackScreen + #1093, #3967
  static BlackScreen + #1094, #3967
  static BlackScreen + #1095, #3967
  static BlackScreen + #1096, #3967
  static BlackScreen + #1097, #3967
  static BlackScreen + #1098, #3967
  static BlackScreen + #1099, #3967
  static BlackScreen + #1100, #3967
  static BlackScreen + #1101, #3967
  static BlackScreen + #1102, #3967
  static BlackScreen + #1103, #3967
  static BlackScreen + #1104, #3967
  static BlackScreen + #1105, #3967
  static BlackScreen + #1106, #3967
  static BlackScreen + #1107, #3967
  static BlackScreen + #1108, #3967
  static BlackScreen + #1109, #3967
  static BlackScreen + #1110, #3967
  static BlackScreen + #1111, #3967
  static BlackScreen + #1112, #3967
  static BlackScreen + #1113, #3967
  static BlackScreen + #1114, #3967
  static BlackScreen + #1115, #3967
  static BlackScreen + #1116, #3967
  static BlackScreen + #1117, #3967
  static BlackScreen + #1118, #3967
  static BlackScreen + #1119, #3967

  ;Linha 28
  static BlackScreen + #1120, #3967
  static BlackScreen + #1121, #3967
  static BlackScreen + #1122, #3967
  static BlackScreen + #1123, #3967
  static BlackScreen + #1124, #3967
  static BlackScreen + #1125, #3967
  static BlackScreen + #1126, #3967
  static BlackScreen + #1127, #3967
  static BlackScreen + #1128, #3967
  static BlackScreen + #1129, #3967
  static BlackScreen + #1130, #3967
  static BlackScreen + #1131, #3967
  static BlackScreen + #1132, #3967
  static BlackScreen + #1133, #3967
  static BlackScreen + #1134, #3967
  static BlackScreen + #1135, #3967
  static BlackScreen + #1136, #3967
  static BlackScreen + #1137, #3967
  static BlackScreen + #1138, #3967
  static BlackScreen + #1139, #3967
  static BlackScreen + #1140, #3967
  static BlackScreen + #1141, #3967
  static BlackScreen + #1142, #3967
  static BlackScreen + #1143, #3967
  static BlackScreen + #1144, #3967
  static BlackScreen + #1145, #3967
  static BlackScreen + #1146, #3967
  static BlackScreen + #1147, #3967
  static BlackScreen + #1148, #3967
  static BlackScreen + #1149, #3967
  static BlackScreen + #1150, #3967
  static BlackScreen + #1151, #3967
  static BlackScreen + #1152, #3967
  static BlackScreen + #1153, #3967
  static BlackScreen + #1154, #3967
  static BlackScreen + #1155, #3967
  static BlackScreen + #1156, #3967
  static BlackScreen + #1157, #3967
  static BlackScreen + #1158, #3967
  static BlackScreen + #1159, #3967

  ;Linha 29
  static BlackScreen + #1160, #3967
  static BlackScreen + #1161, #3967
  static BlackScreen + #1162, #3967
  static BlackScreen + #1163, #3967
  static BlackScreen + #1164, #3967
  static BlackScreen + #1165, #3967
  static BlackScreen + #1166, #3967
  static BlackScreen + #1167, #3967
  static BlackScreen + #1168, #3967
  static BlackScreen + #1169, #3967
  static BlackScreen + #1170, #3967
  static BlackScreen + #1171, #3967
  static BlackScreen + #1172, #3967
  static BlackScreen + #1173, #3967
  static BlackScreen + #1174, #3967
  static BlackScreen + #1175, #3967
  static BlackScreen + #1176, #3967
  static BlackScreen + #1177, #3967
  static BlackScreen + #1178, #3967
  static BlackScreen + #1179, #3967
  static BlackScreen + #1180, #3967
  static BlackScreen + #1181, #3967
  static BlackScreen + #1182, #3967
  static BlackScreen + #1183, #3967
  static BlackScreen + #1184, #3967
  static BlackScreen + #1185, #3967
  static BlackScreen + #1186, #3967
  static BlackScreen + #1187, #3967
  static BlackScreen + #1188, #3967
  static BlackScreen + #1189, #3967
  static BlackScreen + #1190, #3967
  static BlackScreen + #1191, #3967
  static BlackScreen + #1192, #3967
  static BlackScreen + #1193, #3967
  static BlackScreen + #1194, #3967
  static BlackScreen + #1195, #3967
  static BlackScreen + #1196, #3967
  static BlackScreen + #1197, #3967
  static BlackScreen + #1198, #3967
  static BlackScreen + #1199, #3967

printBlackScreen:
  push R0
  push R1
  push R2
  push R3

  loadn R0, #BlackScreen
  loadn R1, #0
  loadn R2, #1200

  printBlackScreenLoop:

    add R3,R0,R1
    loadi R3, R3
    outchar R3, R1
    inc R1
    cmp R1, R2

    jne printBlackScreenLoop

  pop R3
  pop R2
  pop R1
  pop R0
  rts

; ---------------------------------------------
;                                     VARIABLES
; ---------------------------------------------

Score : var #1
ScorePosition: var #1
Record : var #1

JumpFrameCounter : var #1
ScoreFrameCounter : var #1
SpawnFrameCounter : var #1

ObstacleID : var #1
RandomIdx : var #1

Random : var #50
  static Random + #0, #1
  static Random + #1, #3
  static Random + #2, #2
  static Random + #3, #1
  static Random + #4, #3
  static Random + #5, #1
  static Random + #6, #1
  static Random + #7, #3
  static Random + #8, #3
  static Random + #9, #2
  static Random + #10, #1
  static Random + #11, #2
  static Random + #12, #3
  static Random + #13, #2
  static Random + #14, #1
  static Random + #15, #3
  static Random + #16, #2
  static Random + #17, #3
  static Random + #18, #1
  static Random + #19, #3
  static Random + #20, #1
  static Random + #21, #1
  static Random + #22, #2
  static Random + #23, #3
  static Random + #24, #2
  static Random + #25, #1
  static Random + #26, #2
  static Random + #27, #1
  static Random + #28, #1
  static Random + #29, #1
  static Random + #30, #3
  static Random + #31, #1
  static Random + #32, #1
  static Random + #33, #2
  static Random + #34, #3
  static Random + #35, #1
  static Random + #36, #2
  static Random + #37, #1
  static Random + #38, #3
  static Random + #39, #2
  static Random + #40, #1
  static Random + #41, #2
  static Random + #42, #3
  static Random + #43, #1
  static Random + #44, #1
  static Random + #45, #3
  static Random + #46, #1
  static Random + #47, #1
  static Random + #48, #3
  static Random + #49, #1

CollisionStatus : var #1

; ---------------------------------------------
;                                     FUNCTIONS
; ---------------------------------------------

printScore:
  load r0, Score
  loadn r1, #10000
  loadn r2, #48
  load r3, ScorePosition
  loadn r4, #10
  loadn r5, #5
  add r5, r3, r5

  printDigits:
    div r6, r0, r1
    add r6, r6, r2
    outchar r6, r3
    mod r0, r0, r1
    div r1, r1, r4
    inc r3

    cmp r3, r5
    jle printDigits
  
  rts

simulateDelay:
  loadn r1, #100

  simulateDelayOuterLoop:
    loadn r2, #100

    simulateDelayInnerLoop:
      dec r2
      jnz simulateDelayInnerLoop

    dec r1
    jnz simulateDelayOuterLoop

  rts

checkCollisionEvent:
  load r0, ObstacleID
  loadn r1, #1
  cmp r0, r1
  jeq withCactus
  jgr withPterodactyl

  withCactus:
    load r0, DinoPosition
    load r1, CactusPosition

    loadn r2, #0 ; Eye
    add r2, r0, r2
    call compareWithCactus

    loadn r2, #1 ; Mouth
    add r2, r0, r2
    call compareWithCactus

    loadn r2, #40 ; Arm
    add r2, r0, r2
    call compareWithCactus

    loadn r2, #39 ; Back
    add r2, r0, r2
    call compareWithCactus

    loadn r2, #38 ; Tail
    add r2, r0, r2
    call compareWithCactus

    loadn r2, #80 ; Right Foot
    add r2, r0, r2
    call compareWithCactus

    loadn r2, #79 ; Left Foot
    add r2, r0, r2
    call compareWithCactus

    rts

    compareWithCactus:
      loadn r3, #0 ; Trunk Tip
      add r3, r1, r3
      cmp r2, r3
      ceq raiseCollisionFlag

      loadn r3, #39 ; Left Trunk
      add r3, r1, r3
      cmp r2, r3
      ceq raiseCollisionFlag

      loadn r3, #40 ; Mid Trunk
      add r3, r1, r3
      cmp r2, r3
      ceq raiseCollisionFlag

      loadn r3, #41 ; Right Trunk
      add r3, r1, r3
      cmp r2, r3
      ceq raiseCollisionFlag

      loadn r3, #79 ; Left Branch
      add r3, r1, r3
      cmp r2, r3
      ceq raiseCollisionFlag

      loadn r3, #80 ; Brancher
      add r3, r1, r3
      cmp r2, r3
      ceq raiseCollisionFlag

      loadn r3, #81 ; Right Branch
      add r3, r1, r3
      cmp r2, r3
      ceq raiseCollisionFlag

      loadn r3, #120 ; Base Trunk
      add r3, r1, r3
      cmp r2, r3
      ceq raiseCollisionFlag

      rts

  withPterodactyl:
    load r0, DinoPosition
    load r1, PterodactylPosition

    loadn r2, #0 ; Eye
    add r2, r0, r2
    call compareWithPterodactyl

    loadn r2, #1 ; Mouth
    add r2, r0, r2
    call compareWithPterodactyl

    loadn r2, #40 ; Arm
    add r2, r0, r2
    call compareWithPterodactyl

    loadn r2, #39 ; Back
    add r2, r0, r2
    call compareWithPterodactyl

    loadn r2, #38 ; Tail
    add r2, r0, r2
    call compareWithPterodactyl

    loadn r2, #80 ; Right Foot
    add r2, r0, r2
    call compareWithPterodactyl

    loadn r2, #79 ; Left Foot
    add r2, r0, r2
    call compareWithPterodactyl

    rts

    compareWithPterodactyl:
      loadn r3, #0 ; Wing Tip
      add r3, r1, r3
      cmp r2, r3
      ceq raiseCollisionFlag

      loadn r3, #39 ; Head
      add r3, r1, r3
      cmp r2, r3
      ceq raiseCollisionFlag

      loadn r3, #40 ; Wing
      add r3, r1, r3
      cmp r2, r3
      ceq raiseCollisionFlag

      loadn r3, #41 ; Wing Rest
      add r3, r1, r3
      cmp r2, r3
      ceq raiseCollisionFlag

      loadn r3, #80 ; Body
      add r3, r1, r3
      cmp r2, r3
      ceq raiseCollisionFlag

      loadn r3, #81 ; Legs
      add r3, r1, r3
      cmp r2, r3
      ceq raiseCollisionFlag

      rts

  raiseCollisionFlag:
    loadn r4, #1
    store CollisionStatus, r4

    rts

checkJumpEvent:
  load r0, JumpFrameCounter
  loadn r1, #0
  cmp r0, r1
  jne printNextJumpFrame

  inchar r0
  loadn r1, #' '
  cmp r0, r1
  jeq printNextJumpFrame

  rts

  printNextJumpFrame:
    load r0, JumpFrameCounter
    
    loadn r1, #0
    cmp r0, r1
    jeq moveDinoUpMax

    loadn r1, #3
    cmp r0, r1
    jle moveDinoUpMed

    loadn r1, #5
    cmp r0, r1
    jle moveDinoUpMin

    loadn r1, #7
    cmp r0, r1
    jle moveDinoDownMin

    loadn r1, #9
    cmp r0, r1
    jle moveDinoDownMed

    jeq moveDinoDownMax

    moveDinoUpMax:
      call apagarDino

      load r0, DinoPosition
      loadn r1, #120
      sub r0, r0, r1
      store DinoPosition, r0

      call printDino

      load r0, JumpFrameCounter
      inc r0
      store JumpFrameCounter, r0

      rts

    moveDinoUpMed:
      call apagarDino

      load r0, DinoPosition
      loadn r1, #80
      sub r0, r0, r1
      store DinoPosition, r0

      call printDino

      load r0, JumpFrameCounter
      inc r0
      store JumpFrameCounter, r0

      rts

    moveDinoUpMin:
      call apagarDino

      load r0, DinoPosition
      loadn r1, #40
      sub r0, r0, r1
      store DinoPosition, r0

      call printDino

      load r0, JumpFrameCounter
      inc r0
      store JumpFrameCounter, r0

      rts

    moveDinoDownMin:
      call apagarDino

      load r0, DinoPosition
      loadn r1, #40
      add r0, r0, r1
      store DinoPosition, r0

      call printDino

      load r0, JumpFrameCounter
      inc r0
      store JumpFrameCounter, r0

      rts

    moveDinoDownMed:
      call apagarDino

      load r0, DinoPosition
      loadn r1, #80
      add r0, r0, r1
      store DinoPosition, r0

      call printDino

      load r0, JumpFrameCounter
      inc r0
      store JumpFrameCounter, r0

      rts

    moveDinoDownMax:
      call apagarDino

      load r0, DinoPosition
      loadn r1, #120
      add r0, r0, r1
      store DinoPosition, r0

      call printDino

      loadn r0, #0
      store JumpFrameCounter, r0

      rts

controlScore:
  load r0, ScoreFrameCounter
  loadn r1, #8
  cmp r0, r1
  jeq increaseScore

  inc r0
  store ScoreFrameCounter, r0

  rts

  increaseScore:
    load r0, Score
    inc r0
    store Score, r0

    call printScore

    loadn r0, #0
    store ScoreFrameCounter, r0

    rts

controlObstacle:
  load r0, ObstacleID
  loadn r1, #0
  cmp r0, r1
  jne moveObstacle

  load r0, SpawnFrameCounter
  loadn r1, #5
  cmp r0, r1
  jeq spawnObstacle

  inc r0
  store SpawnFrameCounter, r0

  rts

  moveObstacle:
    loadn r1, #1
    cmp r0, r1
    jeq moveCactus

    loadn r1, #2
    cmp r0, r1
    jeq moveHighPterodactyl

    loadn r1, #3
    cmp r0, r1
    jeq moveLowPterodactyl

    moveCactus:
      call apagarCactus

      load r0, CactusPosition
      loadn r1, #561
      cmp r0, r1
      jeq removeObstacle

      dec r0
      store CactusPosition, r0
      call printCactus

      rts

    moveHighPterodactyl:
      call apagarPterodactyl

      load r0, PterodactylPosition
      loadn r1, #441
      cmp r0, r1
      jeq removeObstacle

      dec r0
      store PterodactylPosition, r0
      call printPterodactyl

      rts

    moveLowPterodactyl:
      call apagarPterodactyl

      load r0, PterodactylPosition
      loadn r1, #561
      cmp r0, r1
      jeq removeObstacle

      dec r0
      store PterodactylPosition, r0
      call printPterodactyl

      rts

    removeObstacle:
      loadn r0, #0
      store ObstacleID, r0
      store SpawnFrameCounter, r0

      rts

  spawnObstacle:
    loadn r0, #Random
    load r1, RandomIdx
    loadn r2, #50

    cmp r1, r2
    ceq resetRandomIdx

    add r0, r0, r1
    loadi r0, r0
    
    inc r1
    store RandomIdx, r1

    loadn r2, #1
    cmp r0, r2
    jeq spawnCactus

    loadn r2, #2
    cmp r0, r2
    jeq spawnHighPtoredactyl

    loadn r2, #3
    cmp r0, r2
    jeq spawnLowPtoredactyl

    resetRandomIdx:
      loadn r1, #0
      
      rts

    spawnCactus:
      loadn r0, #598
      store CactusPosition, r0
      call printCactus

      loadn r0, #1
      store ObstacleID, r0

      rts

    spawnHighPtoredactyl:
      loadn r0, #478
      store PterodactylPosition, r0
      call printPterodactyl

      loadn r0, #2
      store ObstacleID, r0

      rts

    spawnLowPtoredactyl:
      loadn r0, #598
      store PterodactylPosition, r0
      call printPterodactyl

      loadn r0, #3
      store ObstacleID, r0

      rts

replaceScore:
  store Score, r1

  rts

updateRecord:
  store Record, r0

  rts

printRecord:  
  loadn r0, #'H'
  loadn r1, #41
  outchar r0, r1

  loadn r0, #'I'
  loadn r1, #42
  outchar r0, r1

  load r0, Score
  load r1, Record
  cmp r0, r1
  cle replaceScore
  cgr updateRecord

  loadn r0, #44
  store ScorePosition, r0
  call printScore

  rts

resetVariables:
  loadn r0, #0
  store Record, r0
  store JumpFrameCounter, r0
  store ScoreFrameCounter, r0
  store SpawnFrameCounter, r0
  store ObstacleID, r0
  store RandomIdx, r0
  store CollisionStatus, r0
  store CactusPosition, r0
  store PterodactylPosition, r0

  rts

; ---------------------------------------------
;                                          MAIN
; ---------------------------------------------

main:
  call printStartMenuScreen

  waitForStartEvent:
    loadn r0, #' '
    inchar r1
    cmp r0, r1
    
    jne waitForStartEvent
  
  call printGroundScreen
  
  loadn r0, #74
  store ScorePosition, r0
  loadn r0, #0
  store Score, r0
  call printScore

  loadn r0, #607
  store DinoPosition, r0
  call printDino
  
  printFrames: 
    call checkJumpEvent
    call checkCollisionEvent
    
    load r0, CollisionStatus
    loadn r1, #1
    cmp r0, r1
    jeq GameOverMenu

    call controlObstacle
    call checkCollisionEvent
    
    load r0, CollisionStatus
    loadn r1, #1
    cmp r0, r1
    jeq GameOverMenu
    
    call controlScore
    call simulateDelay
    
    jmp printFrames

  GameOverMenu:
    call printGameOverScreen
    call printRecord

    waitForRestartEvent:
      inchar r0

      loadn r1, #127
      cmp r0, r1
      jeq quitGame

      loadn r1, #' '
      cmp r0, r1
      jne waitForRestartEvent

    call resetVariables
    call printGroundScreen
    call printRecord

    loadn r0, #74
    store ScorePosition, r0
    loadn r0, #0
    store Score, r0
    call printScore

    loadn r0, #607
    store DinoPosition, r0
    call printDino

    jmp printFrames

  quitGame:
    call printBlackScreen
    halt
