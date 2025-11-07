class Alien extends Entidades {
    private String planetaOrigem;
    private String ovni;

    // Construtor
    public Alien(String nome, String planeta, String ovni, Poder poder) {
        super(nome, "Espaço", poder);
        this.planetaOrigem = planeta;
        this.ovni = ovni;
    }

    // Getters
    public String getPlanetaOrigem() {
        return planetaOrigem;
    }

    public String getOvni() {
        return ovni;
    }

    // Setters
    public void setPlanetaOrigem(String planetaOrigem) {
        this.planetaOrigem = planetaOrigem;
    }

    public void setOvni(String ovni) {
        this.ovni = ovni;
    }

    // Método específico de Alien
    public void invadir() {
        System.out.println("👽 " + getNome() + " está invadindo a Terra no OVNI " + ovni + "!");
    }
}
