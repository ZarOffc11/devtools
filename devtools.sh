#!/bin/bash

clear

# ASCII art menggunakan heredoc untuk menghindari masalah escape
cat << "EOF"
______         _____           _     
|  _  \       |_   _|         | |    
| | | |_____   _| | ___   ___ | |___ 
| | | / _ \ \ / / |/ _ \ / _ \| / __|
| |/ /  __/\ V /| | (_) | (_) | \__ \
|___/ \___| \_/ \_/\___/ \___/|_|___/
EOF

echo
echo "==================== DevTools ===================="
echo "1. Buat User Panel Pterodactyl"
echo "2. Under Construction"
echo "3. Keluar"
echo "==================================================="

read -p "Pilih opsi [1-3]: " pilihan

case $pilihan in
  1)
    echo "Membuat user via artisan..."
    cd /var/www/pterodactyl || { echo "Folder panel tidak ditemukan!"; exit 1; }
    php artisan p:user:make
    ;;
  2)
    echo "Fitur dalam pengembangan..."
    ;;
  3)
    echo "Keluar!"
    exit 0
    ;;
  *)
    echo "Pilihan tidak valid"
    ;;
esac
