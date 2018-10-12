class Crash < ApplicationRecord 
  validates :identifier, uniqueness: true
  belongs_to :source, polymorphic: true, counter_cache: :nb_of_crash

  def self.sort_by_years
    crashs = Crash.order(:date).map { | crash | [crash.date, crash.localisation, crash.identifier, crash.source.name]}
    hash_years = {}
    crashs.each do |crash|
      hash_years[crash[0].strftime("%Y")] = [] if hash_years[crash[0].strftime("%Y")] == nil
      hash_years[crash[0].strftime("%Y")] << crash
    end
    hash_years
  end

  def add_descript(name, descript)
    self.body.gsub!("EOF", "<span title=\'#{descript.gsub('\'', '\\\\\'')}\'><b>#{name.gsub('\'', '\\\\\'')}</b></span> EOF")
  end

  def define
    self.update body: self.body + "<BR> EOF"
    Terme.all.each do |term|
      patern =/(?<=[^[:alpha:]])#{term.name}(?=[^[:alpha:]])/
      if patern.match(self.body)
        self.add_descript(term.name, term.description)
      end
    end
  end
end
