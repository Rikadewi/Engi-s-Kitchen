unit F5;

interface
	uses bentukan;
	procedure belibahan (tmentah : tabMentah; var timentah: tabiMentah; var tsimulasi: tabsimulasi; tiolah : tabiOlah; idx: integer);
	{I.S.: tmentah, timentah, tsimulasi, tiolah, idx terdefinisi
		asumsi jika ada bahan dengan nama sama maka bahan dengan tanggal pembelian yang lebih lama/lebih duluan dibeli akan ditempatkan duluan urutannya pada timentah dan tiolah}
	{F.S.: melakukan pembelian bahan mentah dari supermarket. Pembelian bahan mentah menambah inventori bahan mentah dan mengurangi energi Chef sebanyak 1 buah. Tidak bisa melakukan pembelian bahan apabila sudah mencapai maksimum kapasitas inventori dan jika jumlah uang yang dimiliki restoran tidak mencukupi untuk membeli bahan.}
	
implementation
	procedure belibahan (tmentah : tabMentah; var timentah: tabiMentah; var tsimulasi: tabsimulasi; tiolah : tabiOlah; idx: integer);
	{KAMUS}
	var
		s:string; //nama bahan
		i:integer; //elemen looping
		jml : integer; //jumlah bahan dibeli
		harga : longint; //total harga dibeli
		id: integer; //indeks pada array bahan mentah ditemukan
		found: boolean; 
		inv: integer; //jumlah di inventori
	{ALGORITMA}
	begin
		if (tsimulasi.tab[idx].energi<1) then writeln ('Energi tidak cukup.')
		else
		begin
			write ('Masukkan nama bahan : ');
			readln (s);
			found:=false;
			i:=1;
			while (i<=tmentah.neff) and not (found) do
			begin
				if (tmentah.tab[i].nama=s) then
				begin
					id:=i;
					found:=true;
				end;
				i:=i+1;
			end;
			if (found) then
			begin
				repeat
					write ('Masukkan jumlah bahan : ');
					readln (jml);
					if (jml<=0) then writeln ('Jumlah tidak valid.')
				until (jml>0);
				inv:=0;
				for i:=1 to timentah.neff do
				begin
					inv:=inv+timentah.tab[i].jml;
				end;
				for i:=1 to timentah.neff do
				begin
					inv:=inv+timentah.tab[i].jml;
				end;
				inv:=inv+jml;
				harga:=jml*tmentah.tab[id].harga;
				
				if (inv<=tsimulasi.tab[idx].maks) and (harga<=tsimulasi.tab[idx].uang) then
				begin
					writeln ('Pembelian sukses!');
					
					//manambah inventori bahan mentah
					i:=1;
					found:=false;
					while (i<=timentah.neff) and not(found) do
					begin
						if (s=timentah.tab[i].nama) then
						begin
							if (tsimulasi.tab[idx].tgl.day+tsimulasi.tab[idx].hari-1 = timentah.tab[i].tgl.day) then 
							begin
								timentah.tab[i].jml:=timentah.tab[i].jml+jml;
								found:=true;
							end;
						end;
						i:=i+1;
					end; 
					if not(found) then
					begin
						timentah.neff:=timentah.neff+1;
						timentah.tab[timentah.neff].nama:=s;
						timentah.tab[timentah.neff].tgl.day:=tsimulasi.tab[idx].tgl.day+tsimulasi.tab[idx].hari-1;
						timentah.tab[timentah.neff].tgl.month:=tsimulasi.tab[idx].tgl.month;
						timentah.tab[timentah.neff].tgl.year:=tsimulasi.tab[idx].tgl.year;
						timentah.tab[timentah.neff].jml:=jml;
					end;
					 
					//perubahan pada file simulasi
					tsimulasi.tab[idx].energi := tsimulasi.tab[idx].energi-1;
					tsimulasi.tab[idx].nMentahB := tsimulasi.tab[idx].nMentahB+jml;
					tsimulasi.tab[idx].klr := tsimulasi.tab[idx].klr+harga;
					tsimulasi.tab[idx].uang := tsimulasi.tab[idx].uang-harga;
					
				end
				else
				begin
					writeln ('Pembelian gagal.');
				end;
			end
			else
			begin
				writeln('Nama bahan tidak ditemukan.')
			end;
		end;
	end;
end.