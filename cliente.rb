require 'net/http'
require 'json'

class Cliente
  def informacoes
    puts "Endereço"
    print "CEP: "
    @cep = gets.chomp
    cliente = Cliente.new
    cliente.buscar_endereco(@cep)
    
    print "Número: "
    numero = gets.chomp
    print "Telefone: "
    telefone = gets.chomp

    print "Nome: "
    nome = gets.chomp
    print "CPF: "
    cpf = gets.chomp

    require_relative 'quarto'
    quarto = Quarto.new
    quarto = quarto.quarto

    File.open("clientes.txt", "a") do |arquivo|
      arquivo.puts "Nome: #{nome} | Endereço: #{rua}, #{@numero} - #{bairro} - #{cidade} - #{estado} | Telefone: #{telefone} | Quarto: #{quarto}"
    end
    
    if quarto
      clientes = {
        nome: nome,
        endereco: "#{rua}, #{numero} - #{bairro} - #{cidade} - #{estado}",
        telefone: telefone,
        quarto: quarto
      }
      
      return clientes
    else
      puts "Sem informações para atribuir!"
      return nil
    end
  end

  def buscar_endereco(cep)
    uri = URI("https://viacep.com.br/ws/#{cep}/json/")
    response = Net::HTTP.get(uri)
    address = JSON.parse(response, symbolize_names: true)
  
    if address[:erro]
      puts "CEP não encontrado."
    else
      logradouro = address[:logradouro]
      bairro = address[:bairro]
      localidade = address[:localidade]
      uf = address[:uf]
      cep = address[:cep]
  
      # Verifica se alguma informação está faltando
      if logradouro.nil? || logradouro.empty?
        print "Logradouro: "
        logradouro = gets.chomp
      else
        puts "Endereço: #{logradouro}"
      end
  
      if bairro.nil? || bairro.empty?
        print "Bairro: "
        bairro = gets.chomp
      else
        puts "Bairro: #{bairro}"
      end
  
      if localidade.nil? || localidade.empty?
        print "Cidade: "
        localidade = gets.chomp
      else
        puts "Cidade: #{localidade}"
      end
  
      if uf.nil? || uf.empty?
        print "Estado: "
        uf = gets.chomp
      else
        puts "Estado: #{uf}"
      end
  
      if cep.nil? || cep.empty?
        puts "CEP não disponível."
      else
        puts "CEP: #{cep}"
      end
    end
  end

  def ver_clientes

    if File.exist?("clientes.txt") && !File.zero?("clientes.txt")
      File.open("clientes.txt") do |arquivo|
        arquivo.each_line do |linha|
          puts linha
        end
      end
    else
      puts "Arquivo inexistente ou vazio!"
    end
  end
end

cliente = Cliente.new
cliente.informacoes
