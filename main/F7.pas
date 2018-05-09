unit F7;

interface
	uses bentukan;
	procedure jualolahan (tolah : tabOlah; var tiolah : tabiOlah; var tsimulasi: tabsimulasi; idx: integer);
	{I.S.: tolah, tiolah, tsimulasi,idx terdefinisi
		asumsi jika ada bahan dengan nama sama maka bahan dengan tanggal pembelian yang lebih lama/lebih duluan dibeli akan ditempatkan duluan urutannya pada tiolah}
	{F.S.: menjual bahan olahan. Hanya bahan olahan yang belum kadaluarsa yang dapat dijual. Kadaluarasa dihitung berdasarkan tanggal pada inventori dan tanggal simulasi. Setiap bahan olahan kadaluarsa 3 hari setelah dibuat. Penjualan bahan olahan mengurangi inventori, menambah pemasukan, dan mengurangi energi Chef sebanyak 1 buah. }
	
implementation
	procedure jualolahan (tolah : tabOlah; var tiolah : tabiOlah; var tsimulasi: tabsimulasi; idx: integer);
	{KAMUS}
	var
		s:string; //nama olahan
		id:integer; //indeks olahan ditemukan pada array
		i,j,k:integer; //elemen looping
		found: boolean; //pengecek
		sum:integer; //jumlah sementara
		jml:integer; //jumlah olahan yang akan dijual
	{ALGORITMA}
	begin
		if (tsimulasi.tab[idx].energi<1) then writeln ('Energi tidak cukup.')
		else
		begin
			write ('Masukkan nama bahan olahan yang ingin dijual : ');
			readln (s);
			found:=false;
			i:=1;
			while (i<=tolah.neff) and not (found) do
			begin
				if (tolah.tab[i].nama=s) then
				begin
					id:=i;
					found:=true;
				end;
				i:=i+1;
			end;
			if (found) then
			begin
				repeat
					write ('Masukkan jumlah yang mau dijual : ');
					readln (jml);
					if (jml<=0) then writeln ('Jumlah tidak valid.')
				until (jml>0);
				
				//mengecek inventori
				sum:=0;
				for i:=1 to tiolah.neff do
				begin
					if (s=tiolah.tab[i].nama) then
					begin
						sum:=sum+tiolah.tab[i].jml;
					end;					
				end;
				
				if (sum>=jml) then
				begin
					writeln ('Penjualan sukses!');

					//mengurangi inventori
					sum:=jml;
					j:=1;
					while (j<=tiolah.neff) and (sum>0) do
					begin
						if (s=tiolah.tab[j].nama) then
						begin
							if (tiolah.tab[j].jml>sum) then 
							begin
								tiolah.tab[j].jml:=tiolah.tab[j].jml-sum;
								sum:=0;
							end
							else //sum>=jumlah bahan olahan
							begin
								sum:=sum-tiolah.tab[j].jml;
								tiolah.tab[j].jml:=0;
							end;
						end;
						j:=j+1;
					end;
					
					//menggeser inventori bahan olahan yang kosong
					sum:=0;
					for j:=1 to tiolah.neff do
					begin
						if (tiolah.tab[j].jml = 0) then
						begin
							sum:=sum+1;
							for k:=j to tiolah.neff-sum do
							begin
								tiolah.tab[k]:=tiolah.tab[k+1];
							end;
						end;
					end;
					tiolah.neff:=tiolah.neff-sum;
					 
					//perubahan pada file simulasi
					tsimulasi.tab[idx].energi := tsimulasi.tab[idx].energi-1;
					tsimulasi.tab[idx].nOlahanJ := tsimulasi.tab[idx].nOlahanJ+jml;
					tsimulasi.tab[idx].msk := tsimulasi.tab[idx].msk+tolah.tab[id].harga*jml;
					tsimulasi.tab[idx].uang := tsimulasi.tab[idx].uang+tolah.tab[id].harga*jml;
				end
				else
				begin
					writeln ('Bahan kurang.');
				end;
			end
			else
			begin
				writeln('Nama bahan olahan tidak ditemukan.')
			end;
		end;
	end;
end.