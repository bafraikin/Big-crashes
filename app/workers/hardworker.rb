class HardWorker
  include SideKiq::Worker
  def perform(a="coucou")
    puts "allo"
  end
end
