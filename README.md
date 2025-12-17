# 💊 Sistema de Controle de Farmácia (SBD)

Este repositório contém os scripts SQL e a documentação da **Etapa 1** do Projeto de Sistema de Banco de Dados, desenvolvido para a disciplina de SBD do curso de Estatística da Universidade Federal de Uberlândia (UFU).

O objetivo é modelar e implementar um banco de dados relacional para o controle de compras, vendas, estoque e gestão de clientes em uma farmácia, atendendo a requisitos legais da Anvisa e políticas de descontos comerciais.

## 📋 Funcionalidades e Regras de Negócio

O sistema foi modelado para atender às seguintes necessidades:

* **Gestão de Estoque e Lotes:** Controle de produtos por lotes e datas de validade, permitindo rastreabilidade.
* **Controle Regulatório (Anvisa):** Armazenamento de dados específicos para medicamentos, como Registro Anvisa, classificação de tarja (Preta/Vermelha) e retenção de receita, utilizando **Tipos Compostos** no PostgreSQL.
* **Perfil do Cliente e Descontos:** Identificação de perfis para aplicação de descontos (Aposentados, Idosos, Fidelizados, Necessidades Especiais).
* **Dados Sensíveis de Saúde:** Separação dos dados médicos (alergias, uso de controlados) em uma tabela dedicada (`dados_saude`) para segurança e organização.
* **Relatórios Gerenciais:** Views automáticas para análise de "Mais Vendidos", "Lucro/Prejuízo" e "Estoque Atual".

## 🗂️ Estrutura do Banco de Dados

O projeto utiliza **PostgreSQL** e está estruturado nas seguintes tabelas principais:

| Tabela | Descrição |
| :--- | :--- |
| `fornecedor` | Cadastro de distribuidores e laboratórios. |
| `produto` | Catálogo de itens (medicamentos, higiene, cosméticos). Utiliza um **Type** customizado para dados da Anvisa. |
| `cliente` | Cadastro de PF e PJ com flags para cálculo de descontos. |
| `compra` | Registro de entrada de mercadorias (abastecimento de estoque). |
| `venda` | Registro de saída de mercadorias para o consumidor final. |
| `dados_saude` | Informações clínicas sensíveis (1:1 com Cliente). |

## 🚀 Como Executar

Para rodar este projeto, você precisa de um ambiente com **PostgreSQL** instalado. Execute os scripts na seguinte ordem para respeitar as dependências de chaves estrangeiras:

1.  **Criação das Tabelas:**
    Execute o arquivo `criar.sql` (ou `0.sql`) para levantar a estrutura do banco e os tipos compostos.

2.  **População de Dados (Seed):**
    Execute o arquivo `preencher.sql` (ou `inserir.sql`) para carregar os dados iniciais de fornecedores, produtos e clientes.

3.  **Simulação de Operações:**
    Utilize `juntar.sql`, `alterar.sql` ou `reduzir.sql` para testar `JOINs`, `UPDATEs` e `DELETEs`.

4.  **Geração de Relatórios:**
    Execute `relatorio1.sql`, `relatorio2.sql` e `relatorio3.sql` para criar as *Views* de análise.

## 📊 Relatórios Disponíveis (Views)

O sistema conta com Views pré-definidas para auxílio à gestão:

* **`mais_vendidos`:** Classifica os produtos com maior volume de saída.
* **`estoque`:** Calcula o saldo atual (Compras - Vendas) por produto.
* **`lucro_prejuizo`:** Analisa a margem financeira considerando o preço de compra vs. preço de venda e descontos aplicados.

## 🛠️ Tecnologias Utilizadas

* **Linguagem:** SQL (Dialeto PostgreSQL)
* **Ferramentas de Modelagem:** Draw.io (para DER/MER)
* **Documentação:** LaTeX / PDF

## ✒️ Autores

Projeto desenvolvido pelos discentes de Estatística (UFU):

* **Matheus de Moraes Neves**
* **Daniel Barreto de Oliveira**
* **Henrique Tomaz Gonzaga**
