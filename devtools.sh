#!/bin/bash

# ASCII art DevTools

echo "______         _____           _     "
echo "|  _  \       |_   _|         | |    "
echo "| | | |_____   _| | ___   ___ | |___ "
echo "| | | / _ \ \ / / |/ _ \ / _ \| / __|"
echo "| |/ /  __/\ V /| | (_) | (_) | \__ \"
echo "|___/ \___| \_/ \_/\___/ \___/|_|___/"
echo 
echo "==================== DevTools ===================="
echo "1. Create User (Panel Pterodactyl) "
echo "2. Under Construction"
echo "3. Exit"
echo "==================================================="
read -p "Choose an option [1-3]: " pilihan

case $pilihan in
  1)
    echo "Running create user via artisan..."
    # Ganti path ini sesuai folder instalasi Pterodactyl kamu
    cd /var/www/pterodactyl || { echo "Folder panel tidak ditemukan!"; exit 1; }
    
    # Jalankan command artisan p:user:make
    php artisan p:user:make
    
    ;;
  2)
    echo "You chose Other Option"
    # Isi sendiri ya
    ;;
  3)
    echo "Bye!"
    exit 0
    ;;
  *)
    echo "Invalid option"
    ;;
esac
