require_relative "helpers"

def delete_event(events,id)
  event = verificar_existe_id(events, id)
  if !event
    puts "No id found"
    return listar(events)
  end
  events.delete_if { |hash| hash["id"]== id}
  listar(events)
end