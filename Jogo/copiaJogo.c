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
int dinoY = 4;

// representação do cacto
char cacto[2][3] = {
    {'#', '#', '#'},
    {'#', '#', '#'}
};
int cactoX = 36;


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
void putObj(char obj[][3], int nLines, int nCols, int x, int y) {
    for (int i = 0; i < nLines; i ++)
        for (int j = 0; j < nCols; j ++)
            canvas[y+i][x+j] = obj[j][i];
}

int main() {
    
    int gameOver = 0;
    while (gameOver == 0) {
        
        // reset da tela
        system("clear");
        cleanCanvas();
        
        // coloca os objetos e mostra a tela
        putObj(dino, 3, 3, 3, dinoY);
        putObj(cacto, 3, 2, cactoX, 4);
        printCanvas();
        
        // atualiza
        cactoX -= 1;
        usleep(200000);
    }
    
    return 0;
}
