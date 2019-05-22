class Rubric < ApplicationRecord
  has_many :crites, dependent: :destroy

  accepts_nested_attributes_for :crites

  validates :rubric_code, presence: true

  def display_name
    "Rubric #{rubric_code}"
  end

  def total_weight
    weight = 0
    crites.each do |crite|
      weight = weight + crite.weight
    end
    weight
  end

  def list_crites(index_list)
    puts "crites #{crites.inspect}"
    crites.select {|criteria| index_list.include?(criteria.index)}
  end
end