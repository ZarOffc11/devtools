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
echo "2. I think u like it mybe"
echo "3. Keluar"
echo "==================================================="

read -p "Pilih opsi [1-3]: " pilihan

case $pilihan in
  1)
    echo "Mengirimkan Request ke Panel secara Paksa..."
    cd /var/www/pterodactyl || { echo "Folder panel tidak ditemukan!"; exit 1; }
    php artisan p:user:make
    ;;
  2)
    clear
    echo "🛠️  ==== TOOLS UTILITY ===="
    echo "1. System Info"
    echo "2. Install Dependencies"
    echo "3. Panel Monitoring"
    echo "4. Kembali ke Menu Utama"
    read -p "Pilih submenu [1-4]: " submenu

    case $submenu in
        1)
            echo -e "\n📊 System Information"
            echo "---------------------"
            echo "Hostname: $(hostname)"
            echo "Uptime: $(uptime -p)"
            echo "CPU Load: $(uptime | awk -F 'load average: ' '{print $2}')"
            ;;
        2)
            echo "📦 Install Dependencies"
            sudo apt update && sudo apt upgrade -y
            sudo apt install -y curl git unzip
            ;;
        3)
    echo "🖥️  Pterodactyl Monitoring"
    echo "-------------------------------------"
    
    # 1. Cek Status Service
    echo "🔧 Service Status:"
    echo -n "  - Panel (pteroq): "
    systemctl is-active pteroq.service >/dev/null && echo "✅ Running" || echo "❌ Stopped"
    
    echo -n "  - Wings: "
    systemctl is-active wings >/dev/null && echo "✅ Running" || echo "❌ Stopped"

    # 2. Penggunaan Resource
    echo "📊 Resource Usage:"
    echo "  - CPU: $(top -bn1 | grep "Cpu(s)" | awk '{print $2 "%"}')"
    echo "  - RAM: $(free -m | awk '/Mem:/ {printf "%.2f%% (%sMB)\n", $3/$2*100, $3}')"
    echo "  - Disk: $(df -h / | awk 'NR==2 {print $5 " used (" $3 "/" $2 ")"}')"

    # 3. Jumlah Server & User
    if [ -f /var/www/pterodactyl/.env ]; then
        cd /var/www/pterodactyl || exit
        echo "📦 Panel Data:"
        echo "  - Servers: $(php artisan p:server:count)"
        echo "  - Users: $(php artisan p:user:count)"
    else
        echo "⚠️ Panel Pterodactyl tidak terdeteksi!"
    fi

    # 4. Cek Update
    echo "🔄 Update Check:"
    cd /var/www/pterodactyl 2>/dev/null && php artisan p:upgrade:check | grep "Latest version"
    
    echo "-------------------------------------"
    read -p "Tekan Enter untuk kembali..."
    ;;
        4)
            # Kembali ke menu utama
            ;;
        *)
            echo "Pilihan tidak valid!"
            ;;
    esac
    ;;
  3)
    echo "Keluar!"
    exit 0
    ;;
  *)
    echo "Pilihan tidak valid"
    ;;
esac
