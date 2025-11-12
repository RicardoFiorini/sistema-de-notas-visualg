algoritmo "Sistema_de_Notas_Melhorado"
// Autor: Ricardo Fiorini Cuato (Baseado no código original)
// Data: 12/11/2025
// Descrição: Sistema de notas que usa 'registro' para garantir
//            a integridade dos dados e modularização.

// --- 1. Constantes Globais ---
// (Facilita a manutenção)
const
   MAX_ALUNOS = 100
   MAX_DISCIPLINAS = 10
   MEDIA_APROVACAO = 7.0

// --- 2. Estrutura de Dados (A GRANDE MELHORIA) ---
// Usamos um 'registro' para agrupar todos os dados de 1 aluno
tipo
   TipoAluno = registro
      nome: caractere[50]
      notas: vetor[1..MAX_DISCIPLINAS] de real
      media: real
      situacao: caractere[10]
   fimregistro

var
   // Agora temos UM VETOR de 'TipoAluno'
   alunos: vetor[1..MAX_ALUNOS] de TipoAluno
   quantidadeAlunos, quantidadeDisciplinas: inteiro

// --- 3. Funções de Validação (Robustez) ---

funcao lerInteiroValidado(mensagem: caractere; min, max: inteiro): inteiro
var
   valor: inteiro
inicio
   repita
      escreva(mensagem, " (", min, "-", max, "): ")
      leia(valor)
      se (valor < min) ou (valor > max) entao
         escreval("Valor inválido! Tente novamente.")
      fimse
   ate (valor >= min) e (valor <= max)
   retorne valor
fimfuncao

funcao lerNotaValida(numDisciplina: inteiro): real
var
   nota: real
inicio
   repita
      escreva("Digite a nota da disciplina ", numDisciplina, ": ")
      leia(nota)
      se (nota < 0) ou (nota > 10) entao
         escreval("Nota inválida! Deve ser entre 0 e 10.")
      fimse
   ate (nota >= 0) e (nota <= 10)
   retorne nota
fimfuncao

// --- 4. Procedimentos (Modularização) ---

procedimento lerDadosECalcular(qtdAlunos, qtdDisc: inteiro)
var
   i, j: inteiro
   somaNotas: real
inicio
   para i de 1 ate qtdAlunos faca
      limpatela()
      escreval("--- Dados do Aluno ", i, " de ", qtdAlunos, " ---")
      
      // Agora o nome é salvo DENTRO do registro do aluno
      escreva("Digite o nome do aluno: ")
      leia(alunos[i].nome)
      
      somaNotas := 0
      escreval("Digite as notas de ", alunos[i].nome, ":")
      
      para j de 1 ate qtdDisc faca
         // As notas são salvas no vetor DENTRO do registro
         alunos[i].notas[j] := lerNotaValida(j)
         somaNotas := somaNotas + alunos[i].notas[j]
      fimpara
      
      // Os resultados são salvos DENTRO do registro
      alunos[i].media := somaNotas / qtdDisc
      
      se (alunos[i].media >= MEDIA_APROVACAO) entao
         alunos[i].situacao := "Aprovado"
      senao
         alunos[i].situacao := "Reprovado"
      fimse
      
      escreval("Média de ", alunos[i].nome, " (", alunos[i].situacao, ") salva.")
      escreval("Pressione [ENTER] para o próximo aluno...")
      leia() // Pausa
   fimpara
fimprocedimento

procedimento exibirRelatorio(qtdAlunos: inteiro)
var
   i: inteiro
inicio
   limpatela()
   escreval("=======================================")
   escreval("=== Relatório Final de Notas ===")
   escreval("=======================================")
   para i de 1 ate qtdAlunos faca
      // Agora podemos ler o nome correto!
      escreval("Aluno: ", alunos[i].nome)
      escreval("  Média: ", alunos[i].media:0:2)
      escreval("  Situação: ", alunos[i].situacao)
      escreval("---------------------------------")
   fimpara
fimprocedimento

// --- 5. Bloco Principal (Limpo) ---
inicio
   limpatela()
   escreval("--- Sistema de Notas de Alunos ---")
   
   // Valida as entradas principais
   quantidadeAlunos := lerInteiroValidado("Digite a quantidade de alunos", 1, MAX_ALUNOS)
   quantidadeDisciplinas := lerInteiroValidado("Digite a quantidade de disciplinas", 1, MAX_DISCIPLINAS)
   
   // Chama os procedimentos que fazem o trabalho
   lerDadosECalcular(quantidadeAlunos, quantidadeDisciplinas)
   
   exibirRelatorio(quantidadeAlunos)
   
   escreval("Fim do programa.")
fimalgoritmo
