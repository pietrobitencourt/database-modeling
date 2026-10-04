<div align="center">

# Database Modeling

**Atividades da disciplina de Modelagem de Dados**
**Coursework from the Data Modeling class**

![BRModelo](https://img.shields.io/badge/BRModelo-DER-1F6FEB?style=for-the-badge)
![ER Diagrams](https://img.shields.io/badge/Diagramas_ER-conceitual-4C9F70?style=for-the-badge)

<!--
Descomente os badges abaixo conforme as tecnologias forem sendo usadas:
![MySQL](https://img.shields.io/badge/MySQL-4479A1?style=for-the-badge&logo=mysql&logoColor=white)
![MySQL Workbench](https://img.shields.io/badge/MySQL_Workbench-00758F?style=for-the-badge&logo=mysql&logoColor=white)
-->

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

Este repositório reúne as atividades práticas que desenvolvo na disciplina de **Modelagem de Dados**. Cada atividade fica em uma pasta própria, numerada na ordem em que foi feita, com seu próprio README.

O objetivo é documentar minha evolução na modelagem de bancos de dados, do modelo conceitual (DER) às próximas etapas, que incluem scripts em MySQL. O repositório continua crescendo: novas atividades entram em pastas numeradas (`02-...`, `03-...`) conforme a disciplina avança.

### Contexto acadêmico

| | |
|---|---|
| **Instituição** | Centro Universitário do Distrito Federal (UDF), Brasília - DF |
| **Curso** | Ciência da Computação |
| **Disciplina** | Modelagem de Dados |

### Atividades

| # | Atividade | Descrição | Ferramenta | Pasta |
|---|-----------|-----------|------------|-------|
| 01 | **Lista MER** | 11 diagramas entidade-relacionamento, de relacionamentos básicos a cenários completos (berçário, floricultura, escola, biblioteca, firma de limpeza e empresa de projetos). | BRModelo 3 | [Abrir pasta](./01-lista-mer-der) |

**Em breve:** atividades com scripts em MySQL, na mesma estrutura de pastas numeradas.

### O que a atividade 01 pratica

- Identificação de entidades, atributos e identificadores a partir de um texto
- Relacionamentos 1:1, 1:N e N:N, com cardinalidade mínima e máxima
- Atributos de relacionamento e auto-relacionamento
- Entrega em dois formatos: arquivo editável (`.brM3`) e imagem (`.png`)

### Estrutura do repositório

```
database-modeling/
├── README.md
├── LICENSE
└── 01-lista-mer-der/
    ├── README.md
    ├── 11 pastas, uma por diagrama (.brM3 e .png)
    └── docs/
        └── lista-mer-modelos.pdf
```

### Como usar

Os arquivos `.png` podem ser vistos direto no GitHub. Os arquivos `.brM3` são os modelos editáveis e abrem no **BRModelo 3**, uma ferramenta gratuita de modelagem. A convenção usada para ler a cardinalidade está explicada no [README da atividade 01](./01-lista-mer-der#pt-br).

### Observações

- Os enunciados das listas são da professora e aparecem apenas resumidos. Os modelos são de minha autoria.
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

This repository collects the hands-on assignments I build in my **Data Modeling** class. Each assignment lives in its own numbered folder, in the order it was completed, with its own README.

The goal is to document my progress in database modeling, from the conceptual model (ERD) to the next steps, which include MySQL scripts. The repository keeps growing: new assignments are added in numbered folders (`02-...`, `03-...`) as the class moves forward.

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

**Coming soon:** assignments with MySQL scripts, in the same numbered folder structure.

### What assignment 01 practices

- Identifying entities, attributes and identifiers from a text description
- 1:1, 1:N and N:N relationships, with minimum and maximum cardinality
- Relationship attributes and self-relationships
- Delivered in two formats: editable file (`.brM3`) and image (`.png`)

### Repository structure

See the tree in the Portuguese section above.

### Usage

The `.png` files can be viewed right on GitHub. The `.brM3` files are the editable models and open in **BRModelo 3**, a free modeling tool. The convention used to read cardinality is explained in the [assignment 01 README](./01-lista-mer-der#en).

### Notes

- The exercise statements belong to the instructor and are only summarized here. The models are my own work.
- The MIT license covers the content of this repository.

### Author

**Piêtro Bitencourt Nunes**, Computer Science student at Centro Universitário do Distrito Federal (UDF), Brasília, Brazil.

[![GitHub](https://img.shields.io/badge/GitHub-181717?style=flat&logo=github&logoColor=white)](https://github.com/pietrobitencourt)
[![LinkedIn](https://img.shields.io/badge/LinkedIn-0A66C2?style=flat&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/piiettrosz)

### License

Distributed under the MIT License. See [LICENSE](./LICENSE) for more information.
