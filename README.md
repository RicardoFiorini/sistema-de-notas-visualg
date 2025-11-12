# 🎓 Sistema de Notas de Alunos em Portugol

Este é um projeto de console em Portugol que atua como um mini-sistema acadêmico. Ele permite ao usuário definir quantos alunos e quantas disciplinas serão avaliadas, inserir as notas de cada aluno e, ao final, exibe um relatório completo com a média e a situação (Aprovado/Reprovado) de cada um.

O projeto foi **fortemente refatorado** para usar `registros`, a estrutura de dados correta para este tipo de problema, corrigindo um bug crítico de lógica e eliminando o risco de dessincronização de dados.

## ✨ Funcionalidades

* **Entrada Dinâmica:** O usuário define o número de alunos e de disciplinas no início do programa.
* **Validação de Entrada:** O sistema é robusto e não "quebra". Ele valida:
    * A quantidade de alunos (entre 1 e 100).
    * A quantidade de disciplinas (entre 1 e 10).
    * Cada nota inserida (deve ser entre 0 e 10).
* **Cálculo de Média:** Calcula automaticamente a média aritmética de cada aluno.
* **Determinação de Situação:** Classifica o aluno como "Aprovado" ou "Reprovado" com base em uma `MEDIA_APROVACAO` (definida como 7.0).
* **Relatório Final:** Exibe uma lista limpa e formatada com o **nome** de cada aluno, sua média e situação.
* **Código Modularizado:** O código é separado em procedimentos e funções (`lerDadosECalcular`, `exibirRelatorio`), tornando-o fácil de ler e manter.

## 🛠️ A Correção Crítica: Vetores Paralelos vs. `Registro`

### O Bug do Código Original

O código original sofria de um bug crítico causado por **vetores paralelos** e uma variável `nome` solta.

```portugol
// Original (Frágil)
notas : vetor[...][...]
media : vetor[...]
situacao : vetor[...]
nome : caractere // Bug!
A Solução Robusta com Registro
A versão melhorada resolve isso criando um "molde" de dados chamado TipoAluno (um registro):

Snippet de código

// Melhorado (Robusto)
tipo
   TipoAluno = registro
      nome: caractere[50]
      notas: vetor[1..10] de real
      media: real
      situacao: caractere[10]
   fimregistro
E então criamos um único vetor que armazena "Alunos":

Snippet de código

var
   alunos: vetor[1..100] de TipoAluno
Agora, alunos[5].nome, alunos[5].media e alunos[5].situacao estão permanentemente agrupados. Isso corrige o bug do nome e garante que os dados de um aluno nunca possam ser misturados com os de outro.

🚀 Como Executar
Ambiente: Utilize um interpretador de Portugol como o VisualG (que suporta tipo e registro).

Download: Copie o código do arquivo Sistema_de_Notas_Melhorado.alg.

Executar: Abra o arquivo no interpretador e inicie a execução (normalmente com F9).
