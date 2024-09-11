## Sistema de Gerenciamento de Clientes e Reservas

Este projeto é um sistema simples para gerenciar clientes e reservas de quartos. Ele é dividido em três classes principais: Cliente, Quarto e, eventualmente, Reserva.

### Funcionalidades

## Cliente

A classe *Cliente* é responsável por gerenciar as informações dos clientes e armazená-las em um arquivo de texto. As funcionalidades incluem:

  - **Informações do Cliente**: Coleta informações do cliente, incluindo nome, endereço (rua, número, bairro, cidade, estado) e telefone.
  - **Registro de Quarto**: Permite a seleção e o registro de um quarto para o cliente.
  - **Visualização de Clientes**: Exibe as informações de todos os clientes registrados no arquivo *clientes.txt*.

### Quarto

A classe *Quarto* gerencia os quartos disponíveis, permitindo a seleção e o registro de um quarto específico. As funcionalidades incluem:

    **Seleção de Quarto**: Permite escolher o tipo de quarto (*simples, duplo, triplo*) e o número do quarto.
    **Registro de Quarto**: Marca o quarto selecionado como ocupado e retorna as informações do quarto.

### Reserva (Em Desenvolvimento)

A classe *Reserva* será adicionada futuramente para gerenciar reservas, incluindo funcionalidades adicionais como o controle de disponibilidade de quartos e a criação de reservas para os clientes.
### Requisitos

  - Ruby 2.7 ou superior.

### Instalação

Para executar a aplicação, siga os passos abaixo:

1. Clone este repositório:
```
bash

git clone https://github.com/SeuUsuario/SeuRepositorio.git
```

2. Navegue até o diretório do projeto:

```
bash

cd SeuRepositorio
```

3. Certifique-se de que você tem Ruby instalado. Você pode verificar com:

```
bash

ruby -v
```
### Uso

Para usar o sistema, execute o script principal cliente.rb:

```
bash

ruby cliente.rb
```

O script irá:

   1. Solicitar as informações do cliente.
   2. Pedir para selecionar um tipo de quarto e número do quarto.
   3. Armazenar as informações no arquivo *clientes.txt*.
   4. Exibir o conteúdo do arquivo *clientes.txt*.

### Estrutura de Arquivos

   - *cliente.rb*: Script principal que gerencia clientes e reserva de quartos.
   - *quarto.rb*: Contém a classe Quarto para gerenciamento dos quartos.
   - *clientes.txt*: Arquivo onde as informações dos clientes são armazenadas.

### Exemplos

Quando o script é executado, ele solicita informações do cliente e o tipo de quarto. Aqui está um exemplo da entrada e saída:
### Entrada

```
text

Nome: John Doe
Endereço
Rua: Main St
Número: 123
Bairro: Downtown
Cidade: Metropolis
Estado: NY
Telefone: (555) 123-4567
Tipo de quarto
1 - Simples | 2 - Duplo | 3 Triplo
Opção: 1
Número do quarto: 101
```

### Saída no clientes.txt

```
text

Nome: John Doe | Endereço: Main St, 123 - Downtown - Metropolis - NY | Telefone: (555) 123-4567 | Quarto: 101 simples
```

### Contribuição

Se você quiser contribuir para o projeto, faça um fork do repositório e envie um pull request com suas alterações. Para maiores informações, consulte o guia de contribuição.
### Licença

Este projeto está licenciado sob a Licença MIT. Veja o arquivo LICENSE para mais detalhes.
