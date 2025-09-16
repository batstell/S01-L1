#include<iostream>
using namespace std;

//Função para somar os itens do vetor
float somarArray(float arr[], int tamanho){
    int i;//contador
    float x=0;//aux de soma

    //Repetição pra somar os números no vetor
    for(i=0; i<tamanho; i++){
        x = x + arr[i];
    }

    return x; //Retorna o valor dessa soma de números
}

int main(){
    int tamanho;//tamanho do vetor
    float x[100];//vetor de números
    int i; //contador

    cout << "Digite qual sera o tamanho do seu vetor: ";
    cin >> tamanho;

    cout << "Digite os itens para serem inseridos no vetor: ";

    //Repetição pra inserir os números no vetor
    for(i=0; i<tamanho;i++)
        cin >> x[i];
    
    //Chama a função e exibe o resultado
    cout << "Resultado da soma dos itens do vetor: " << somarArray(x, tamanho);

    return 0;
}