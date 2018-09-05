class Crash < ApplicationRecord 
  belongs_to :hebdo

  def self.sort
    bool = false
    Crash.all.each do |inst|
      Word.all.map {|inst_word| inst_word.name}.each do |forb|
        bool = true if inst.name.include?(forb)
      end
      bool ? (inst.update correct: false) : (inst.update correct: true)
    end
  end
end
