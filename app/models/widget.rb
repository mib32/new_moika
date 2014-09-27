class Widget

  # ;D
  def self.all
    %W(
      обычный
      акция
      #{"скидка 10%"}
      #{"скидка 15%"}
      шиномонтаж
      кафе
      автозаправка
      автосервис
      магазин
      )
  end

  def self.each &block
    all.each &block
  end
end

