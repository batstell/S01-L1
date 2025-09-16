#include<iostream>
using namespace std;

//Função de conversão de C pra F
double celsiusParaFahrenheit(double celsius){

    double f=(celsius*1.8)+32;

    return f;
}

//Função de conversão de C pra K
double celsiusParaKelvin(double celsius){

    double k=celsius+273.15;

    return k;
}

int main(){
    double C; //temperatura em Celsius
    int op; //opção a ser selecionada no menu
    bool flag=true; //flag para repetição do menu

    do{
        cout << endl << "--------Conversor de Temperatura--------" << endl;
        cout << endl << "1. Converter Celsius para Fahrenheit." << endl;
        cout << "2. Converter Celsius para Kelvin." << endl;
        cout << "3. Sair" << endl;
        cout << endl << "Digite a opcao desejada: ";
        cin >> op;

        switch (op){
            //Chama a função de C para F e mostra o resultado
            case 1:
                cout << "Digite a temperatura para converter: " << endl;
                cin >> C;
                cout << "Temperatura em Fahrenheit: " << celsiusParaFahrenheit(C) << endl;
            break;

            //Chama a função de C para K e mostra o resultado
            case 2:
                cout << "Digite a temperatura para converter: " << endl;
                cin >> C;
                cout << "Temperatura em Kelvin: " << celsiusParaKelvin(C) << endl;
            break;

            //Sai do menu
            case 3:
                flag = false;
            break;

            //Caso nenhuma opção seja selecionada corrtemanete aparece a mensagem
            default:
                cout << "Opcao invalida! Tente novamente." << endl;

        }

    }while(flag);


    return 0;
}