📚 LivraTech
Projeto desenvolvido com o objetivo de simular o controle e a organização de uma livraria, permitindo o gerenciamento de livros, autores e outras informações relevantes de forma estruturada.

---

🎯 Objetivo do Projeto
O **LivraTech** foi criado como um projeto prático para aplicar conceitos de programação e banco de dados, auxiliando no aprendizado e na organização de informações de uma livraria.

---

🛠️ Tecnologias Utilizadas
- **Python**
- **SQL**
- **Banco de Dados Relacional**
- **Git e GitHub**

---

⚙️ Funcionalidades
- Cadastro de livros  
- Consulta de informações no banco de dados  
- Organização e controle de dados da livraria  
- Integração entre Python e SQL  

---

📂 Estrutura do Projeto
- O banco de dados é estruturado em tabelas normalizadas (clientes, autores, livros, compras, itens_compra), com uso de Primary Kay, Foreign Key e restrições de integridade referencial.
- As consultas SQL utilizam JOINs, funções agregadas (SUM, COUNT), GROUP BY e ORDER BY para geração de relatórios analíticos, como total gasto por cliente, gêneros mais vendidos e autores mais procurados.
- A aplicação em Python atua como camada de integração, realizando operações CRUD, coletando entradas do usuário via terminal e executando comandos SQL por meio da biblioteca mysql-connector-python.

---

▶️Como Executar o Projeto LivraTech
1.Instale o Python. Certifique-se de ter o Python instalado na máquina (versão 3.10 ou superior).
2.Instale o MySQL. Tenha o MySQL Server e o MySQL Workbench instalados e em execução.
3.Clone o repositório.
4.Crie o banco de dados. Execute o script SQL do projeto no MySQL para criar o banco e as tabelas.
5.Instale a dependência (pip install mysql-connector-python)
6.Configure a conexão. No arquivo Python, ajuste usuário, senha e nome do banco de dados MySQL.
7.Execute o projeto (python main.py). O sistema será executado no terminal, permitindo cadastrar dados e realizar consultas no banco de dados.

👩‍💻 Autora
Ana Clara
GitHub: aanaclarinha

📌 Observações
Este projeto tem fins educacionais e está em constante evolução conforme o aprendizado e desenvolvimento de novas funcionalidades.
