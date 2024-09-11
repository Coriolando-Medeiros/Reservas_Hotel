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
      File.open("clientes.txt", "a") do |arquivo|
        arquivo.puts "Nome: #{@nome} | Endereço: #{@rua}, #{@numero} - #{@bairro} - #{@cidade} - #{@estado} | Telefone: #{@telefone} | Quarto: #{@quarto}"
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
cliente.ver_clientes