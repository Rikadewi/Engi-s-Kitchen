Unit F1;

interface

uses bentukan;
	procedure load (var tMentah : tabMentah; var tOlah : tabOlah; var tiMentah : tabiMentah; var tiOlah : tabiOlah; var tresep : tabresep;
					var tsimulasi : tabsimulasi);
	{I.S.: ada file eksternal yang harus diload ke dalam program}
	{F.S.: semua file eksternal yang dibutuhkan berhasil di load }
					
Implementation
	procedure load (var tMentah : tabMentah; var tOlah : tabOlah; var tiMentah : tabiMentah; var tiOlah : tabiOlah; var tresep : tabresep;
					var tsimulasi : tabsimulasi);
	{KAMUS}					
	var
		inf : text; //untuk membaca file eksternal
		i,temp2 : integer; //i untuk looping dan temp2 untuk menyimpan sementara pada saat load tanggal
		temp: string; //untuk menyimpan sementara saat mengubah string ke integer
	{ALGORITMA}
begin
		assign(inf,'BahanMentah.txt'); //load bahan mentah
		reset(inf);
			tMentah.neff :=0;
		if EOF(inf) then
		begin
			writeln('File Bahan Mentah Kosong');
		end else
			begin
			while (not(EOF(inf))) do
				begin
					tMentah.neff := tMentah.neff+1;
					readln(inf, tMentah.tab[tMentah.neff].nama);
					readln(inf,temp);
					val(temp, tMentah.tab[tMentah.neff].harga);
					readln(inf,temp);
					val(temp, tMentah.tab[tMentah.neff].exp);
					readln(inf,temp);
				end;
			writeln('Pembacaan Bahan Mentah berhasil');
			end;
		close(inf);
			
		assign(inf,'BahanOlahan.txt'); //load bahan olahan
		reset(inf);
			tOlah.neff := 0;
		if EOF(inf) then
		begin
			writeln('File Bahan Olahan Kosong');
		end else
			begin
			while (not(EOF(inf))) do
				begin
					tOlah.neff := tOlah.neff + 1;
					readln(inf, tOlah.tab[tOlah.neff].nama);
					readln (inf,temp);
					val (temp, tOlah.tab[tOlah.neff].harga);
					readln (inf,temp);
					val(temp, tOlah.tab[tOlah.neff].n);
					for i:=1 to tOlah.tab[tOlah.neff].n do
						begin
							readln(inf, tOlah.tab[tOlah.neff].bahan[i]);
						end;
					readln(inf,temp);
				end;
			writeln('Pembacaan Bahan Olahan berhasil');
			end;
		close(inf);
	
		assign(inf,'InvBahanMentah.txt'); //load inventori bahan mentah
		reset(inf);
			tiMentah.neff :=0;
		if EOF(inf) then
		begin
			writeln('File Inventori Bahan Mentah Kosong');
		end else
			begin
			while (not(EOF(inf))) do
				begin
					tiMentah.neff := tiMentah.neff + 1;								
					readln(inf, tiMentah.tab[tiMentah.neff].nama);
					readln(inf,temp);
						val ((copy(temp,1,pos('/',temp)-1)),temp2);
						tiMentah.tab[tiMentah.neff].tgl.day := temp2;
						delete(temp,1,pos('/',temp));
						val ((copy(temp,1,pos('/',temp)-1)),temp2);
						tiMentah.tab[tiMentah.neff].tgl.month := temp2;
						delete(temp,1,pos('/',temp));
						val (temp,temp2);
						tiMentah.tab[tiMentah.neff].tgl.year := temp2;
					readln (inf,temp);
					val(temp, tiMentah.tab[tiMentah.neff].jml);
					readln(inf,temp);
				end;
			writeln('Pembacaan Inventori Bahan Mentah berhasil');
			end;
		close(inf);
		
		assign(inf,'InvBahanOlahan.txt'); //load inventori bahan olahan
		reset(inf);				
			tiOlah.neff := 0;
		if EOF(inf) then
		begin
			writeln('File Inventori Bahan Olahan Kosong');
		end else
			begin
			while (not(EOF(inf))) do
				begin
					tiOlah.neff := tiOlah.neff + 1;
					readln(inf, tiOlah.tab[tiOlah.neff].nama);
					readln (inf,temp);
					val ((copy(temp,1,pos('/',temp)-1)),temp2);
					tiOlah.tab[tiOlah.neff].tgl.day := temp2;
					delete(temp,1,pos('/',temp));
					val ((copy(temp,1,pos('/',temp)-1)),temp2);
					tiOlah.tab[tiOlah.neff].tgl.month := temp2;
					delete(temp,1,pos('/',temp));
					val (temp,temp2);
					tiOlah.tab[tiOlah.neff].tgl.year := temp2;
					readln (inf,temp);
					val(temp, tiOlah.tab[tiOlah.neff].jml);
					readln(inf,temp);
				end;
			writeln('Pembacaan Inventori Bahan Olahan berhasil');
			end;
		close(inf);
		
		assign(inf,'daftarresep.txt'); //load daftar resep
		reset(inf);			
		tresep.neff:=0;
		if EOF(inf) then
		begin
			writeln('File Daftar Resep Kosong');
		end else
			begin
			while (not(EOF(inf))) do
				begin
					tresep.neff := tresep.neff + 1;
					readln(inf, tresep.tab[tresep.neff].nama);
					readln (inf,temp);
					val(temp, tresep.tab[tresep.neff].harga);
					readln (inf,temp);
					val(temp, tresep.tab[tresep.neff].n);
					for i:=1 to tresep.tab[tresep.neff].n do
					begin
						readln(inf, tresep.tab[tresep.neff].bahan[i]);
					end;
					readln(inf,temp);
				end;
			writeln('Pembacaan Resep berhasil');
			end;
		close(inf);
		
		assign(inf,'simulasi1.txt'); //load simulasi 1
		reset(inf);				
		if EOF(inf) then
		begin
			writeln('File Simulasi Kosong');
		end else
			begin
			while (not(EOF(inf))) do
				begin
					Readln(inf, temp);
					val(temp, tsimulasi.tab[1].no);
						readln(inf,temp);
						val ((copy(temp,1,pos('/',temp)-1)),temp2);
						tsimulasi.tab[1].tgl.day := temp2;
						delete(temp,1,pos('/',temp));
						val ((copy(temp,1,pos('/',temp)-1)),temp2);
						tsimulasi.tab[1].tgl.month := temp2;
						delete(temp,1,pos('/',temp));
						val (temp,temp2);
						tsimulasi.tab[1].tgl.year := temp2;
					Readln(inf, temp);
					val(temp, tsimulasi.tab[1].hari);
					Readln(inf, temp);
					val(temp, tsimulasi.tab[1].energi);
					Readln(inf, temp);
					val(temp, tsimulasi.tab[1].maks);
					Readln(inf, temp);
					val(temp, tsimulasi.tab[1].nMentahB);
					Readln(inf, temp);
					val(temp, tsimulasi.tab[1].nOlahanB);
					Readln(inf, temp);
					val(temp, tsimulasi.tab[1].nOlahanJ);
					Readln(inf, temp);
					val(temp, tsimulasi.tab[1].nResepJ);
					Readln(inf, temp);
					val(temp, tsimulasi.tab[1].msk);
					Readln(inf, temp);
					val(temp, tsimulasi.tab[1].klr);
					Readln(inf, temp);
					val(temp, tsimulasi.tab[1].uang);
				end;
			writeln('Pembacaan Simulasi berhasil');
			end;
		close(inf);
		
		assign(inf,'simulasi2.txt'); //load simulasi 2
		reset(inf);				
			begin
			while (not(EOF(inf))) do
				begin
					Readln(inf, temp);
					val(temp, tsimulasi.tab[2].no);
						readln(inf,temp);
						val ((copy(temp,1,pos('/',temp)-1)),temp2);
						tsimulasi.tab[2].tgl.day := temp2;
						delete(temp,1,pos('/',temp));
						val ((copy(temp,1,pos('/',temp)-1)),temp2);
						tsimulasi.tab[2].tgl.month := temp2;
						delete(temp,1,pos('/',temp));
						val (temp,temp2);
						tsimulasi.tab[2].tgl.year := temp2;
					Readln(inf, temp);
					val(temp, tsimulasi.tab[2].hari);
					Readln(inf, temp);
					val(temp, tsimulasi.tab[2].energi);
					Readln(inf, temp);
					val(temp, tsimulasi.tab[2].maks);
					Readln(inf, temp);
					val(temp, tsimulasi.tab[2].nMentahB);
					Readln(inf, temp);
					val(temp, tsimulasi.tab[2].nOlahanB);
					Readln(inf, temp);
					val(temp, tsimulasi.tab[2].nOlahanJ);
					Readln(inf, temp);
					val(temp, tsimulasi.tab[2].nResepJ);
					Readln(inf, temp);
					val(temp, tsimulasi.tab[2].msk);
					Readln(inf, temp);
					val(temp, tsimulasi.tab[2].klr);
					Readln(inf, temp);
					val(temp, tsimulasi.tab[2].uang);
				end;
			end;
		close(inf);
		
		assign(inf,'simulasi3.txt'); //load simulasi 3
		reset(inf);				
			begin
			while (not(EOF(inf))) do
				begin
					Readln(inf, temp);
					val(temp, tsimulasi.tab[3].no);
						readln(inf,temp);
						val ((copy(temp,1,pos('/',temp)-1)),temp2);
						tsimulasi.tab[3].tgl.day := temp2;
						delete(temp,1,pos('/',temp));
						val ((copy(temp,1,pos('/',temp)-1)),temp2);
						tsimulasi.tab[3].tgl.month := temp2;
						delete(temp,1,pos('/',temp));
						val (temp,temp2);
						tsimulasi.tab[3].tgl.year := temp2;
					Readln(inf, temp);
					val(temp, tsimulasi.tab[3].hari);
					Readln(inf, temp);
					val(temp, tsimulasi.tab[3].energi);
					Readln(inf, temp);
					val(temp, tsimulasi.tab[3].maks);
					Readln(inf, temp);
					val(temp, tsimulasi.tab[3].nMentahB);
					Readln(inf, temp);
					val(temp, tsimulasi.tab[3].nOlahanB);
					Readln(inf, temp);
					val(temp, tsimulasi.tab[3].nOlahanJ);
					Readln(inf, temp);
					val(temp, tsimulasi.tab[3].nResepJ);
					Readln(inf, temp);
					val(temp, tsimulasi.tab[3].msk);
					Readln(inf, temp);
					val(temp, tsimulasi.tab[3].klr);
					Readln(inf, temp);
					val(temp, tsimulasi.tab[3].uang);
				end;
			end;
		close(inf);
		
		assign(inf,'simulasi4.txt'); //load simulasi 4
		reset(inf);				
			begin
			while (not(EOF(inf))) do
				begin
					Readln(inf, temp);
					val(temp, tsimulasi.tab[4].no);
						readln(inf,temp);
						val ((copy(temp,1,pos('/',temp)-1)),temp2);
						tsimulasi.tab[4].tgl.day := temp2;
						delete(temp,1,pos('/',temp));
						val ((copy(temp,1,pos('/',temp)-1)),temp2);
						tsimulasi.tab[4].tgl.month := temp2;
						delete(temp,1,pos('/',temp));
						val (temp,temp2);
						tsimulasi.tab[4].tgl.year := temp2;
					Readln(inf, temp);
					val(temp, tsimulasi.tab[4].hari);
					Readln(inf, temp);
					val(temp, tsimulasi.tab[4].energi);
					Readln(inf, temp);
					val(temp, tsimulasi.tab[4].maks);
					Readln(inf, temp);
					val(temp, tsimulasi.tab[4].nMentahB);
					Readln(inf, temp);
					val(temp, tsimulasi.tab[4].nOlahanB);
					Readln(inf, temp);
					val(temp, tsimulasi.tab[4].nOlahanJ);
					Readln(inf, temp);
					val(temp, tsimulasi.tab[4].nResepJ);
					Readln(inf, temp);
					val(temp, tsimulasi.tab[4].msk);
					Readln(inf, temp);
					val(temp, tsimulasi.tab[4].klr);
					Readln(inf, temp);
					val(temp, tsimulasi.tab[4].uang);
				end;
			end;
		close(inf);
		
		assign(inf,'simulasi5.txt'); //load simulasi 5
		reset(inf);				
			begin
			while (not(EOF(inf))) do
				begin
					Readln(inf, temp);
					val(temp, tsimulasi.tab[5].no);
						readln(inf,temp);
						val ((copy(temp,1,pos('/',temp)-1)),temp2);
						tsimulasi.tab[5].tgl.day := temp2;
						delete(temp,1,pos('/',temp));
						val ((copy(temp,1,pos('/',temp)-1)),temp2);
						tsimulasi.tab[5].tgl.month := temp2;
						delete(temp,1,pos('/',temp));
						val (temp,temp2);
						tsimulasi.tab[5].tgl.year := temp2;
					Readln(inf, temp);
					val(temp, tsimulasi.tab[5].hari);
					Readln(inf, temp);
					val(temp, tsimulasi.tab[5].energi);
					Readln(inf, temp);
					val(temp, tsimulasi.tab[5].maks);
					Readln(inf, temp);
					val(temp, tsimulasi.tab[5].nMentahB);
					Readln(inf, temp);
					val(temp, tsimulasi.tab[5].nOlahanB);
					Readln(inf, temp);
					val(temp, tsimulasi.tab[5].nOlahanJ);
					Readln(inf, temp);
					val(temp, tsimulasi.tab[5].nResepJ);
					Readln(inf, temp);
					val(temp, tsimulasi.tab[5].msk);
					Readln(inf, temp);
					val(temp, tsimulasi.tab[5].klr);
					Readln(inf, temp);
					val(temp, tsimulasi.tab[5].uang);
				end;
			end;
		close(inf);
		
		assign(inf,'simulasi6.txt'); //load simulasi 6
		reset(inf);				
			begin
			while (not(EOF(inf))) do
				begin
					Readln(inf, temp);
					val(temp, tsimulasi.tab[6].no);
						readln(inf,temp);
						val ((copy(temp,1,pos('/',temp)-1)),temp2);
						tsimulasi.tab[6].tgl.day := temp2;
						delete(temp,1,pos('/',temp));
						val ((copy(temp,1,pos('/',temp)-1)),temp2);
						tsimulasi.tab[6].tgl.month := temp2;
						delete(temp,1,pos('/',temp));
						val (temp,temp2);
						tsimulasi.tab[6].tgl.year := temp2;
					Readln(inf, temp);
					val(temp, tsimulasi.tab[6].hari);
					Readln(inf, temp);
					val(temp, tsimulasi.tab[6].energi);
					Readln(inf, temp);
					val(temp, tsimulasi.tab[6].maks);
					Readln(inf, temp);
					val(temp, tsimulasi.tab[6].nMentahB);
					Readln(inf, temp);
					val(temp, tsimulasi.tab[6].nOlahanB);
					Readln(inf, temp);
					val(temp, tsimulasi.tab[6].nOlahanJ);
					Readln(inf, temp);
					val(temp, tsimulasi.tab[6].nResepJ);
					Readln(inf, temp);
					val(temp, tsimulasi.tab[6].msk);
					Readln(inf, temp);
					val(temp, tsimulasi.tab[6].klr);
					Readln(inf, temp);
					val(temp, tsimulasi.tab[6].uang);
				end;
			end;
		close(inf);
		
		assign(inf,'simulasi7.txt'); //load simulasi 7
		reset(inf);				
			begin
			while (not(EOF(inf))) do
				begin
					Readln(inf, temp);
					val(temp, tsimulasi.tab[7].no);
						readln(inf,temp);
						val ((copy(temp,1,pos('/',temp)-1)),temp2);
						tsimulasi.tab[7].tgl.day := temp2;
						delete(temp,1,pos('/',temp));
						val ((copy(temp,1,pos('/',temp)-1)),temp2);
						tsimulasi.tab[7].tgl.month := temp2;
						delete(temp,1,pos('/',temp));
						val (temp,temp2);
						tsimulasi.tab[7].tgl.year := temp2;
					Readln(inf, temp);
					val(temp, tsimulasi.tab[7].hari);
					Readln(inf, temp);
					val(temp, tsimulasi.tab[7].energi);
					Readln(inf, temp);
					val(temp, tsimulasi.tab[7].maks);
					Readln(inf, temp);
					val(temp, tsimulasi.tab[7].nMentahB);
					Readln(inf, temp);
					val(temp, tsimulasi.tab[7].nOlahanB);
					Readln(inf, temp);
					val(temp, tsimulasi.tab[7].nOlahanJ);
					Readln(inf, temp);
					val(temp, tsimulasi.tab[7].nResepJ);
					Readln(inf, temp);
					val(temp, tsimulasi.tab[7].msk);
					Readln(inf, temp);
					val(temp, tsimulasi.tab[7].klr);
					Readln(inf, temp);
					val(temp, tsimulasi.tab[7].uang);
				end;
			end;
		close(inf);
		
		assign(inf,'simulasi8.txt'); //load simulasi 8
		reset(inf);				
			begin
			while (not(EOF(inf))) do
				begin
					Readln(inf, temp);
					val(temp, tsimulasi.tab[8].no);
						readln(inf,temp);
						val ((copy(temp,1,pos('/',temp)-1)),temp2);
						tsimulasi.tab[8].tgl.day := temp2;
						delete(temp,1,pos('/',temp));
						val ((copy(temp,1,pos('/',temp)-1)),temp2);
						tsimulasi.tab[8].tgl.month := temp2;
						delete(temp,1,pos('/',temp));
						val (temp,temp2);
						tsimulasi.tab[8].tgl.year := temp2;
					Readln(inf, temp);
					val(temp, tsimulasi.tab[8].hari);
					Readln(inf, temp);
					val(temp, tsimulasi.tab[8].energi);
					Readln(inf, temp);
					val(temp, tsimulasi.tab[8].maks);
					Readln(inf, temp);
					val(temp, tsimulasi.tab[8].nMentahB);
					Readln(inf, temp);
					val(temp, tsimulasi.tab[8].nOlahanB);
					Readln(inf, temp);
					val(temp, tsimulasi.tab[8].nOlahanJ);
					Readln(inf, temp);
					val(temp, tsimulasi.tab[8].nResepJ);
					Readln(inf, temp);
					val(temp, tsimulasi.tab[8].msk);
					Readln(inf, temp);
					val(temp, tsimulasi.tab[8].klr);
					Readln(inf, temp);
					val(temp, tsimulasi.tab[8].uang);
				end;
			end;
		close(inf);
		
		assign(inf,'simulasi9.txt'); //load simulasi 9
		reset(inf);				
			begin
			while (not(EOF(inf))) do
				begin
					Readln(inf, temp);
					val(temp, tsimulasi.tab[9].no);
						readln(inf,temp);
						val ((copy(temp,1,pos('/',temp)-1)),temp2);
						tsimulasi.tab[9].tgl.day := temp2;
						delete(temp,1,pos('/',temp));
						val ((copy(temp,1,pos('/',temp)-1)),temp2);
						tsimulasi.tab[9].tgl.month := temp2;
						delete(temp,1,pos('/',temp));
						val (temp,temp2);
						tsimulasi.tab[9].tgl.year := temp2;
					Readln(inf, temp);
					val(temp, tsimulasi.tab[9].hari);
					Readln(inf, temp);
					val(temp, tsimulasi.tab[9].energi);
					Readln(inf, temp);
					val(temp, tsimulasi.tab[9].maks);
					Readln(inf, temp);
					val(temp, tsimulasi.tab[9].nMentahB);
					Readln(inf, temp);
					val(temp, tsimulasi.tab[9].nOlahanB);
					Readln(inf, temp);
					val(temp, tsimulasi.tab[9].nOlahanJ);
					Readln(inf, temp);
					val(temp, tsimulasi.tab[9].nResepJ);
					Readln(inf, temp);
					val(temp, tsimulasi.tab[9].msk);
					Readln(inf, temp);
					val(temp, tsimulasi.tab[9].klr);
					Readln(inf, temp);
					val(temp, tsimulasi.tab[9].uang);
				end;
			end;
		close(inf);
		
		assign(inf,'simulasi10.txt'); //load simulasi 10
		reset(inf);				
			begin
			while (not(EOF(inf))) do
				begin
					Readln(inf, temp);
					val(temp, tsimulasi.tab[10].no);
						readln(inf,temp);
						val ((copy(temp,1,pos('/',temp)-1)),temp2);
						tsimulasi.tab[10].tgl.day := temp2;
						delete(temp,1,pos('/',temp));
						val ((copy(temp,1,pos('/',temp)-1)),temp2);
						tsimulasi.tab[10].tgl.month := temp2;
						delete(temp,1,pos('/',temp));
						val (temp,temp2);
						tsimulasi.tab[10].tgl.year := temp2;
					Readln(inf, temp);
					val(temp, tsimulasi.tab[10].hari);
					Readln(inf, temp);
					val(temp, tsimulasi.tab[10].energi);
					Readln(inf, temp);
					val(temp, tsimulasi.tab[10].maks);
					Readln(inf, temp);
					val(temp, tsimulasi.tab[10].nMentahB);
					Readln(inf, temp);
					val(temp, tsimulasi.tab[10].nOlahanB);
					Readln(inf, temp);
					val(temp, tsimulasi.tab[10].nOlahanJ);
					Readln(inf, temp);
					val(temp, tsimulasi.tab[10].nResepJ);
					Readln(inf, temp);
					val(temp, tsimulasi.tab[10].msk);
					Readln(inf, temp);
					val(temp, tsimulasi.tab[10].klr);
					Readln(inf, temp);
					val(temp, tsimulasi.tab[10].uang);
				end;
			end;
		close(inf);
		
end;
end.
