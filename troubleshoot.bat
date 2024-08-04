@echo off
title Aplikasi Troubleshoot Jaringan by Ismail Puji Saputra

:menu
cls
echo ================================================================
echo 8888888888888888888888888888888888888888888888888888888888888888
echo 88                                                             88
echo 88          Aplikasi Troubleshoot Jaringan Windows PC V1       88
echo 88                                                             88
echo 88          by Ismail Puji Saputra                             88
echo 88          Tahun Pembuatan: 02 Juni 2024                      88
echo 88                                                             88
echo 8888888888888888888888888888888888888888888888888888888888888888
echo ================================================================
echo.
echo Pilih opsi:
echo.
echo 1. Cek Koneksi (Ping ke google.com)
echo 2. Cek IP
echo 3. Cek Kecepatan Jaringan
echo 4. Flush DNS
echo 5. Route Print
echo 6. Release dan Renew IP
echo 7. Singkronisasi Waktu
echo 8. Keluar
echo.
COLOR 02
set /p choice=Masukkan pilihan Anda (1-8): 

if %choice%==1 goto ping
if %choice%==2 goto ipconfig
if %choice%==3 goto speedtest
if %choice%==4 goto flushdns
if %choice%==5 goto routeprint
if %choice%==6 goto releaserenewip
if %choice%==7 goto sinkwaktu
if %choice%==8 goto exit
echo Pilihan tidak valid, silakan coba lagi.
pause
goto menu

:ping
cls
echo ================================
echo  Cek Koneksi (Ping ke google.com)
echo ================================
ping google.com
pause
goto menu

:ipconfig
cls
echo ================================
echo  Cek IP
echo ================================
ipconfig
pause
goto menu

:speedtest
cls
echo ================================
echo  Cek Kecepatan Jaringan
echo ================================
echo Mengunduh Speedtest CLI...
bitsadmin /transfer "speedtest" https://install.speedtest.net/app/cli/ookla-speedtest-1.1.1-win64.zip "%cd%\speedtest.zip"
tar -xf speedtest.zip
echo Menjalankan Speedtest...
speedtest.exe
pause
goto menu

:flushdns
cls
echo ================================
echo  Flush DNS
echo ================================
ipconfig /flushdns
pause
goto menu

:releaserenewip
cls
echo ================================
echo Release IP
echo ================================
ipconfig /release
pause
echo Melakukan renew IP...
ipconfig /renew
pause
goto menu

:routeprint
cls
echo ================================
echo Route Print
echo ================================
route print
pause
goto menu

:sinkwaktu
cls
echo ================================
echo  Sinkronisasi Waktu dengan Internet
echo ================================
echo Menyinkronkan waktu...
w32tm /resync
if %errorlevel%==0 (
    echo Waktu berhasil disinkronkan.
) else (
    echo Gagal menyinkronkan waktu.
)
pause
goto menu 

:exit
cls
echo Terima kasih telah menggunakan aplikasi ini.
pause
exit
