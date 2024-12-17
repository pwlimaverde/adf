#!/bin/bash

# Diretórios dos pacotes
packages=(
  "apps\client_android_cuidapet"
  "modules\auth"
  "modules\core"
  "modules\dependencies"
  "modules\design_system"
  "modules\home"
  "modules\initial_loading"
  "modules\services"
)

# Percorre cada pacote e executa 'flutter pub get'
for package in "${packages[@]}"
do
  echo "Executando 'flutter pub get' em $package"
  cd "$package"
  flutter pub get
  cd ..
  cd ..
done

echo "Todos os pacotes foram atualizados!"

