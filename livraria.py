import mysql.connector
#conectar banco de dados
conexao = mysql.connector.connect(
    host="localhost",
    user="root",
    password="acashgr",
    database="banco_livraria"
)

cursor = conexao.cursor()
#inserir cliente
def cadastrar_clientes():
    nome = input("Digite o nome do cliente:")
    email = input("Digite o email do cliente:")

    sql = "insert into clientes (nome, email) values (%s, %s)"
    valores = (nome, email)
    cursor.execute(sql, valores)
    conexao.commit()
    print("Cliente cadastrado com sucesso!")

#cadastrar livro 
def cadastrar_livro():
    titulo = input("Digite o título do livro: ")
    nome_autor = input("Digite o nome do autor: ")
    genero = input("Digite o gênero do livro: ")
    preco = float(input("Digite o preço do livro: "))

    # 1) Verificar se o autor já existe
    sql_verificar = "SELECT id_autor FROM autores WHERE nome_autor = %s"
    cursor.execute(sql_verificar, (nome_autor,))
    resultado = cursor.fetchone()

    if resultado:
        id_autor = resultado[0]   # autor existe
    else:
        # 2) Se não existir, cadastrar o autor
        sql_autor = "INSERT INTO autores (nome_autor) VALUES (%s)"
        cursor.execute(sql_autor, (nome_autor,))
        conexao.commit()
        id_autor = cursor.lastrowid
        print(f"Autor '{nome_autor}' cadastrado com ID {id_autor}.")

    # 3) Cadastrar o livro usando id_autor
    sql_livro = "INSERT INTO livro (titulo, id_autor, genero, preco) values (%s, %s, %s, %s)"
    valores = (titulo, id_autor, genero, preco)
    cursor.execute(sql_livro, valores)
    conexao.commit()

    print(f"Livro '{titulo}' cadastrado com sucesso!")

#cadastrar compra
def cadastrar_compra():
    id_cliente = int(input("Digite o ID do cliente:"))
    cursor.execute("insert into compra (id_cliente) values (%s)", (id_cliente,))
    conexao.commit()
    id_compra = cursor.lastrowid
    print(f"Compra registrada com ID: {id_compra}")

    while True:
        id_livro = int(input("Digite o ID do livro a ser adicionado (0 para sair)"))
        if id_livro == 0:
            break

        quantidade = int(input("Digite a quantidade:"))

        sql = "INSERT INTO itens_compra (id_compra, id_livro, quantidade) VALUES (%s, %s, %s)"
        valores = (id_compra, id_livro, quantidade)
        cursor.execute(sql,valores)
        conexao.commit()
        print("Livro adicionado a compra com sucesso!")

# total gasto por cliente 
def total_gasto():
    query = """
    select c.nome, sum(l.preco * ic.quantidade) as total
    from clientes c
    join compra co on c.id_cliente = co.id_cliente
    join itens_compra ic on co.id_compra = ic.id_compra
    join livro l on ic.id_livro = l.id_livro
    group by c.nome 
    order by total desc;
    """
    
    cursor.execute(query)
    resultados = cursor.fetchall()

    print("Total gasto por cliente:")
    for nome, total in resultados:
        print(f"- {nome} = R${total:.2f}")
    print()


# genero mais vendido 
def genero_mais_vendido():
    query = """
    select l.genero, sum(ic.quantidade) as total
    from livro l
    join itens_compra ic on l.id_livro = ic.id_livro
    group by l.genero 
    order by total desc;
    """

    cursor.execute(query)
    resultados = cursor.fetchall()

    print("Gêneros mais vendidos:")
    for genero, total in resultados:
        print(f" - {genero}: {total} livros vendidos")
    print()


# autor mais vendido
def autor_mais_vendido():
    query = """
    select a.nome_autor, sum(ic.quantidade) as total
    from autores a 
    join livro l on a.id_autor = l.id_autor
    join itens_compra ic on l.id_livro = ic.id_livro
    group by a.nome_autor
    order by total desc
    limit 1;
    """

    cursor.execute(query)
    resultado = cursor.fetchone()

    print(f"Autor mais vendido: {resultado[0]} ({resultado[1]} livros vendidos)")


#menu principal
def menu():
    while True:
        print("===LivraTech===")
        print("1.Cadastrar Cliente")
        print("2.Cadastrar Livro")
        print("3.Registrar Compra")
        print("4.Total gasto por cliente")
        print("5.Gênero mais vendido")
        print("6.Autor mais vendido")
        print("0. Sair")

        opcao = input("Escolha uma opção:")
        if opcao == '1':
            cadastrar_clientes()
        elif opcao == '2':
            cadastrar_livro()
        elif opcao == '3':
            cadastrar_compra()
        elif opcao == '4':
            total_gasto()
        elif opcao == '5':
            genero_mais_vendido()
        elif opcao == '6':
            autor_mais_vendido()
        elif opcao == '0':
            print("Saindo...")
            break
        else:
            print("Opção iválida! Tente novamente.")

#executa o programa
if __name__=="__main__":
    menu()
    cursor.close()
    conexao.close()




    







