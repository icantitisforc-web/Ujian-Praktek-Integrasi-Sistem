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