import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        Scanner entrada = new Scanner(System.in);

        // Criando o registro da equipe
        RegistroOculto registro = new RegistroOculto("Detetives Ocultos");

        // Menu interativo
        int opcao = 0;

        System.out.println("╔════════════════════════════════════════════════════════╗");
        System.out.println("║          🔍 DETETIVES OCULTOS - SISTEMA 🔍            ║");
        System.out.println("║      Registrando invasões alienígenas e youkais       ║");
        System.out.println("╚════════════════════════════════════════════════════════╝");

        while (opcao != 5) {
            System.out.println("\n╔════════════════════════════════════════════════════════╗");
            System.out.println("║                  📋 MENU PRINCIPAL 📋                  ║");
            System.out.println("╠════════════════════════════════════════════════════════╣");
            System.out.println("║  1. Registrar Avistamento de Alien 👽                  ║");
            System.out.println("║  2. Registrar Avistamento de Youkai 👻                 ║");
            System.out.println("║  3. Listar Todos os Avistamentos                       ║");
            System.out.println("║  4. Buscar Entidade Específica                         ║");
            System.out.println("║  5. Sair                                               ║");
            System.out.println("╚════════════════════════════════════════════════════════╝");
            System.out.print("Escolha uma opção: ");

            opcao = entrada.nextInt();
            entrada.nextLine(); // Limpa buffer

            switch (opcao) {
                case 1:
                    // Registrar Alien
                    System.out.println("\n=== 👽 Registrar Avistamento de Alien ===");
                    System.out.print("Nome identificador: ");
                    String nomeAlien = entrada.nextLine();

                    System.out.print("Planeta de origem: ");
                    String planeta = entrada.nextLine();

                    System.out.print("Código do OVNI: ");
                    String ovni = entrada.nextLine();

                    System.out.print("Tipo de poder: ");
                    String poderAlien = entrada.nextLine();

                    Poder poderA = new Poder(poderAlien);
                    Alien alien = new Alien(nomeAlien, planeta, ovni, poderA);

                    if (registro.registrarAvistamento(alien, nomeAlien)) {
                        alien.invadir();
                        System.out.println("📍 " + alien.obterCoordenadas());
                    }
                    break;

                case 2:
                    // Registrar Youkai
                    System.out.println("\n=== 👻 Registrar Avistamento de Youkai ===");
                    System.out.print("Nome identificador: ");
                    String nomeYoukai = entrada.nextLine();

                    System.out.print("Localização: ");
                    String localYoukai = entrada.nextLine();

                    System.out.print("Tipo de poder: ");
                    String poderYoukai = entrada.nextLine();

                    Poder poderY = new Poder(poderYoukai);
                    Youkai youkai = new Youkai(nomeYoukai, localYoukai, poderY);

                    if (registro.registrarAvistamento(youkai, nomeYoukai)) {
                        youkai.manifestar();
                        System.out.println("📍 " + youkai.obterCoordenadas());
                    }
                    break;

                case 3:
                    // Listar avistamentos
                    registro.listarAvistamentos();
                    break;

                case 4:
                    // Buscar entidade
                    System.out.println("\n=== 🔎 Buscar Entidade ===");
                    System.out.print("Digite o nome da entidade: ");
                    String nomeBusca = entrada.nextLine();

                    Entidades encontrada = registro.buscarEntidade(nomeBusca);

                    if (encontrada != null) {
                        System.out.println("\n✓ Entidade encontrada!");
                        System.out.println("Nome: " + encontrada.getNome());
                        System.out.println("Tipo: " + (encontrada instanceof Alien ? "👽 Alien" : "👻 Youkai"));
                        System.out.println("Localização: " + encontrada.getLocalizacao());
                        System.out.println("Poder: " + encontrada.getPoder().getNome());
                        System.out.println(encontrada.obterCoordenadas());

                        if (encontrada instanceof Alien) {
                            Alien a = (Alien) encontrada;
                            System.out.println("Planeta: " + a.getPlanetaOrigem());
                            System.out.println("OVNI: " + a.getOvni());
                        }
                    } else {
                        System.out.println("❌ Entidade não encontrada no registro!");
                    }
                    break;

                case 5:
                    System.out.println("\n╔════════════════════════════════════════════════════════╗");
                    System.out.println("║    🔍 Obrigado por usar o Sistema de Detetives! 🔍    ║");
                    System.out.println("║           Mantenha-se vigilante! 👽👻                 ║");
                    System.out.println("╚════════════════════════════════════════════════════════╝");
                    break;

                default:
                    System.out.println("\n❌ Opção inválida! Tente novamente.");
            }
        }

        entrada.close();
    }
}