unit bentukan;

interface

const
	NMax = 100; //disesuaikan sama maks inventori
	
type 
	date = record
		day		: integer;
		month	: integer;
		year	: integer;
	end;
	
	//daftar bahan mentah
	mentah = record
		nama	: string; //nama bahan mentah
		harga	: longint; //harga satuan
		exp		: integer; //tanggal kadaluwarsa
	end;
	
	tabMentah = record
		tab 	: array [1..NMax] of mentah;
		neff 	: integer;
	end;
	
	
	//daftar bahan olahan
	olah = record
		nama	: string; //nama bahan olahan
		harga	: longint; //harga jual
		n		: integer; //banyaknya bahan olahan
		bahan	: array [1..NMax] of string; //daftar nama bahan olahan
	end;
	
	tabOlah = record
		tab 	: array [1..NMax] of olah;
		neff 	: integer;	
	end;
	
	
	//daftar inventori bahan mentah
	iMentah = record
		nama	: string; //nama bahan mentah
		tgl		: date; //tanggal pembelian
		jml		: integer; //banyaknya bahan mentah
	end;
	
	tabiMentah = record
		tab 	: array [1..10000] of iMentah;
		neff 	: integer;
	end;
	
	
	//daftar inventori bahan olahan
	iOlah = record
		nama	: string; //nama bahan olahan
		tgl		: date; //tanggal pembelian
		jml		: integer; //banyaknya bahan olahan
	end;
	
	tabiOlah = record
		tab 	: array [1..1000] of iOlah;
		neff 	: integer;
	end;
	
	
	//daftar resep
	resep = record
		nama	: string; //nama resep
		harga	: longint; //harga jual
		n		: integer; //banyaknya bahan penyusun
		bahan	: array [1..20] of string; //daftar nama bahan penyusun
	end;
	
	tabresep = record
		tab 	: array [1..NMax] of resep;
		neff 	: integer;
	end;
	
	//simulasi
	simulasi = record
		no			: integer; //nomor simulasi
		tgl			: date; //tanggal awal simulasi
		hari		: integer; //jumlah hari hidup
		energi		: integer; //jumlah energi yang dimiliki pengguna
		maks		: integer; //jumlah maksimum inventori
		nMentahB	: integer; //total bahan mentah dibeli
		nOlahanB	: integer; //total bahan olahan dibuat
		nOlahanJ	: integer; //total bahan olahan dijual
		nResepJ		: integer; //total resep dijual
		msk			: longint; //jumlah pemasukan
		klr			: longint; //jumlah pengeluaran
		uang		: longint; //total uang
	end;
	
	tabsimulasi = record
		tab : array [1..10] of simulasi;
	end;
	
	//Jumlah Aksi Makan dan Istirahat
	jumlahAksi = record
		makan		: integer; //Jumlah Aksi Makan dalam 1 Hari
		istirahat	: integer; //Jumlah Aksi istirahat dalam 1 Hari
	end;
	
	//Tab Inventori Gabungan
	inv = record
		nama	: string; //nama bahan
		jenis	: string; //jenis bahan
		tgl		: date; //tanggal pembelian
		jml		: integer; //banyaknya bahan
	end;
	
	tabIn = record
		tab 	: array [1..10000] of inv;
		neff 	: integer;
	end;
	
implementation 

end.
	
