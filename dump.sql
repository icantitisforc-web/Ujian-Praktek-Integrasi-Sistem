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