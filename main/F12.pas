unit F12;
interface
    uses bentukan;
	procedure lihatStatistik(var arrsimulasi:tabsimulasi;jmlhaksi:jumlahAksi;nosim:integer);
	{ 
	I.S.: arrsimulasi, jmlhaksi, nosim terdefinisi
	F.S.: menampilkan statistik simulasi (minimum menampilkan apa yang ada dalam data simulasi yang bersangkutan }
implementation
	procedure lihatStatistik(var arrsimulasi:tabsimulasi;jmlhaksi:jumlahAksi;nosim:integer);
	{ALGORITMA}
	begin
		writeln('nomor simulasi: ', arrsimulasi.tab[nosim].no);
		writeln('tanggal awal simulasi: ', arrsimulasi.tab[nosim].tgl.day, '/', arrsimulasi.tab[nosim].tgl.month, '/', arrsimulasi.tab[nosim].tgl.year);
		writeln('jumlah hari hidup: ', arrsimulasi.tab[nosim].hari);
		writeln('jumlah energi yang dimiliki: ', arrsimulasi.tab[nosim].energi);
		writeln('jumlah aksi makan dalam 1 hari: ', jmlhaksi.makan);
		writeln('jumlah aksi istirahat dalam 1 hari: ', jmlhaksi.istirahat);
		writeln('jumlah maksimum inventori: ', arrsimulasi.tab[nosim].maks);
		writeln('total bahan mentah yang dibeli: ', arrsimulasi.tab[nosim].nMentahB);
		writeln('total bahan olahan yang dibeli: ', arrsimulasi.tab[nosim].nOlahanB);
		writeln('total bahan olahan yang dijual: ', arrsimulasi.tab[nosim].nOlahanJ);
		writeln('total resep yang dijual: ', arrsimulasi.tab[nosim].nResepJ);
		writeln('jumlah pemasukan: ', arrsimulasi.tab[nosim].msk);
		writeln('jumlah pengeluaran: ', arrsimulasi.tab[nosim].klr);
		writeln('total uang: ', arrsimulasi.tab[nosim].uang);
	end;
end.
