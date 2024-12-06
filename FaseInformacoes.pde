class FaseInformacoes extends Fase {
    PFont fonteTitulo;
    PFont fonteTexto;

    FaseInformacoes(ControladorDeFase controlador) {
        super(controlador);
        fonteTitulo = createFont("Arial Bold", 36); // Fonte para título
        fonteTexto = createFont("Arial", 14); // Fonte para texto descritivo (reduzido)
    }

    void render() {
        // Fundo com gradiente
        for (int i = 0; i < height; i++) {
            float inter = map(i, 0, height, 0, 1);
            stroke(50 * inter, 150, 200 + (255 - 200) * inter);
            line(0, i, width, i);
        }

        // Elementos decorativos
        noStroke();
        fill(200, 200, 0, 80);
        fill(255, 255, 255, 30);
        rect(0, height - 50, width, 53); // Efeito de chão

        // Título da tela
        textFont(fonteTitulo);
        fill(255);
        textAlign(CENTER, CENTER);
        text("Informações do Jogo", width / 2, height / 9);

        // Caixa de texto decorativa
        fill(255, 255, 255, 200);
        stroke(0);
        strokeWeight(2);
        rect(width / 10, height / 6, (4 * width) / 5, (4 * height) / 6, 10); // Caixa ainda mais ampliada

        // Texto explicativo
        textFont(fonteTexto);
        fill(0);
        textAlign(CENTER, TOP);
        text(
            "Este jogo foi desenvolvido por:Mariana Ribeiro e Pedro Guedes.\n" +
            "Objetivo:Resolva o mistério para escapar.\n" +
            "Como funciona?\n" +
            "1º Descubra por meio da Dica em qual objeto clicar para começar o primeiro desafio.\n" +
            "2º Insira o ângulo de refração tendo em vista o ângulo de incidência e o indice de refração" +
            "   Quando conseguir, aparecerá uma letra misteriosa. Após isso, clique em qualquer lugar da tela e volte para o cômodo inicial.\n" +
            "3º Descubra por meio da Dica em qual objeto clicar para começar o segundo desafio.\n" +
            "4º Clique nos resistores e altere para paralelo ou série até que consiga alcançar a resistência alvo.\n" +
            "   Quando conseguir, aparecerá uma letra misteriosa. Após isso, clique em qualquer lugar da tela e volte para o cômodo inicial.\n" +
            "5º Descubra por meio da Dica em qual objeto clicar para começar o terceiro desafio.\n" +
            "6º Digite a distância necessária para que a Força Elétrica seja 8.9×10^7 N, tendo em vista o valor das cargas." +
            " Quando conseguir, aparecerá uma letra misteriosa. Após isso, clique em qualquer lugar da tela.\n"+
            "7º Após vencer todos os desafios e descobrir as letras misteriosas, insira as letras" +
            " na ordem em que apareceram e sem espaço.\n" +
            "8º Se a resposta estiver correta, você vence o jogo e será liberto. Pressione C e abra a porta.\n    FIM DE JOGO!",
            width / 10 + 10, height / 6 + 20, (4 * width) / 5 - 20, (4 * height) / 6 - 40
        );

        // Informação de controle (opcional)
        textFont(fonteTexto);
        fill(0);
        text("Pressione B para voltar ao menu.", width / 2, height - 40);
    }

    void handleMousePressed(float x, float y) {}

    void handleKeyPressed(char key) {
        if (key == 'b' || key == 'B') {
            controlador.setFase(new MenuInicial(controlador));
        }
    }
}
