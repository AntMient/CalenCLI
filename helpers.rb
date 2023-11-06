def welcome
  print "\n#{'-'.yellow * 29}#{'Welcome to'.yellow} #{'CalenCLI'.blue}#{'-'.blue * 30}\n\n"
  
end

def menu
  puts "\n#{'-'.yellow * 78}"
  puts "#{'list | create | show | update | delete | next | prev |'.yellow} #{'exit'.blue}\n\n"
end

def verificar_existe_id(events, id)
  verificar_id = events.any? {|event| event["id"]==id}
  if verificar_id 
    evento_existente = events.find { |event| event["id"] == id }
    return evento_existente
  end
end