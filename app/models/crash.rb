class Crash < ApplicationRecord 
  validates :identifier, uniqueness: true
  belongs_to :source, polymorphic: true, counter_cache: :nb_of_crash

  def self.sort
    bool = false
    Crash.all.each do |inst|
      Word.all.map {|inst_word| inst_word.name}.each do |forb|
        bool = true if inst.name.include?(forb)
      end
      bool ? (inst.update correct: false) : (inst.update correct: true)
    end
  end

  def add_descript(name, descript)
    self.body.gsub!(name, "<span title='#{descript}'><b>#{name}</b></span>")
  end

  def define
    Terme.all.each do |term|
      patern =/[^[:alpha:]]#{term.name}[^[:alpha:]]/
      if patern.match(self.body)
        self.add_descript(term.name, term.description)
      end
    end
  end
end
