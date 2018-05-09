Unit F2;

interface

uses bentukan;
	procedure exit (var tMentah : tabMentah; var tOlah : tabOlah; var tiMentah : tabiMentah; var tiOlah : tabiOlah; var tresep : tabresep;
					var tsimulasi : tabsimulasi);
	{I.S.: semua data pada simulasi sudah terupdate sesuai yang dimainkan namun belum disimpan di file eksternal}
	{F.S.: menyimpan data terbaru dari hasil permainan simulasi ke file eksternal }				
Implementation
	procedure exit (var tMentah : tabMentah; var tOlah : tabOlah; var tiMentah : tabiMentah; var tiOlah : tabiOlah; var tresep : tabresep;
					var tsimulasi : tabsimulasi);
	{KAMUS}									
	var
		inf : text; //untuk membaca file eksternal
		i,j : integer; //untuk looping
		temp,temp2 : string; //untuk menyimpan sementara saat mengubah integer ke string
	{ALGORITMA}
begin
		assign(inf,'BahanMentah.txt'); //menyimpan bahan mentah sesuai simulasi yang dimainkan
		rewrite(inf);
		for i:=1 to tMentah.Neff do
			begin
				writeln(inf, tMentah.tab[i].nama);
				str(tMentah.tab[i].harga,temp);
				writeln(inf, temp);
				str(tMentah.tab[i].exp,temp);
				writeln(inf,temp);
				if (i <> tmentah.neff) then
					writeln(inf,'');
			end;
		close(inf);

		assign(inf,'BahanOlahan.txt'); //menyimpan bahan olahan sesuai simulasi yang dimainkan
		rewrite(inf);
		for i:=1 to tolah.Neff do
			begin
				writeln(inf, tOlah.tab[i].nama);
				str(tOlah.tab[i].harga,temp);
				writeln(inf,temp);
				str(tOlah.tab[i].n,temp);
				writeln(inf,temp);
				for j:=1 to tOlah.tab[i].n do
				begin
					writeln(inf, tOlah.tab[i].bahan[j]);
				end;
				if (i <> tOlah.neff) then
					writeln(inf,'');
			end;
		close(inf);

		assign(inf,'InvBahanMentah.txt'); //menyimpan inventori bahan mentah sesuai simulasi yang dimainkan
		rewrite(inf);
		for i:=1 to tiMentah.Neff do
			begin
				writeln(inf,tiMentah.tab[i].nama);
				str(tiMentah.tab[i].tgl.day,temp);
				temp2:=temp+'/';
				str(tiMentah.tab[i].tgl.month,temp);
				temp2:=temp2+temp+'/';
				str(tiMentah.tab[i].tgl.year,temp);
				temp2:=temp2+temp;
				writeln(inf,temp2);
				str(tiMentah.tab[i].jml,temp);
				writeln(inf,temp);
				if (i <> tiMentah.neff) then
					writeln(inf,'');
			end;
		close(inf);

		assign(inf,'InvBahanOlahan.txt'); //menyimpan inventori bahan olahan sesuai simulasi yang dimainkan
		rewrite(inf);
		for i:=1 to tiOlah.Neff do
			begin
				writeln(inf, tiOlah.tab[i].nama);
				str(tiOlah.tab[i].tgl.day,temp);
				temp2:=temp+'/';
				str(tiOlah.tab[i].tgl.month,temp);
				temp2:=temp2+temp+'/';
				str(tiOlah.tab[i].tgl.year,temp);
				temp2:=temp2+temp;
				writeln(inf,temp2);
				str(tiOlah.tab[i].jml,temp);
				writeln(inf,temp);
				if (i <> tiOlah.neff) then
					writeln(inf,'');
			end;
		close(inf);

		assign(inf,'daftarresep.txt'); //menyimpan daftar resep sesuai simulasi yang dimainkan
		rewrite(inf);
		for i:=1 to tresep.Neff do
			begin
				writeln(inf, tresep.tab[i].nama);
				str(tresep.tab[i].harga,temp);
				writeln(inf,temp);
				str(tresep.tab[i].n,temp);
				writeln(inf,temp);
				for j:=1 to tresep.tab[i].n do
				begin
					writeln(inf, tresep.tab[i].bahan[j]);
				end;
				if (i <> tresep.neff) then
					writeln(inf,'');
			end;
		close(inf);

		assign(inf,'simulasi1.txt'); //menyimpan hasil simulasi 1 sesuai simulasi yang dimainkan
		rewrite(inf);
			begin
				str(tsimulasi.tab[1].no,temp);
				writeln(inf,temp);
					str(tsimulasi.tab[1].tgl.day,temp);
					temp2:=temp+'/';
					str(tsimulasi.tab[1].tgl.month,temp);
					temp2:=temp2+temp+'/';
					str(tsimulasi.tab[1].tgl.year,temp);
					temp2:=temp2+temp;
					writeln(inf,temp2);
				str(tsimulasi.tab[1].hari,temp);
				writeln(inf,temp);
				str(tsimulasi.tab[1].energi,temp);
				writeln(inf,temp);
				str(tsimulasi.tab[1].maks,temp);
				writeln(inf,temp);
				str(tsimulasi.tab[1].nMentahB,temp);
				writeln(inf,temp);
				str(tsimulasi.tab[1].nOlahanB,temp);
				writeln(inf,temp);
				str(tsimulasi.tab[1].nOlahanJ,temp);
				writeln(inf,temp);
				str(tsimulasi.tab[1].nResepJ,temp);
				writeln(inf,temp);
				str(tsimulasi.tab[1].msk,temp);
				writeln(inf,temp);
				str(tsimulasi.tab[1].klr,temp);
				writeln(inf,temp);
				str(tsimulasi.tab[1].uang,temp);
				writeln(inf,temp);
			end;
		close(inf);
		
		assign(inf,'simulasi2.txt'); //menyimpan hasil simulasi 2 sesuai simulasi yang dimainkan
		rewrite(inf);
			begin
				str(tsimulasi.tab[2].no,temp);
				writeln(inf,temp);
					str(tsimulasi.tab[2].tgl.day,temp);
					temp2:=temp+'/';
					str(tsimulasi.tab[2].tgl.month,temp);
					temp2:=temp2+temp+'/';
					str(tsimulasi.tab[2].tgl.year,temp);
					temp2:=temp2+temp;
					writeln(inf,temp2);
				str(tsimulasi.tab[2].hari,temp);
				writeln(inf,temp);
				str(tsimulasi.tab[2].energi,temp);
				writeln(inf,temp);
				str(tsimulasi.tab[2].maks,temp);
				writeln(inf,temp);
				str(tsimulasi.tab[2].nMentahB,temp);
				writeln(inf,temp);
				str(tsimulasi.tab[2].nOlahanB,temp);
				writeln(inf,temp);
				str(tsimulasi.tab[2].nOlahanJ,temp);
				writeln(inf,temp);
				str(tsimulasi.tab[2].nResepJ,temp);
				writeln(inf,temp);
				str(tsimulasi.tab[2].msk,temp);
				writeln(inf,temp);
				str(tsimulasi.tab[2].klr,temp);
				writeln(inf,temp);
				str(tsimulasi.tab[2].uang,temp);
				writeln(inf,temp);
			end;
		close(inf);
		
		assign(inf,'simulasi3.txt'); //menyimpan hasil simulasi 3 sesuai simulasi yang dimainkan
		rewrite(inf);
			begin
				str(tsimulasi.tab[3].no,temp);
				writeln(inf,temp);
					str(tsimulasi.tab[3].tgl.day,temp);
					temp2:=temp+'/';
					str(tsimulasi.tab[3].tgl.month,temp);
					temp2:=temp2+temp+'/';
					str(tsimulasi.tab[3].tgl.year,temp);
					temp2:=temp2+temp;
					writeln(inf,temp2);
				str(tsimulasi.tab[3].hari,temp);
				writeln(inf,temp);
				str(tsimulasi.tab[3].energi,temp);
				writeln(inf,temp);
				str(tsimulasi.tab[3].maks,temp);
				writeln(inf,temp);
				str(tsimulasi.tab[3].nMentahB,temp);
				writeln(inf,temp);
				str(tsimulasi.tab[3].nOlahanB,temp);
				writeln(inf,temp);
				str(tsimulasi.tab[3].nOlahanJ,temp);
				writeln(inf,temp);
				str(tsimulasi.tab[3].nResepJ,temp);
				writeln(inf,temp);
				str(tsimulasi.tab[3].msk,temp);
				writeln(inf,temp);
				str(tsimulasi.tab[3].klr,temp);
				writeln(inf,temp);
				str(tsimulasi.tab[3].uang,temp);
				writeln(inf,temp);
			end;
		close(inf);
		
		assign(inf,'simulasi4.txt'); //menyimpan hasil simulasi 4 sesuai simulasi yang dimainkan
		rewrite(inf);
			begin
				str(tsimulasi.tab[4].no,temp);
				writeln(inf,temp);
					str(tsimulasi.tab[4].tgl.day,temp);
					temp2:=temp+'/';
					str(tsimulasi.tab[4].tgl.month,temp);
					temp2:=temp2+temp+'/';
					str(tsimulasi.tab[4].tgl.year,temp);
					temp2:=temp2+temp;
					writeln(inf,temp2);
				str(tsimulasi.tab[4].hari,temp);
				writeln(inf,temp);
				str(tsimulasi.tab[4].energi,temp);
				writeln(inf,temp);
				str(tsimulasi.tab[4].maks,temp);
				writeln(inf,temp);
				str(tsimulasi.tab[4].nMentahB,temp);
				writeln(inf,temp);
				str(tsimulasi.tab[4].nOlahanB,temp);
				writeln(inf,temp);
				str(tsimulasi.tab[4].nOlahanJ,temp);
				writeln(inf,temp);
				str(tsimulasi.tab[4].nResepJ,temp);
				writeln(inf,temp);
				str(tsimulasi.tab[4].msk,temp);
				writeln(inf,temp);
				str(tsimulasi.tab[4].klr,temp);
				writeln(inf,temp);
				str(tsimulasi.tab[4].uang,temp);
				writeln(inf,temp);
			end;
		close(inf);
		
		assign(inf,'simulasi5.txt'); //menyimpan hasil simulasi 5 sesuai simulasi yang dimainkan
		rewrite(inf);
			begin
				str(tsimulasi.tab[5].no,temp);
				writeln(inf,temp);
					str(tsimulasi.tab[5].tgl.day,temp);
					temp2:=temp+'/';
					str(tsimulasi.tab[5].tgl.month,temp);
					temp2:=temp2+temp+'/';
					str(tsimulasi.tab[5].tgl.year,temp);
					temp2:=temp2+temp;
					writeln(inf,temp2);
				str(tsimulasi.tab[5].hari,temp);
				writeln(inf,temp);
				str(tsimulasi.tab[5].energi,temp);
				writeln(inf,temp);
				str(tsimulasi.tab[5].maks,temp);
				writeln(inf,temp);
				str(tsimulasi.tab[5].nMentahB,temp);
				writeln(inf,temp);
				str(tsimulasi.tab[5].nOlahanB,temp);
				writeln(inf,temp);
				str(tsimulasi.tab[5].nOlahanJ,temp);
				writeln(inf,temp);
				str(tsimulasi.tab[5].nResepJ,temp);
				writeln(inf,temp);
				str(tsimulasi.tab[5].msk,temp);
				writeln(inf,temp);
				str(tsimulasi.tab[5].klr,temp);
				writeln(inf,temp);
				str(tsimulasi.tab[5].uang,temp);
				writeln(inf,temp);
			end;
		close(inf);
		
		assign(inf,'simulasi6.txt'); //menyimpan hasil simulasi 6 sesuai simulasi yang dimainkan
		rewrite(inf);
			begin
				str(tsimulasi.tab[6].no,temp);
				writeln(inf,temp);
					str(tsimulasi.tab[6].tgl.day,temp);
					temp2:=temp+'/';
					str(tsimulasi.tab[6].tgl.month,temp);
					temp2:=temp2+temp+'/';
					str(tsimulasi.tab[6].tgl.year,temp);
					temp2:=temp2+temp;
					writeln(inf,temp2);
				str(tsimulasi.tab[6].hari,temp);
				writeln(inf,temp);
				str(tsimulasi.tab[6].energi,temp);
				writeln(inf,temp);
				str(tsimulasi.tab[6].maks,temp);
				writeln(inf,temp);
				str(tsimulasi.tab[6].nMentahB,temp);
				writeln(inf,temp);
				str(tsimulasi.tab[6].nOlahanB,temp);
				writeln(inf,temp);
				str(tsimulasi.tab[6].nOlahanJ,temp);
				writeln(inf,temp);
				str(tsimulasi.tab[6].nResepJ,temp);
				writeln(inf,temp);
				str(tsimulasi.tab[6].msk,temp);
				writeln(inf,temp);
				str(tsimulasi.tab[6].klr,temp);
				writeln(inf,temp);
				str(tsimulasi.tab[6].uang,temp);
				writeln(inf,temp);
			end;
		close(inf);
		
		assign(inf,'simulasi7.txt'); //menyimpan hasil simulasi 7 sesuai simulasi yang dimainkan
		rewrite(inf);
			begin
				str(tsimulasi.tab[7].no,temp);
				writeln(inf,temp);
					str(tsimulasi.tab[7].tgl.day,temp);
					temp2:=temp+'/';
					str(tsimulasi.tab[7].tgl.month,temp);
					temp2:=temp2+temp+'/';
					str(tsimulasi.tab[7].tgl.year,temp);
					temp2:=temp2+temp;
					writeln(inf,temp2);
				str(tsimulasi.tab[7].hari,temp);
				writeln(inf,temp);
				str(tsimulasi.tab[7].energi,temp);
				writeln(inf,temp);
				str(tsimulasi.tab[7].maks,temp);
				writeln(inf,temp);
				str(tsimulasi.tab[7].nMentahB,temp);
				writeln(inf,temp);
				str(tsimulasi.tab[7].nOlahanB,temp);
				writeln(inf,temp);
				str(tsimulasi.tab[7].nOlahanJ,temp);
				writeln(inf,temp);
				str(tsimulasi.tab[7].nResepJ,temp);
				writeln(inf,temp);
				str(tsimulasi.tab[7].msk,temp);
				writeln(inf,temp);
				str(tsimulasi.tab[7].klr,temp);
				writeln(inf,temp);
				str(tsimulasi.tab[7].uang,temp);
				writeln(inf,temp);
			end;
		close(inf);
		
		assign(inf,'simulasi8.txt'); //menyimpan hasil simulasi 8 sesuai simulasi yang dimainkan
		rewrite(inf);
			begin
				str(tsimulasi.tab[8].no,temp);
				writeln(inf,temp);
					str(tsimulasi.tab[8].tgl.day,temp);
					temp2:=temp+'/';
					str(tsimulasi.tab[8].tgl.month,temp);
					temp2:=temp2+temp+'/';
					str(tsimulasi.tab[8].tgl.year,temp);
					temp2:=temp2+temp;
					writeln(inf,temp2);
				str(tsimulasi.tab[8].hari,temp);
				writeln(inf,temp);
				str(tsimulasi.tab[8].energi,temp);
				writeln(inf,temp);
				str(tsimulasi.tab[8].maks,temp);
				writeln(inf,temp);
				str(tsimulasi.tab[8].nMentahB,temp);
				writeln(inf,temp);
				str(tsimulasi.tab[8].nOlahanB,temp);
				writeln(inf,temp);
				str(tsimulasi.tab[8].nOlahanJ,temp);
				writeln(inf,temp);
				str(tsimulasi.tab[8].nResepJ,temp);
				writeln(inf,temp);
				str(tsimulasi.tab[8].msk,temp);
				writeln(inf,temp);
				str(tsimulasi.tab[8].klr,temp);
				writeln(inf,temp);
				str(tsimulasi.tab[8].uang,temp);
				writeln(inf,temp);
			end;
		close(inf);
		
		assign(inf,'simulasi9.txt'); //menyimpan hasil simulasi 9 sesuai simulasi yang dimainkan
		rewrite(inf);
			begin
				str(tsimulasi.tab[9].no,temp);
				writeln(inf,temp);
					str(tsimulasi.tab[9].tgl.day,temp);
					temp2:=temp+'/';
					str(tsimulasi.tab[9].tgl.month,temp);
					temp2:=temp2+temp+'/';
					str(tsimulasi.tab[9].tgl.year,temp);
					temp2:=temp2+temp;
					writeln(inf,temp2);
				str(tsimulasi.tab[9].hari,temp);
				writeln(inf,temp);
				str(tsimulasi.tab[9].energi,temp);
				writeln(inf,temp);
				str(tsimulasi.tab[9].maks,temp);
				writeln(inf,temp);
				str(tsimulasi.tab[9].nMentahB,temp);
				writeln(inf,temp);
				str(tsimulasi.tab[9].nOlahanB,temp);
				writeln(inf,temp);
				str(tsimulasi.tab[9].nOlahanJ,temp);
				writeln(inf,temp);
				str(tsimulasi.tab[9].nResepJ,temp);
				writeln(inf,temp);
				str(tsimulasi.tab[9].msk,temp);
				writeln(inf,temp);
				str(tsimulasi.tab[9].klr,temp);
				writeln(inf,temp);
				str(tsimulasi.tab[9].uang,temp);
				writeln(inf,temp);
			end;
		close(inf);
		
		assign(inf,'simulasi10.txt'); //menyimpan hasil simulasi 10 sesuai simulasi yang dimainkan
		rewrite(inf);
			begin
				str(tsimulasi.tab[10].no,temp);
				writeln(inf,temp);
					str(tsimulasi.tab[10].tgl.day,temp);
					temp2:=temp+'/';
					str(tsimulasi.tab[10].tgl.month,temp);
					temp2:=temp2+temp+'/';
					str(tsimulasi.tab[10].tgl.year,temp);
					temp2:=temp2+temp;
					writeln(inf,temp2);
				str(tsimulasi.tab[10].hari,temp);
				writeln(inf,temp);
				str(tsimulasi.tab[10].energi,temp);
				writeln(inf,temp);
				str(tsimulasi.tab[10].maks,temp);
				writeln(inf,temp);
				str(tsimulasi.tab[10].nMentahB,temp);
				writeln(inf,temp);
				str(tsimulasi.tab[10].nOlahanB,temp);
				writeln(inf,temp);
				str(tsimulasi.tab[10].nOlahanJ,temp);
				writeln(inf,temp);
				str(tsimulasi.tab[10].nResepJ,temp);
				writeln(inf,temp);
				str(tsimulasi.tab[10].msk,temp);
				writeln(inf,temp);
				str(tsimulasi.tab[10].klr,temp);
				writeln(inf,temp);
				str(tsimulasi.tab[10].uang,temp);
				writeln(inf,temp);
			end;
		close(inf);
end;
end.
