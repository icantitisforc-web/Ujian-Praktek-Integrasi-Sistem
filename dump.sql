-- A. Tabel jenis_dana
CREATE TABLE jenis_dana (
  id              INT          NOT NULL AUTO_INCREMENT,
  kode_jenis_dana VARCHAR(5)   NOT NULL,
  nama_jenis_dana VARCHAR(50)  NOT NULL,
  keterangan      VARCHAR(150) NULL,
  PRIMARY KEY (kode_jenis_dana),
  UNIQUE KEY uq_id_jenis (id)
) ENGINE=InnoDB;

-- B. Tabel donatur
CREATE TABLE donatur (
  id             INT          NOT NULL AUTO_INCREMENT,
  kode_donatur   VARCHAR(10)  NOT NULL,
  nama_donatur   VARCHAR(100) NOT NULL,
  jenis_donatur  ENUM('Perorangan','Lembaga') NOT NULL DEFAULT 'Perorangan',
  no_hp          VARCHAR(20)  NULL,
  email          VARCHAR(100) NULL,
  alamat         VARCHAR(200) NULL,
  tanggal_daftar DATE         NOT NULL,
  PRIMARY KEY (kode_donatur),
  UNIQUE KEY uq_id_donatur (id)
) ENGINE=InnoDB;

-- C. Tabel petugas
CREATE TABLE petugas (
  id           INT          NOT NULL AUTO_INCREMENT,
  kode_petugas VARCHAR(10)  NOT NULL,
  nama_petugas VARCHAR(100) NOT NULL,
  jabatan      ENUM('Admin Counter','Fundraiser','Koordinator') NOT NULL DEFAULT 'Fundraiser',
  no_hp        VARCHAR(20)  NULL,
  PRIMARY KEY (kode_petugas),
  UNIQUE KEY uq_id_petugas (id)
) ENGINE=InnoDB;

-- D. Tabel penerimaan_dana
CREATE TABLE penerimaan_dana (
  id              INT           NOT NULL AUTO_INCREMENT,
  kode_penerima   VARCHAR(15)   NOT NULL,
  no_bukti        VARCHAR(20)   NOT NULL,
  kode_donatur    VARCHAR(10)   NOT NULL,
  kode_jenis_dana VARCHAR(5)    NOT NULL,
  tanggal_terima  DATE          NOT NULL,
  jumlah          DECIMAL(15,2) NOT NULL,
  metode_bayar    ENUM('Tunai','Transfer','QRIS') NOT NULL DEFAULT 'Tunai',
  keterangan      VARCHAR(150)  NULL,
  kode_petugas    VARCHAR(10)   NOT NULL,
  PRIMARY KEY (kode_penerima),
  UNIQUE KEY uq_id_penerimaan (id),
  UNIQUE KEY uq_no_bukti (no_bukti),
  CONSTRAINT fk_terima_donatur FOREIGN KEY (kode_donatur)
    REFERENCES donatur (kode_donatur) ON UPDATE CASCADE,
  CONSTRAINT fk_terima_jenis FOREIGN KEY (kode_jenis_dana)
    REFERENCES jenis_dana (kode_jenis_dana) ON UPDATE CASCADE,
  CONSTRAINT fk_terima_petugas FOREIGN KEY (kode_petugas)
    REFERENCES petugas (kode_petugas) ON UPDATE CASCADE
) ENGINE=InnoDB;

-- ---------- 2. DML (Isi Data Awal) ----------

INSERT INTO jenis_dana (kode_jenis_dana, nama_jenis_dana, keterangan) VALUES
('ZKT', 'Zakat', 'Dana zakat (maal/penghasilan/fitrah)'),
('INF', 'Infaq', 'Dana infaq'),
('SDQ', 'Sedekah', 'Dana sedekah');

INSERT INTO donatur (kode_donatur, nama_donatur, jenis_donatur, no_hp, email, alamat, tanggal_daftar) VALUES
('DNT-001', 'Ahmad Fauzi', 'Perorangan', '081234567801', 'ahmad.fauzi@mail.com', 'Purwokerto Utara', '2026-01-10'),
('DNT-002', 'Siti Nurhaliza', 'Perorangan', '081234567802', 'siti.nur@mail.com', 'Purwokerto Selatan', '2026-02-15'),
('DNT-003', 'PT Berkah Sejahtera', 'Lembaga', '0281555123', 'csr@berkahsejahtera.co.id', 'Purwokerto Timur', '2026-03-01'),
('DNT-004', 'Dewi Lestari', 'Perorangan', '081234567804', 'dewi.lestari@mail.com', 'Sokaraja', '2026-04-20'),
('DNT-005', 'Rahmat Hidayat', 'Perorangan', '081234567805', 'rahmat.h@mail.com', 'Baturraden', '2026-05-05');

INSERT INTO petugas (kode_petugas, nama_petugas, jabatan, no_hp) VALUES
('PTG-001', 'Budi Santoso', 'Koordinator', '081311223301'),
('PTG-002', 'Rina Kartika', 'Admin Counter', '081311223302'),
('PTG-003', 'Dimas Pratama', 'Fundraiser', '081311223303');

INSERT INTO penerimaan_dana (kode_penerima, no_bukti, kode_donatur, kode_jenis_dana, tanggal_terima, jumlah, metode_bayar, keterangan, kode_petugas) VALUES
('PNR-001', 'TRM-2026-001', 'DNT-001', 'ZKT', '2026-10-01', 2500000.00, 'Transfer', 'Zakat penghasilan', 'PTG-002'),
('PNR-002', 'TRM-2026-002', 'DNT-002', 'INF', '2026-10-02', 1000000.00, 'QRIS', 'Infaq bulanan', 'PTG-002'),
('PNR-003', 'TRM-2026-003', 'DNT-003', 'SDQ', '2026-10-03', 500000.00, 'Transfer', 'Sedekah CSR', 'PTG-001'),
('PNR-004', 'TRM-2026-004', 'DNT-004', 'ZKT', '2026-10-05', 5000000.00, 'Transfer', 'Zakat maal', 'PTG-003'),
('PNR-005', 'TRM-2026-005', 'DNT-005', 'INF', '2026-10-06', 750000.00, 'Tunai', 'Infaq pembangunan', 'PTG-003'),
('PNR-006', 'TRM-2026-006', 'DNT-001', 'SDQ', '2026-10-08', 300000.00, 'QRIS', 'Sedekah Jumat', 'PTG-002');