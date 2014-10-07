class Widget
  attr_reader :name, :type, :offset, :dim, :ox, :oy, :dx, :dy
  # ;D
  def self.all
    dim = {x:47,y:57}
      [
      new(name: 'Автомойка', type: :normal, clip_rect: {offset: {x:103,y:0}, dim: dim}),
      new(name: 'Автосервис', type: :repair, clip_rect: {offset: {x:51,y:0}, dim: dim}),
      new(name: 'Видео-трансляция', type: :live, clip_rect: {offset: {x:262,y:66}, dim: dim}),
      new(name: 'Скидка 10%', type: :discount_10, clip_rect: {offset: {x:207,y:0}, dim: dim}),
      new(name: 'Скидка 15%', type: :discount_15, clip_rect: {offset: {x:207,y:66}, dim: dim}),
      new(name: 'Шиномонтаж', type: :tire_svc, clip_rect: {offset: {x:154,y:0}, dim: dim}),
      new(name: 'Автозаправка', type: :gasoline, clip_rect: {offset: {x:0,y:0}, dim: dim}),
      new(name: 'Магазин', type: :store, clip_rect: {offset: {x:0,y:66}, dim: dim}),
      new(name: 'Кафе', type: :cafe, clip_rect: {offset: {x:51,y:66}, dim: dim}),
      new(name: 'Предложение', type: :proposal, clip_rect: {offset: {x:154,y:66}, dim: dim}),
    ]
      # repair
      # discount_10
      # discount_15
      # tire_svc
      # gasoline
      # кафе
      # магазин
  end

  def self.each &block
    all.each &block
  end

  def initialize opts
    @name = opts[:name]
    @type = opts[:type]
    @offset = opts[:clip_rect][:offset]
    @dim = opts[:clip_rect][:dim]
    @ox = @offset[:x]
    @oy = @offset[:y]
    @dx = @dim[:x]
    @dy = @dim[:y]
  end

  def clip_rect
    "#{oy}px #{ox+dx}px #{oy+dy}px #{ox}px"
  end

  def background_position
    "-#{ox}px -#{oy}px"
  end

  def js_image_size
    zoom = 1.1
    "[#{dx*zoom},#{dy*zoom}]"
  end

  def js_clip_rect
    "[[#{ox}, #{oy}],[#{ox+dx}, #{oy+dy}]]"
  end
end

