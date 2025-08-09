#!/bin/bash

clear  # Bersihkan terminal

# ASCII art DevTools
echo "______         _____           _     "
echo "|  _  \       |_   _|         | |    "
echo "| | | |_____   _| | ___   ___ | |___ "
echo "| | | / _ \ \ / / |/ _ \ / _ \| / __|"
echo "| |/ /  __/\ V /| | (_) | (_) | \__ \"
echo "|___/ \___| \_/ \_/\___/ \___/|_|___/"
echo 
echo "==================== DevTools ===================="
echo "1. Buat User Panel Pterodactyl"
echo "2. Under Construction"
echo "3. Keluar"
echo "==================================================="

while true; do
    read -p "Pilih opsi [1-3]: " pilihan

    case $pilihan in
        1)
            echo "Membuat user via artisan..."
            cd /var/www/pterodactyl 2>/dev/null || {
                echo "❌ Error: Folder panel Pterodactyl tidak ditemukan di /var/www/pterodactyl!"
                exit 1
            }
            php artisan p:user:make
            exit 0
            ;;
        2)
            echo "Fitur dalam pengembangan..."
            ;;
        3)
            echo "Keluar..."
            exit 0
            ;;
        *)
            echo "❌ Pilihan tidak valid. Coba lagi."
            ;;
    esac
done
