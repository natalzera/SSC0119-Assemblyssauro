#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

// tela de fundo do jogo
char canvas[8][46] = {};

// representação do dinossauro
char dino[3][3] = {
    {' ', '%', ' '},
    {' ', '%', '%'},
    {'%', '%', ' '}
};
int dinoLen[2] = {3, 3};
int dinoPos[2] = {8, 4};
int dinoVelY = 0;

// representação do cacto
char cacto[2][3] = {
    {'#', '#', '#'},
    {'#', '#', '#'}
};
int cactoLen[2] = {2, 3};
int cactoPos[2] = {42, 4};


// mostra o canvas do jogo
void printCanvas() {
    for (int i = 0; i < 8; i ++)
        printf("%s\n", canvas[i]);
}

// limpa o canvas desenhado seu fundo
void cleanCanvas() {
    char clsCanvas[8][46] = {
        {"                                ***          "},
        {"  ***                                        "},
        {"                    ***                      "},
        {"                                           **"},
        {"                                             "},
        {"_____________________________________________"},
        {" .                         .                 "},
        {"          .                   .            . "}
    };
    
    for (int i = 0; i < 8; i ++)
        for (int j = 0; j < 46; j ++)
            canvas[i][j] = clsCanvas[i][j];
}

// coloca um objeto no canvas dado as posições
void putObj(char obj[][3], int len[2], int pos[2]) {
    for (int i = 0; i < len[1]; i ++)
        for (int j = 0; j < len[0]; j ++)
            canvas[pos[1]+i][pos[0]+j] = obj[j][i];
}

// verifica se ocorreu alguma colisão entre o dinossauro e o cacto
int collision() {
    // eixo y
    if (dinoPos[1] >= 3) {
        // eixo x
        if (dinoPos[0]+dinoLen[0]-1 >= cactoPos[0] && dinoPos[0] <= cactoPos[0])
            return 1;
        else if (dinoPos[0]+dinoLen[0]-1 >= cactoPos[0]+cactoLen[0]-1 && dinoPos[0] <= cactoPos[0]+cactoLen[0]-1)
            return 1;
    }
    
    return 0;
}

// atualiza a posição do cacto, simulando o dinossauro correr
void runDino() {
    if (cactoPos[0] > 0)
        cactoPos[0] -= 1;
    else
        cactoPos[0] = 42;
}

// atualiza a velocidade do dinossauro, para ele pular
void jumpDino() {
    if (dinoPos[1] == 4)
        dinoVelY = 6;
}

// atualiza a posição Y do dinossauro de acordo com sua velocidade
void upadteYDino() {
    // se está subindo
    if (dinoVelY > 0 && dinoPos[1] > 1) {
        dinoPos[1] -= 1;
        dinoVelY -= 1;
    }
    
    // se está no ar "parado"
    else if (dinoVelY > 0) {
        dinoVelY -= 1;
    }
    
    // se está caindo
    else if (dinoVelY == 0 && dinoPos[1] < 4) {
        dinoPos[1] += 1;
    }
}

// atualiza os parâmetros x e y dos objetos na tela
void upadteXY() {
    upadteYDino();
    runDino();
}

// lê uma entrada do teclado para executar uma ação
void input() {
    char in = getchar();
    
    // comando de pulo
    if (in == ' ') {
        getchar();
        jumpDino();
    }
}

// mostra a tela de fim de jogo
void endGame(int score) {
    
    system("clear");
    cleanCanvas();
    
    canvas[2][14] = 'F';
    canvas[2][15] = 'I';
    canvas[2][16] = 'M';
    canvas[2][17] = ' ';
    canvas[2][18] = 'D';
    canvas[2][19] = 'E';
    canvas[2][20] = ' ';
    canvas[2][21] = 'J';
    canvas[2][22] = 'O';
    canvas[2][23] = 'G';
    canvas[2][24] = 'O';
    
    canvas[3][16] = 'S';
    canvas[3][17] = 'C';
    canvas[3][18] = 'O';
    canvas[3][19] = 'R';
    canvas[3][20] = 'E';
    canvas[3][21] = ':';
    canvas[3][22] = ' ';
    
    canvas[3][23] = 48 + (int)(score /10);
    canvas[3][24] = 48 + score - 10 * (int)(score /10);
    
    printCanvas();
}

int main() {
    
    int gameOver = 0, counter = 0, score;
    while (gameOver == 0) {
        
        // reset da tela
        system("clear");
        cleanCanvas();
        
        // coloca os objetos na tela
        putObj(dino, dinoLen, dinoPos);
        putObj(cacto, cactoLen, cactoPos);
        
        // mostra o canvas e o score do jogador
        printf("Score: %d\n", score);
        printCanvas();
        
        // verifica colisões
        if (collision())
            gameOver = 1;
        
        // atualiza
        input();
        upadteXY();
        
        // score = 1/3 do contador de clock
        counter ++;
        score = (int)(counter / 3);
    }
    
    endGame(score);
    return 0;
}
