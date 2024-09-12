require 'net/http'
require 'json'
require 'cpf_cnpj'

class Cliente
  def informacoes
    @endereco = []
    print "Nome Completo: "
    nome = gets.chomp
    
    puts "Endereço"
    print "CEP: "
    @cep = gets.chomp
    
    buscar_endereco(@cep)
    
    print "Telefone: "
    telefone = gets.chomp
    
    print "CPF: "
    @cpf = gets.chomp
    consulta_cpf(@cpf)
    
    require_relative 'quarto'
    quarto = Quarto.new.quarto
    
  
    endereco_formatado = @endereco.map do |e|
      "#{e[:rua]}, #{e[:numero]} - #{e[:bairro]} - #{e[:cidade]} - #{e[:estado]} - #{e[:cep]}"
    end.join(", ")
    
    File.open("clientes.txt", "a") do |arquivo|
      arquivo.puts "Nome: #{nome} | CPF: #{@cpf_valido || 'Inválido'} | Endereço: #{endereco_formatado} | Telefone: #{telefone} | Quarto: #{quarto}"
    end
    
    if quarto
      clientes = {
        nome: nome,
        endereco: endereco_formatado,
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
    @endereco = []
    uri = URI("https://viacep.com.br/ws/#{cep}/json/")
    response = Net::HTTP.get(uri)
    address = JSON.parse(response, symbolize_names: true)
  
    if address[:erro]
      puts "CEP não encontrado."
    else
      logradouro = address[:logradouro]
      numero = address[:numero]
      bairro = address[:bairro]
      localidade = address[:localidade]
      uf = address[:uf]
      cep = address[:cep]
  
      if logradouro.nil? || logradouro.empty?
        print "Logradouro: "
        logradouro = gets.chomp
      else
        puts "Endereço: #{logradouro}"
      end

      if numero.nil? || numero.empty?
        print "Número: "
        numero = gets.chomp
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
      @endereco << {rua: logradouro, numero: numero, bairro: bairro, cidade: localidade, estado: uf, cep: cep}
      return @endereco
    end
  end

  def consulta_cpf(cpf)
    if CPF.valid?(cpf, strict: true)
      cpf = CPF.new(cpf)
      cpf_formatdado = cpf.formatted
      puts "O CPF: #{cpf_formatdado} é válido!"
      @cpf_valido = cpf_formatdado
    else
      cpf = CPF.new(cpf)
      cpf_formatdado = cpf.formatted
      puts "O CPF: #{cpf_formatdado} é inválido!"
    end
    return @cpf_valido
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
