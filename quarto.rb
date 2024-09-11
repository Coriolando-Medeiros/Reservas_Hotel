class Quarto
  def initialize
    @quartos = ['disponível', 'disponível', 'disponível']
    @tipos_quarto = {1 => 'simples', 2 => 'duplo', 3 => 'triplo'}
  end
  def quarto
    puts "Tipo de quarto"
    puts "1 - Simples | 2 - Duplo | 3 Triplo"
    print "Opção: "
    @tipo_quarto = gets.chomp.to_i
    print "Número do quarto: "
    @numero_quarto = gets.chomp.to_i

    if @tipo_quarto .between?(1, 3)
      index = @tipo_quarto - 1
      @quartos[index] = 'ocupado'
      puts "Quarto #{@numero_quarto} #{@tipos_quarto[@tipo_quarto]} está ocupado"
      return "#{@numero_quarto} ##{@tipos_quarto[@tipo_quarto]}"
    else
      puts "Opção inválida!"
      return nil
    end

  end
end

