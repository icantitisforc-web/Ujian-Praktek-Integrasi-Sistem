# Menggunakan base image MariaDB versi stabil
FROM mariadb:10.11

# Menetapkan zona waktu ke Asia/Jakarta (WIB)
# Sangat penting agar timestamp pencatatan transaksi ZIS di database akurat
ENV TZ=Asia/Jakarta

# Mengonfigurasi sistem operasi di dalam container untuk menggunakan zona waktu tersebut
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone