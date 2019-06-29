#json.array!(@usuarios) do |usuario|
#  json.extract! usuario, :id, :nombre,:rut,:telefono,:direccion,:password,:password_confirmation
#  json.url usuario_url(usuario, format: :json)
#end

json.results @usuarios do |usuario|
  json.id usuario.id
  json.text usuario.nombre
  json.text usuario.rut
  json.id usuario.telefono
  json.text usuario.direccion
  json.text usuario.password
  json.text usuario.password_confirmation

end

json.more false