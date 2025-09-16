#include<iostream>
using namespace std;

int main(){
    float nota; //notas inseridas
    int quant; //quantidade de notas a serem inseridas
    int i;//contador
    float soma=0;//aux de soma
    float media=0;//media final das notas

    //Solicita a quantidade de notas pra validar
    cout << "Quantas notas voce deseja validar?: ";
    cin >> quant;

    //Loop pra soma das notas inseridas
    for(i=0; i<quant; i++){
        cout << "Por favor, insira uma nota: ";
        cin >> nota;

        //Verifica se a nota esta adequada, caso não esteja, solicita novamente
        while(nota<0 || nota>10){
            cout << "Nota em invalida, digite novamente: ";
            cin >> nota;
        }

        soma+=nota; //Soma o valor de todas as notas inseridas
    }

    media = soma/quant; //Calcula a média dessas notas

    //Mostra a média e verifica se o usuário foi aprovado ou não
    cout << "Media: " << media << endl;
    if(media>=7)
        cout << "Parabens! Voce foi aprovade" << endl;
    else
        cout << "Voce foi reprovade! Melhor na proxima!" << endl;

    return 0;
}