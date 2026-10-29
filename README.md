<div align="center">

# Database Modeling

**Atividades da disciplina de Modelagem de Dados**
**Coursework from the Data Modeling class**

![BRModelo](https://img.shields.io/badge/BRModelo-DER-1F6FEB?style=for-the-badge)
![ER Diagrams](https://img.shields.io/badge/Diagramas_ER-conceitual-4C9F70?style=for-the-badge)
![MySQL](https://img.shields.io/badge/MySQL-4479A1?style=for-the-badge&logo=mysql&logoColor=white)
![MySQL Workbench](https://img.shields.io/badge/MySQL_Workbench-00758F?style=for-the-badge&logo=mysql&logoColor=white)

![License](https://img.shields.io/badge/license-MIT-green)
![Last commit](https://img.shields.io/github/last-commit/pietrobitencourt/database-modeling)
![Repo size](https://img.shields.io/github/repo-size/pietrobitencourt/database-modeling)

[Português (BR)](#pt-br) · [English](#en)

</div>

<p align="center">
  <a href="./01-lista-mer-der"><img src="01-lista-mer-der/PARTE%20II%20%E2%80%94%20Ber%C3%A7%C3%A1rio/PARTE%20II%20%E2%80%94%20Ber%C3%A7%C3%A1rio.png" width="32%" alt="DER do berçário"></a>
  <a href="./01-lista-mer-der"><img src="01-lista-mer-der/PARTE%20IV%20%E2%80%94%20Escola/PARTE%20IV%20%E2%80%94%20Escola.png" width="32%" alt="DER da escola"></a>
  <a href="./01-lista-mer-der"><img src="01-lista-mer-der/PARTE%20VII%20%E2%80%94%20Empresa%20de%20projetos/PARTE%20VII%20%E2%80%94%20Empresa%20de%20projetos.png" width="32%" alt="DER da empresa de projetos"></a>
</p>

---

<a id="pt-br"></a>

## Português (BR)

### Sobre o repositório

Este repositório reúne as atividades práticas que desenvolvo na disciplina de **Modelagem de Dados**, individualmente ou em grupo. Cada atividade fica em uma pasta própria, numerada na ordem em que foi feita, com seu próprio README.

O objetivo é documentar minha evolução na modelagem de bancos de dados, do modelo conceitual (DER) à implementação em MySQL, dos scripts DDL à manipulação e consulta de dados com DML. O repositório continua crescendo: novas atividades entram em pastas numeradas (`04-...`, `05-...`) conforme a disciplina avança.

### Contexto acadêmico

| | |
|---|---|
| **Instituição** | Centro Universitário do Distrito Federal (UDF), Brasília - DF |
| **Curso** | Ciência da Computação |
| **Disciplina** | Modelagem de Dados |
| **Professora** | MsC Josyane Lannes Florenzano de Souza |

### Atividades

| # | Atividade | Descrição | Ferramenta | Pasta |
|---|-----------|-----------|------------|-------|
| 01 | **Lista MER** | 11 diagramas entidade-relacionamento, de relacionamentos básicos a cenários completos (berçário, floricultura, escola, biblioteca, firma de limpeza e empresa de projetos). | BRModelo 3 | [Abrir pasta](./01-lista-mer-der) |
| 02 | **Sistema de Reserva de Carros (DDL)** | Banco de dados da locadora ACDN Rental Car, a partir do artigo da SQL Magazine nº 74: 5 tabelas e 7 chaves estrangeiras, apenas comandos DDL, com correção dos erros do código original. | MySQL, MySQL Workbench | [Abrir pasta](./02-reserva-carros-ddl) |
| 03 | **Sistema Fórmula 1 (DML)** | Trabalho em grupo: banco `db_formula1` com 5 tabelas, população com no mínimo 10 registros por tabela e 12 queries (`JOIN`, subconsultas, funções de agregação, `ALTER TABLE` e `UPDATE`). Inclui relatório em PDF. | MySQL, MySQL Workbench | [Abrir pasta](./03-dml-formula1) |

**Em breve:** novas atividades, na mesma estrutura de pastas numeradas.

### O que as atividades praticam

**01 · Lista MER**

- Identificação de entidades, atributos e identificadores a partir de um texto
- Relacionamentos 1:1, 1:N e N:N, com cardinalidade mínima e máxima
- Atributos de relacionamento e auto-relacionamento
- Entrega em dois formatos: arquivo editável (`.brM3`) e imagem (`.png`)

**02 · Sistema de Reserva de Carros (DDL)**

- Do modelo lógico ao modelo físico: tradução de um diagrama de classes UML para tabelas MySQL
- Comandos DDL: `CREATE DATABASE`, `CREATE TABLE` e `ALTER TABLE ... ADD CONSTRAINT`
- Chaves primárias e estrangeiras, tipos de dados (`DECIMAL`, `INT UNSIGNED`, `DATE`) e restrições (`NOT NULL`, `UNIQUE`)
- Análise e correção de código com erros publicado em uma revista técnica
- Validação com `SHOW TABLES`, `DESCRIBE` e `SHOW CREATE TABLE`

**03 · Sistema Fórmula 1 (DML)**

- Criação do database e das tabelas na ordem das dependências, com chaves estrangeiras e chave primária composta
- Comandos DML: `INSERT` e `UPDATE`, além de `ALTER TABLE ... ADD COLUMN` para incluir um atributo
- Consultas com `JOIN`, subconsultas com `IN`, `LIKE`, `BETWEEN`, `DISTINCT`, `ORDER BY` e alias
- Funções de agregação com `GROUP BY` (`COUNT` e `AVG`) e `UNION ALL`
- Trabalho em equipe, com script versionado no GitHub e relatório em PDF

### Estrutura do repositório

```
database-modeling/
├── README.md
├── LICENSE
├── 01-lista-mer-der/
│   ├── README.md
│   ├── 11 pastas, uma por diagrama (.brM3 e .png)
│   └── docs/
│       └── lista-mer-modelos.pdf
├── 02-reserva-carros-ddl/
│   ├── README.md
│   ├── acdn_rental_car.sql
│   └── docs/
│       └── screenshots/
└── 03-dml-formula1/
    ├── README.md
    ├── db_formula1.sql
    └── docs/
        ├── Trabalho_DML_Formula1_Grupo.pdf
        └── screenshots/
```

### Como usar

Os arquivos `.png` podem ser vistos direto no GitHub. Os arquivos `.brM3` são os modelos editáveis e abrem no **BRModelo 3**, uma ferramenta gratuita de modelagem. A convenção usada para ler a cardinalidade está explicada no [README da atividade 01](./01-lista-mer-der#pt-br).

O script da atividade 02 roda em qualquer cliente MySQL (MySQL Workbench ou terminal). As instruções de execução e validação estão no [README da atividade 02](./02-reserva-carros-ddl).

O script da atividade 03 (`db_formula1.sql`) também roda no MySQL Workbench e recria o banco do zero a cada execução. As instruções e os resultados de cada query estão no [README da atividade 03](./03-dml-formula1).

### Observações

- Os enunciados das listas são da professora e aparecem apenas resumidos. Os modelos e os scripts das atividades 01 e 02 são de minha autoria.
- A atividade 03 foi feita em grupo, e os integrantes estão listados no README da atividade. Os dados dela são didáticos, e os salários são fictícios.
- A atividade 02 é baseada no artigo "Modelando um Sistema de Reserva de Carros" (SQL Magazine, edição 74). O código implementado corrige os erros do original, como detalhado no README da atividade.
- A licença MIT cobre o conteúdo deste repositório.

### Autor

**Piêtro Bitencourt Nunes**, estudante de Ciência da Computação no Centro Universitário do Distrito Federal (UDF), Brasília - DF.

[![GitHub](https://img.shields.io/badge/GitHub-181717?style=flat&logo=github&logoColor=white)](https://github.com/pietrobitencourt)
[![LinkedIn](https://img.shields.io/badge/LinkedIn-0A66C2?style=flat&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/piiettrosz)

### Licença

Distribuído sob a licença MIT. Veja o arquivo [LICENSE](./LICENSE) para mais detalhes.

---

<a id="en"></a>

## English

### About

This repository collects the hands-on assignments I build in my **Data Modeling** class, individually or in a group. Each assignment lives in its own numbered folder, in the order it was completed, with its own README.

The goal is to document my progress in database modeling, from the conceptual model (ERD) to the implementation in MySQL, from DDL scripts to data manipulation and querying with DML. The repository keeps growing: new assignments are added in numbered folders (`04-...`, `05-...`) as the class moves forward.

### Academic context

| | |
|---|---|
| **Institution** | Centro Universitário do Distrito Federal (UDF), Brasília, Brazil |
| **Program** | Computer Science |
| **Course** | Data Modeling |
| **Instructor** | MsC Josyane Lannes Florenzano de Souza |

### Assignments

| # | Assignment | Description | Tool | Folder |
|---|------------|-------------|------|--------|
| 01 | **ER Diagram list** | 11 entity-relationship diagrams, from basic relationships to full scenarios (nursery, flower shop, school, library, cleaning products company and project company). | BRModelo 3 | [Open folder](./01-lista-mer-der) |
| 02 | **Car Reservation System (DDL)** | Database of the ACDN Rental Car company, based on the SQL Magazine article no. 74: 5 tables and 7 foreign keys, DDL statements only, fixing the errors in the original code. | MySQL, MySQL Workbench | [Open folder](./02-reserva-carros-ddl) |
| 03 | **Formula 1 System (DML)** | Group assignment: `db_formula1` database with 5 tables, populated with at least 10 records per table, and 12 queries (`JOIN`, subqueries, aggregate functions, `ALTER TABLE` and `UPDATE`). Includes a PDF report. | MySQL, MySQL Workbench | [Open folder](./03-dml-formula1) |

**Coming soon:** new assignments, in the same numbered folder structure.

### What the assignments practice

**01 · ER Diagram list**

- Identifying entities, attributes and identifiers from a text description
- 1:1, 1:N and N:N relationships, with minimum and maximum cardinality
- Relationship attributes and self-relationships
- Delivered in two formats: editable file (`.brM3`) and image (`.png`)

**02 · Car Reservation System (DDL)**

- From logical to physical model: translating a UML class diagram into MySQL tables
- DDL statements: `CREATE DATABASE`, `CREATE TABLE` and `ALTER TABLE ... ADD CONSTRAINT`
- Primary and foreign keys, data types (`DECIMAL`, `INT UNSIGNED`, `DATE`) and constraints (`NOT NULL`, `UNIQUE`)
- Analyzing and fixing faulty code published in a technical magazine
- Validation with `SHOW TABLES`, `DESCRIBE` and `SHOW CREATE TABLE`

**03 · Formula 1 System (DML)**

- Creating the database and tables in dependency order, with foreign keys and a composite primary key
- DML statements: `INSERT` and `UPDATE`, plus `ALTER TABLE ... ADD COLUMN` to add an attribute
- Queries with `JOIN`, subqueries with `IN`, `LIKE`, `BETWEEN`, `DISTINCT`, `ORDER BY` and aliases
- Aggregate functions with `GROUP BY` (`COUNT` and `AVG`) and `UNION ALL`
- Teamwork, with the script versioned on GitHub and a PDF report

### Repository structure

See the tree in the Portuguese section above.

### Usage

The `.png` files can be viewed right on GitHub. The `.brM3` files are the editable models and open in **BRModelo 3**, a free modeling tool. The convention used to read cardinality is explained in the [assignment 01 README](./01-lista-mer-der#en).

The assignment 02 script runs on any MySQL client (MySQL Workbench or command line). Run and validation instructions are in the [assignment 02 README](./02-reserva-carros-ddl#english).

The assignment 03 script (`db_formula1.sql`) also runs on MySQL Workbench and recreates the database from scratch on every run. Instructions and the result of each query are in the [assignment 03 README](./03-dml-formula1).

### Notes

- The exercise statements belong to the instructor and are only summarized here. The models and scripts of assignments 01 and 02 are my own work.
- Assignment 03 was done as a group, and its members are listed in the assignment's README. Its data is for educational purposes, and the salaries are fictional.
- Assignment 02 is based on the article "Modelando um Sistema de Reserva de Carros" (SQL Magazine, issue 74). The implemented code fixes the errors of the original, as detailed in the assignment's README.
- The MIT license covers the content of this repository.

### Author

**Piêtro Bitencourt Nunes**, Computer Science student at Centro Universitário do Distrito Federal (UDF), Brasília, Brazil.

[![GitHub](https://img.shields.io/badge/GitHub-181717?style=flat&logo=github&logoColor=white)](https://github.com/pietrobitencourt)
[![LinkedIn](https://img.shields.io/badge/LinkedIn-0A66C2?style=flat&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/piiettrosz)

### License

Distributed under the MIT License. See [LICENSE](./LICENSE) for more information.
