json.usuarios @usuarios, partial: 'usuario/usuario', as: :usuario
json.total @usuarios.count()
