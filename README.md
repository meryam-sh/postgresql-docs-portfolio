# PostgreSQL Documentation Portfolio

A hands-on **technical writing and docs-as-code learning portfolio** focused on PostgreSQL, SQL, Linux, GitHub, and documentation quality.

**Author:** Meryam Shakoor  
**Status:** Work in progress — learning samples, not production deployment guidance.

## Documentation samples

| Guide | What it demonstrates |
| --- | --- |
| [PostgreSQL fundamentals](docs/postgresql-fundamentals.md) | Audience-focused introduction, SQL examples, expected results |
| [Roles and permissions](docs/roles-and-permissions.md) | Security concepts, least privilege, warnings |
| [Storage and query performance](docs/storage-and-retrieval.md) | Plain-language explanation of indexing, query plans, and MVCC |
| [Linux and PostgreSQL troubleshooting](docs/linux-postgresql-troubleshooting.md) | Troubleshooting procedure, prerequisites, safe commands |
| [Docs-as-code workflow](docs/docs-as-code-workflow.md) | Markdown, branches, pull requests, reviews, and CI |

## Practice materials

- [SQL practice script](examples/customer-queries.sql) — sample schema and queries for an isolated PostgreSQL 17 practice database.
- [Contributing guide](CONTRIBUTING.md) — editorial and review standards for this repository.
- [GitHub Actions documentation check](.github/workflows/docs-check.yml) — checks that the portfolio files exist and contain headings.

## Approach

Each guide identifies its audience, prerequisites, commands, explanations, and safety considerations. The writing samples are intended to demonstrate how I structure technical information and learn to verify it with official sources and subject-matter experts.

**Transparency:** The repository was developed as a learning project with AI assistance. Examples are labeled as illustrative until run and checked in a practice environment. I am not presenting this as production PostgreSQL administration experience.

## Reference documentation

- [PostgreSQL 17 manual](https://www.postgresql.org/docs/17/)
- [GitHub documentation](https://docs.github.com/)
