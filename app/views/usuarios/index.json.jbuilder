json.usuarios @usuarios, partial: 'usuarios/usuario', as: :usuario
json.total @usuarios.count()
