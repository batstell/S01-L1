import java.util.HashMap;
import java.util.Map;

class RegistroOculto {
    private String nomeEquipe;
    private HashMap<String, Entidades> avistamentos;

    // Construtor
    public RegistroOculto(String nomeEquipe) {
        this.nomeEquipe = nomeEquipe;
        this.avistamentos = new HashMap<>();
    }

    // Método para registrar avistamento
    public boolean registrarAvistamento(Entidades entidade, String nome) {
        // Verifica se já existe
        if (avistamentos.containsKey(nome)) {
            System.out.println("⚠️  ALERTA: " + nome + " já foi registrado anteriormente!");
            return false;
        } else {
            avistamentos.put(nome, entidade);
            System.out.println("✓ Entidade '" + nome + "' registrada com sucesso!");
            return true;
        }
    }

    // Método para listar todos os avistamentos
    public void listarAvistamentos() {
        System.out.println("\n╔════════════════════════════════════════════════════════╗");
        System.out.println("║       🔍 REGISTRO DE AVISTAMENTOS OCULTOS 🔍          ║");
        System.out.println("║       Equipe: " + nomeEquipe + "                              ║");
        System.out.println("╠════════════════════════════════════════════════════════╣");

        if (avistamentos.isEmpty()) {
            System.out.println("║  Nenhum avistamento registrado ainda.                  ║");
        } else {
            int contador = 1;
            for (Map.Entry<String, Entidades> entry : avistamentos.entrySet()) {
                Entidades entidade = entry.getValue();
                System.out.println("║  " + contador + ". " + entry.getKey());
                System.out.println("║     Tipo: " + (entidade instanceof Alien ? "👽 Alien" : "👻 Youkai"));
                System.out.println("║     Localização: " + entidade.getLocalizacao());
                System.out.println("║     Poder: " + entidade.getPoder().getNome());
                System.out.println("║     " + entidade.obterCoordenadas());

                if (entidade instanceof Alien) {
                    Alien alien = (Alien) entidade;
                    System.out.println("║     Planeta: " + alien.getPlanetaOrigem());
                    System.out.println("║     OVNI: " + alien.getOvni());
                }

                System.out.println("╠════════════════════════════════════════════════════════╣");
                contador++;
            }
        }

        System.out.println("║  Total de registros: " + avistamentos.size() + "                             ║");
        System.out.println("╚════════════════════════════════════════════════════════╝");
    }

    // Método para buscar entidade por nome
    public Entidades buscarEntidade(String nome) {
        return avistamentos.get(nome);
    }

    // Getter
    public HashMap<String, Entidades> getAvistamentos() {
        return avistamentos;
    }
}
