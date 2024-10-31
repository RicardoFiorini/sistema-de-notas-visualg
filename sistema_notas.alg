algoritmo "Sistema de Notas de Alunos"
variáveis
    quantidadeAlunos, quantidadeDisciplinas, i, j : inteiro
    nome : caractere[50]
    notas : vetor[1..100] de vetor[1..10] de real // Até 100 alunos e até 10 disciplinas
    media : vetor[1..100] de real
    situacao : vetor[1..100] de caractere[10] // "Aprovado" ou "Reprovado"
início
    escreva("Digite a quantidade de alunos: ")
    leia(quantidadeAlunos)

    escreva("Digite a quantidade de disciplinas: ")
    leia(quantidadeDisciplinas)

    // Loop para entrada de notas
    para i de 1 até quantidadeAlunos faça
        escreva("Digite o nome do aluno ", i, ": ")
        leia(nome)

        escreva("Notas do aluno ", nome, ":\n")
        somaNotas ← 0
        para j de 1 até quantidadeDisciplinas faça
            escreva("Digite a nota da disciplina ", j, ": ")
            leia(notas[i][j])
            somaNotas ← somaNotas + notas[i][j]
        fimpara

        // Calcula a média
        media[i] ← somaNotas / quantidadeDisciplinas

        // Determina a situação do aluno
        se media[i] >= 7.0 então
            situacao[i] ← "Aprovado"
        senão
            situacao[i] ← "Reprovado"
        fimse
    fimpara

    // Exibe o relatório
    escreva("\n=== Relatório de Notas ===\n")
    para i de 1 até quantidadeAlunos faça
        escreva("Aluno ", i, ": ", nome, "\n")
        escreva("Média: ", media[i]:0:2, "\n")
        escreva("Situação: ", situacao[i], "\n")
    fimpara
fimenquanto
