abstract class Entidades implements IRastreavel {
    private String nome;
    private String localizacao;
    private Poder poder;

    // Construtor
    public Entidades(String nome, String local, Poder poder) {
        this.nome = nome;
        this.localizacao = local;
        this.poder = poder;
    }

    // Implementação do método da interface
    @Override
    public String obterCoordenadas() {
        return "Coordenadas de " + nome + ": " + localizacao;
    }

    // Getters
    public String getNome() {
        return nome;
    }

    public String getLocalizacao() {
        return localizacao;
    }

    public Poder getPoder() {
        return poder;
    }

    // Setters
    public void setNome(String nome) {
        this.nome = nome;
    }

    public void setLocalizacao(String localizacao) {
        this.localizacao = localizacao;
    }

    public void setPoder(Poder poder) {
        this.poder = poder;
    }
}