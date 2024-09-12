puts "Bem-vindo!"
puts "Sistema de reservas"
puts ""

loop do
  puts "     Menu"
  puts ""
  puts "1 - Fazer reserva"
  puts "2 - Ver reservas"
  puts "3 - Ver clientes"
  puts "0 - Sair"
  puts ""
  print "Opção: "
  opcao = gets.chomp.to_i

  if opcao == 1
    require_relative 'reserva'
    reserva = Reserva.new
    reserva.reservar
  elsif opcao == 2
    require_relative 'reserva'
    reserva = Reserva.new
    reserva.ver_reservas
  elsif opcao == 3
    require_relative 'cliente'
    reserva = Cliente.new
    reserva.ver_clientes
  elsif opcao == 0
    puts "Saindo..."
    return
  else
    puts "Opção inválida! tente novamente"
  end
end