class Cliente
  def informacoes
    print "Nome: "
    @nome = gets.chomp
    puts "Endereço"
    print "Rua: "
    @rua = gets.chomp.capitalize
    print "Número: "
    @numero = gets.chomp
    print "Bairro: "
    @bairro = gets.chomp.capitalize
    print "Cidade: "
    @cidade = gets.chomp.capitalize
    print "Estado: "
    @estado = gets.chomp.upcase
    print "Telefone: "
    @telefone = gets.chomp.capitalize

    require_relative 'quarto'
    quarto = Quarto.new
    @quarto = quarto.quarto
    
    if @quarto
      @clientes = {
        nome: @nome,
        endereco: "#{@rua}, #{@numero} - #{@bairro} - #{@cidade} - #{@estado}",
        telefone: @telefone,
        quarto: @quarto
      }
    else
      puts "Sem informações para atribuir!"
    end

  end

  
end

cliente = Cliente.new
cliente.informacoes
