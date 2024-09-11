class Reserva
  def reservar
    print "Data de entrada: "
    entrada = gets.chomp
    print "Saída: "
    saida = gets.chomp
    print "Quantidade de pessoas: "
    quantidade = gets.chomp.to_i

    reservas = []

    require_relative 'cliente'
    cliente = Cliente.new

    contador = 0
    while contador < quantidade
      reservas << cliente.informacoes
      contador += 1
    end

    File.open("reservas.txt", "a") do |arquivo|
      reservas.each do |reserva|
        arquivo.puts "Data de entrada: #{entrada} | Data de Saída: #{saida} | Reserva: #{reserva}"
      end
    end
  end

  def ver_reservas
    if File.exist?("reservas.txt") && !File.zero?("reservas.txt")
      File.open("reservas.txt", "r") do |arquivo|
        arquivo.each_line do |linha|
          puts linha
        end
      end
    else
      puts "Arquivo inexistente ou vazio!"
    end
  end
end
