class Book < ApplicationRecord
  #belongs_to :author

  validates :title, presence: {message: 'Judul harus diisi'}
  validates :description, length: {minimum: 10, message: 'minimal harus 10 karakter'}
  validates :page, numericality: {greater_than: 10, message: 'minmal jumlah halaman adalah 10'}
  # validates :description, exclusion: {in: ['good', 'bad', 'enough']}
  # validates :title, format: {with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i }
  # validates :title, uniqueness: {case_sensitive: false}
  # validate :custom_validation
  # validates :price, numericality: {greater_than_or_equal_to: 150000}, if: Proc.new {|b| b.page >= 300}

  # def page_more_than_300
  #   page >= 300
  # end

  # def custom_validation
  #   if page >= 300
  #     if price < 150000
  #       errors.add(:price, 'harga minimal 150rb jika halaman kurang dari 300')
  #     end
  #   end
  # end

  def self.expensive
    where('price > 250000')
  end

  def self.price_equal_more(price)
    where('price >= ?', price)
  end
end
