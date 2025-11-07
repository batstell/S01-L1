public class Youkai extends Entidades {

    // Construtor
    public Youkai(String nome, String local, Poder poder) {
        super(nome, local, poder);
    }

    // Método específico de Youkai
    public void manifestar() {
        System.out.println("👻 " + getNome() + " se manifestou em " + getLocalizacao() + "!");
    }

}
