<div align="center">

# Lista MER: Diagramas Entidade-Relacionamento

**Modelagem de Dados · Modelos conceituais no BRModelo**
**Data Modeling · Conceptual models in BRModelo**

![BRModelo](https://img.shields.io/badge/BRModelo-3-1F6FEB?style=for-the-badge)
![DER](https://img.shields.io/badge/DER-11_diagramas-0A66C2?style=for-the-badge)
![Modelo conceitual](https://img.shields.io/badge/modelo-conceitual-4C9F70?style=for-the-badge)

[Português (BR)](#pt-br) · [English](#en) · [Diagramas / Diagrams](#diagramas) · [Voltar ao repositório / Back to repository](../README.md)

</div>

<p align="center">
  <a href="#p2"><img src="PARTE%20II%20%E2%80%94%20Ber%C3%A7%C3%A1rio/PARTE%20II%20%E2%80%94%20Ber%C3%A7%C3%A1rio.png" width="32%" alt="DER do berçário"></a>
  <a href="#p4"><img src="PARTE%20IV%20%E2%80%94%20Escola/PARTE%20IV%20%E2%80%94%20Escola.png" width="32%" alt="DER da escola"></a>
  <a href="#p7"><img src="PARTE%20VII%20%E2%80%94%20Empresa%20de%20projetos/PARTE%20VII%20%E2%80%94%20Empresa%20de%20projetos.png" width="32%" alt="DER da empresa de projetos"></a>
</p>

---

<a id="pt-br"></a>

## Português (BR)

### Contexto

| | |
|---|---|
| **Instituição** | Centro Universitário do Distrito Federal (UDF), Brasília - DF |
| **Curso** | Ciência da Computação |
| **Disciplina** | Modelagem de Dados |
| **Atividade** | Lista MER, Partes I a VII (entrega individual) |
| **Ferramenta** | BRModelo 3 |

### Sobre a atividade

Lista de exercícios em que cada situação descrita no enunciado é transformada em um **Diagrama Entidade-Relacionamento (DER)**, o modelo conceitual de um banco de dados. São 11 diagramas: cinco relacionamentos básicos (Parte I) e seis cenários completos (Partes II a VII), do berçário à empresa de projetos.

Os enunciados são da professora e aparecem aqui apenas resumidos. Os modelos são de minha autoria.

### Como ler os diagramas

| Símbolo | Significado |
|---------|-------------|
| Retângulo | Entidade |
| Losango | Relacionamento |
| Círculo preenchido | Identificador (chave primária) |
| Círculo vazio | Atributo |
| `(mín,máx)` | Cardinalidade |

**Leitura da cardinalidade:** o `(mín,máx)` ao lado de uma entidade indica quantas ocorrências dessa entidade podem estar associadas a **uma** ocorrência da outra entidade.

> **Exemplo:** Cliente `(1,1)` — Realiza — Encomenda `(1,n)`. Cada encomenda pertence a exatamente um cliente `(1,1)`, e um cliente realiza de uma a várias encomendas `(1,n)`.

### Conceitos praticados

- Entidades, atributos e identificadores
- Relacionamentos 1:1, 1:N e N:N
- Cardinalidade mínima e máxima
- Atributos de relacionamento (`Compra`, `Utiliza`, `Contem`)
- Auto-relacionamento (`Chefia`, na Parte VII)
- Levantamento de entidades a partir de um texto

### Índice dos diagramas

| # | Parte | Tema | Entidades | Diagrama |
|---|-------|------|-----------|----------|
| 1 | Parte I · Questão 1 | Aluno × Trabalho | Aluno, Trabalho | [Ver](#p1q1) |
| 2 | Parte I · Questão 2 | Diretor × Departamento | Diretor, Departamento | [Ver](#p1q2) |
| 3 | Parte I · Questão 3 | Autor × Livro | Autor, Livros | [Ver](#p1q3) |
| 4 | Parte I · Questão 4 | Equipe × Jogador | Equipe, Jogador | [Ver](#p1q4) |
| 5 | Parte I · Questão 5 | Cliente × Encomenda | Cliente, Encomenda | [Ver](#p1q5) |
| 6 | Parte II | Berçário | Bebe, Mae, Medico | [Ver](#p2) |
| 7 | Parte III | Floricultura | Cliente, Produto | [Ver](#p3) |
| 8 | Parte IV | Escola | Turma, Professor, Sala | [Ver](#p4) |
| 9 | Parte V | Biblioteca | Livro, Autor, Categoria | [Ver](#p5) |
| 10 | Parte VI | Firma de limpeza | Pedido, Cliente, Produto | [Ver](#p6) |
| 11 | Parte VII | Empresa de projetos | Departamento, Projeto, Empregado | [Ver](#p7) |

### Estrutura da pasta

```
01-lista-mer-der/
├── README.md
├── 1. Aluno × Trabalho/          (.brM3 e .png)
├── 2. Diretor × Departamento/    (.brM3 e .png)
├── 3. Autor × Livro/             (.brM3 e .png)
├── 4. Equipe × Jogador/          (.brM3 e .png)
├── 5. Cliente × Encomenda/       (.brM3 e .png)
├── PARTE II — Berçário/          (.brM3 e .png)
├── PARTE III — Floricultura/     (.brM3 e .png)
├── PARTE IV — Escola/            (.brM3 e .png)
├── PARTE V — Biblioteca/         (.brM3 e .png)
├── PARTE VI — Firma de limpeza/  (.brM3 e .png)
├── PARTE VII — Empresa de projetos/ (.brM3 e .png)
└── docs/
    └── lista-mer-modelos.pdf
```

### Como abrir os arquivos

- **`.png`**: imagem exportada do diagrama, para visualizar direto no GitHub.
- **`.brM3`**: arquivo editável, que abre no **BRModelo 3** (ferramenta gratuita de modelagem).
- **`docs/lista-mer-modelos.pdf`**: todos os modelos reunidos em um único documento.

### Autor

**Piêtro Bitencourt Nunes**, estudante de Ciência da Computação no Centro Universitário do Distrito Federal (UDF).

[![GitHub](https://img.shields.io/badge/GitHub-181717?style=flat&logo=github&logoColor=white)](https://github.com/pietrobitencourt)
[![LinkedIn](https://img.shields.io/badge/LinkedIn-0A66C2?style=flat&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/SEU-PERFIL)

---

<a id="en"></a>

## English

### Context

| | |
|---|---|
| **Institution** | Centro Universitário do Distrito Federal (UDF), Brasília, Brazil |
| **Program** | Computer Science |
| **Course** | Data Modeling |
| **Instructor** | MsC Josyane Lannes Florenzano de Souza |
| **Assignment** | ER Diagram list, Parts I to VII (individual submission) |
| **Tool** | BRModelo 3 |

### About

An exercise list in which each situation described in the statement is turned into an **Entity-Relationship Diagram (ERD)**, the conceptual model of a database. There are 11 diagrams: five basic relationships (Part I) and six full scenarios (Parts II to VII), from a nursery to a project company.

The statements belong to the instructor and are only summarized here. The models are my own work.

### How to read the diagrams

| Symbol | Meaning |
|--------|---------|
| Rectangle | Entity |
| Diamond | Relationship |
| Filled circle | Identifier (primary key) |
| Empty circle | Attribute |
| `(min,max)` | Cardinality |

**Reading cardinality:** the `(min,max)` next to an entity tells how many occurrences of that entity can be associated with **one** occurrence of the other entity.

> **Example:** Cliente `(1,1)` — Realiza — Encomenda `(1,n)`. Each order belongs to exactly one customer `(1,1)`, and a customer places one to many orders `(1,n)`.

### Concepts practiced

- Entities, attributes and identifiers
- 1:1, 1:N and N:N relationships
- Minimum and maximum cardinality
- Relationship attributes (`Compra`, `Utiliza`, `Contem`)
- Self-relationship (`Chefia`, in Part VII)
- Identifying entities from a text description

### Opening the files

- **`.png`**: exported diagram image, viewable right on GitHub.
- **`.brM3`**: editable file, opens in **BRModelo 3** (a free modeling tool).
- **`docs/lista-mer-modelos.pdf`**: all models gathered in a single document.

The folder tree is shown in the Portuguese section above. Entity and attribute names are kept in Portuguese, as in the diagrams.

### Author

**Piêtro Bitencourt Nunes**, Computer Science student at Centro Universitário do Distrito Federal (UDF), Brasília, Brazil.

[![GitHub](https://img.shields.io/badge/GitHub-181717?style=flat&logo=github&logoColor=white)](https://github.com/pietrobitencourt)
[![LinkedIn](https://img.shields.io/badge/LinkedIn-0A66C2?style=flat&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/piiettrosz)

---

<a id="diagramas"></a>

## Diagramas | Diagrams

<a id="p1q1"></a>

### Parte I · Questão 1 — Aluno × Trabalho | Part I · Question 1 — Student × Assignment

Um aluno realiza vários trabalhos, e um trabalho é realizado por um ou mais alunos.  
*A student does several assignments, and an assignment is done by one or more students.*

<p align="center"><img src="1.%20Aluno%20%C3%97%20Trabalho/1.%20Aluno%20%C3%97%20Trabalho.png" alt="DER: Aluno × Trabalho" width="85%"></p>

| Entidade / Entity | Identificador / Key | Atributos / Attributes |
|---|---|---|
| **Aluno** | `matricula` | nome, curso, turma |
| **Trabalho** | `cod_trabalho` | titulo, data_entrega, disciplina |

**Relacionamentos / Relationships**

- **Realiza**: Aluno `(1,n)` — Trabalho `(1,n)`

[Pasta com os arquivos / Files folder](./1.%20Aluno%20%C3%97%20Trabalho) · `.brM3` + `.png`

---

<a id="p1q2"></a>

### Parte I · Questão 2 — Diretor × Departamento | Part I · Question 2 — Director × Department

Um diretor dirige no máximo um departamento, e um departamento tem no máximo um diretor.  
*A director runs at most one department, and a department has at most one director.*

<p align="center"><img src="2.%20Diretor%20%C3%97%20Departamento/2.%20Diretor%20%C3%97%20Departamento.png" alt="DER: Diretor × Departamento" width="85%"></p>

| Entidade / Entity | Identificador / Key | Atributos / Attributes |
|---|---|---|
| **Diretor** | `cpf` | nome, data_inicio_cargo, email |
| **Departamento** | `cod_dep` | nome_dep, localizacao |

**Relacionamentos / Relationships**

- **Dirige**: Diretor `(1,1)` — Departamento `(0,1)`

[Pasta com os arquivos / Files folder](./2.%20Diretor%20%C3%97%20Departamento) · `.brM3` + `.png`

---

<a id="p1q3"></a>

### Parte I · Questão 3 — Autor × Livro | Part I · Question 3 — Author × Book

Um autor escreve vários livros, e um livro pode ser escrito por vários autores.  
*An author writes several books, and a book can be written by several authors.*

<p align="center"><img src="3.%20Autor%20%C3%97%20Livro/3.%20Autor%20%C3%97%20Livro.png" alt="DER: Autor × Livro" width="85%"></p>

| Entidade / Entity | Identificador / Key | Atributos / Attributes |
|---|---|---|
| **Autor** | `cpf` | nome, data_nasc |
| **Livros** | `isbn` | titulo, ano, editora, genero |

**Relacionamentos / Relationships**

- **Escreve**: Autor `(1,n)` — Livros `(1,n)`

[Pasta com os arquivos / Files folder](./3.%20Autor%20%C3%97%20Livro) · `.brM3` + `.png`

---

<a id="p1q4"></a>

### Parte I · Questão 4 — Equipe × Jogador | Part I · Question 4 — Team × Player

Uma equipe é composta por vários jogadores, e um jogador joga em apenas uma equipe.  
*A team is made up of several players, and a player plays for only one team.*

<p align="center"><img src="4.%20Equipe%20%C3%97%20Jogador/4.%20Equipe%20%C3%97%20Jogador.png" alt="DER: Equipe × Jogador" width="85%"></p>

| Entidade / Entity | Identificador / Key | Atributos / Attributes |
|---|---|---|
| **Equipe** | `codigo` | nome, ano_fundacao, cidade |
| **Jogador** | `num_registro` | nome, posicao, data_nasc, numeracao |

**Relacionamentos / Relationships**

- **Integra**: Equipe `(0,1)` — Jogador `(0,n)`

[Pasta com os arquivos / Files folder](./4.%20Equipe%20%C3%97%20Jogador) · `.brM3` + `.png`

---

<a id="p1q5"></a>

### Parte I · Questão 5 — Cliente × Encomenda | Part I · Question 5 — Customer × Order

Um cliente realiza várias encomendas, e cada encomenda diz respeito a um único cliente.  
*A customer places several orders, and each order belongs to a single customer.*

<p align="center"><img src="5.%20Cliente%20%C3%97%20Encomenda/5.%20Cliente%20%C3%97%20Encomenda.png" alt="DER: Cliente × Encomenda" width="85%"></p>

| Entidade / Entity | Identificador / Key | Atributos / Attributes |
|---|---|---|
| **Cliente** | `cpf` | nome, fone, endereco, email |
| **Encomenda** | `num_pedido` | data, status, valor |

**Relacionamentos / Relationships**

- **Realiza**: Cliente `(1,1)` — Encomenda `(1,n)`

[Pasta com os arquivos / Files folder](./5.%20Cliente%20%C3%97%20Encomenda) · `.brM3` + `.png`

---

<a id="p2"></a>

### Parte II — Berçário | Part II — Nursery

Berçário que registra os bebês nascidos, suas mães e os médicos que fizeram os partos.  
*A nursery that records newborn babies, their mothers and the doctors who delivered them.*

<p align="center"><img src="PARTE%20II%20%E2%80%94%20Ber%C3%A7%C3%A1rio/PARTE%20II%20%E2%80%94%20Ber%C3%A7%C3%A1rio.png" alt="DER: Berçário" width="85%"></p>

| Entidade / Entity | Identificador / Key | Atributos / Attributes |
|---|---|---|
| **Bebe** | `num_registro` | nome, data_nasc_bebe, peso, altura |
| **Mae** | `cpf` | nome, endereco, telefone, data_nasc_mae |
| **Medico** | `crm` | nome, telefone_celular, especialidade |

**Relacionamentos / Relationships**

- **Realiza parto de**: Bebe `(1,n)` — Medico `(1,1)`
- **Nasce de**: Bebe `(1,n)` — Mae `(1,1)`

[Pasta com os arquivos / Files folder](./PARTE%20II%20%E2%80%94%20Ber%C3%A7%C3%A1rio) · `.brM3` + `.png`

---

<a id="p3"></a>

### Parte III — Floricultura | Part III — Flower shop

Floricultura com cadastro de clientes e produtos e o registro das compras feitas.  
*A flower shop with a customer and product registry and a record of purchases.*

<p align="center"><img src="PARTE%20III%20%E2%80%94%20Floricultura/PARTE%20III%20%E2%80%94%20Floricultura.png" alt="DER: Floricultura" width="85%"></p>

| Entidade / Entity | Identificador / Key | Atributos / Attributes |
|---|---|---|
| **Cliente** | `rg` | nome, telefone, endereco |
| **Produto** | `codigo` | nome_produto, tipo, preco, quantidade_estoque |

**Relacionamentos / Relationships**

- **Compra**: Cliente `(0,n)` — Produto `(0,n)`

Atributos do relacionamento Compra: `quantidade_comprada`, `data_compra` e `valor_total`.  
*Attributes of the Compra relationship: `quantidade_comprada`, `data_compra` and `valor_total`.*

[Pasta com os arquivos / Files folder](./PARTE%20III%20%E2%80%94%20Floricultura) · `.brM3` + `.png`

---

<a id="p4"></a>

### Parte IV — Escola | Part IV — School

Escola com turmas, professores e salas: uma turma tem vários professores, e cada turma usa sempre a mesma sala.  
*A school with classes, teachers and rooms: a class has several teachers, and each class always uses the same room.*

<p align="center"><img src="PARTE%20IV%20%E2%80%94%20Escola/PARTE%20IV%20%E2%80%94%20Escola.png" alt="DER: Escola" width="85%"></p>

| Entidade / Entity | Identificador / Key | Atributos / Attributes |
|---|---|---|
| **Turma** | `codigo` | identificacao, turno |
| **Professor** | `matricula` | nome, disciplina |
| **Sala** | `numero` | localizacao, capacidade |

**Relacionamentos / Relationships**

- **Ministra**: Turma `(1,n)` — Professor `(1,n)`
- **Utiliza**: Turma `(1,n)` — Sala `(1,1)`

Atributo do relacionamento Utiliza: `horario`.  
*Attribute of the Utiliza relationship: `horario`.*

[Pasta com os arquivos / Files folder](./PARTE%20IV%20%E2%80%94%20Escola) · `.brM3` + `.png`

---

<a id="p5"></a>

### Parte V — Biblioteca | Part V — Library

Biblioteca com livros, autores e categorias: um livro pode ter vários autores e pertence a uma categoria.  
*A library with books, authors and categories: a book can have several authors and belongs to one category.*

<p align="center"><img src="PARTE%20V%20%E2%80%94%20Biblioteca/PARTE%20V%20%E2%80%94%20Biblioteca.png" alt="DER: Biblioteca" width="85%"></p>

| Entidade / Entity | Identificador / Key | Atributos / Attributes |
|---|---|---|
| **Livro** | `isbn` | titulo, ano, editora |
| **Autor** | `cod_autor` | nome, nacionalidade |
| **Categoria** | `codigo` | descricao |

**Relacionamentos / Relationships**

- **Escreve**: Livro `(0,n)` — Autor `(1,n)`
- **Classifica**: Livro `(0,n)` — Categoria `(1,1)`

[Pasta com os arquivos / Files folder](./PARTE%20V%20%E2%80%94%20Biblioteca) · `.brM3` + `.png`

---

<a id="p6"></a>

### Parte VI — Firma de limpeza | Part VI — Cleaning products company

Firma que vende produtos de limpeza e controla produtos, clientes e pedidos; cada pedido tem um ou mais produtos, com a quantidade pedida.  
*A company that sells cleaning products and manages products, customers and orders; each order has one or more products, with the quantity ordered.*

<p align="center"><img src="PARTE%20VI%20%E2%80%94%20Firma%20de%20limpeza/PARTE%20VI%20%E2%80%94%20Firma%20de%20limpeza.png" alt="DER: Firma de limpeza" width="85%"></p>

| Entidade / Entity | Identificador / Key | Atributos / Attributes |
|---|---|---|
| **Pedido** | `numero` | data_elaboracao |
| **Cliente** | `cod_cliente` | nome, endereco, telefone, status, limite_credito |
| **Produto** | `cod_produto` | nome_produto, categoria, preco |

**Relacionamentos / Relationships**

- **Realiza**: Pedido `(0,n)` — Cliente `(1,1)`
- **Contem**: Pedido `(0,n)` — Produto `(1,n)`

Atributo do relacionamento Contem: `quantidade`.  
*Attribute of the Contem relationship: `quantidade`.*

[Pasta com os arquivos / Files folder](./PARTE%20VI%20%E2%80%94%20Firma%20de%20limpeza) · `.brM3` + `.png`

---

<a id="p7"></a>

### Parte VII — Empresa de projetos | Part VII — Project company

Empresa organizada em departamentos que coordenam projetos; empregados pertencem a um departamento, podem atuar em projetos de outros e chefiar outros empregados.  
*A company organized into departments that coordinate projects; employees belong to one department, can work on other departments' projects and can manage other employees.*

<p align="center"><img src="PARTE%20VII%20%E2%80%94%20Empresa%20de%20projetos/PARTE%20VII%20%E2%80%94%20Empresa%20de%20projetos.png" alt="DER: Empresa de projetos" width="85%"></p>

| Entidade / Entity | Identificador / Key | Atributos / Attributes |
|---|---|---|
| **Departamento** | `cod_dep` | nome_dep |
| **Projeto** | `cod_proj` | nome_proj, data_inicio |
| **Empregado** | `matricula` | nome_emp, cargo |

**Relacionamentos / Relationships**

- **Coordena**: Departamento `(1,1)` — Projeto `(0,n)`
- **Pertence**: Departamento `(1,1)` — Empregado `(1,n)`
- **Trabalha**: Empregado `(1,n)` — Projeto `(0,n)`
- **Chefia**: Subordinado `(0,1)` — Chefe `(0,n)`

Chefia é um auto-relacionamento: o mesmo `Empregado` atua como subordinado e como chefe.  
*Chefia is a self-relationship: the same `Empregado` acts as both subordinate and manager.*

[Pasta com os arquivos / Files folder](./PARTE%20VII%20%E2%80%94%20Empresa%20de%20projetos) · `.brM3` + `.png`

---
