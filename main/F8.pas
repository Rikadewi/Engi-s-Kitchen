unit F8;

interface
	uses bentukan;
	procedure jualresep (var timentah : tabiMentah; var tiolah: tabiOlah; tresep: tabresep; var tsimulasi : tabsimulasi; idx:integer);
	{I.S.: timentah,tiolah,tresep,tsimulasi, idx terdefinisi
		asumsi jika ada bahan dengan nama sama maka bahan dengan tanggal pembelian yang lebih lama/lebih duluan dibeli akan ditempatkan duluan urutannya pada timentah dan tiolah}
	{F.S.: mengolah dan menjual hidangan berdasarkan resep. Hidangan hanya bisa dibuat jika bahan mentah dan olahan penyusun resep tersedia di inventori. Pembuatan hidangan mengurangi inventori, menambah pemasukan, dan mengurangi energi Chef sebanyak 1 buah.}
	
implementation
	procedure jualresep (var timentah : tabiMentah; var tiolah: tabiOlah; tresep: tabresep; var tsimulasi : tabsimulasi; idx:integer);
	{KAMUS}
	var
		s	:string; //nama resep
		jml 	: integer; //jumlah resep yang akan dijual
		i,j,k : integer; //elemen looping
		found,found1 : boolean; //pengecek
		id	: integer; //indeks nama resep ditemukan pada array
		sum	: integer; //jumlah sementara
	{ALGORITMA}
	begin
		if (tsimulasi.tab[idx].energi<1) then writeln ('Energi tidak cukup.')
		else
		begin
			write ('Masukkan nama resep yang ingin dijual : ');
			readln (s);
			found:=false;
			i:=1;
			while (i<=tresep.neff) and not (found) do
			begin
				if (tresep.tab[i].nama=s) then
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
				i:=1;
				found:=true; 
				while (i<=tresep.tab[id].n) and (found) do //mengecek tiap bahan mentah penyusun
				begin
					//cek inventori mentah
					sum:=0;
					found1:=false; 
					for j:=1 to timentah.neff do
					begin
						if (tresep.tab[id].bahan[i]=timentah.tab[j].nama) then
						begin
							found1:=true;
							sum:=sum+timentah.tab[j].jml;
						end;
					end;
					
					//cek inventori olahan
					j:=1;
					while (j<=tiolah.neff) and not(found1) do
					begin
						if (tresep.tab[id].bahan[i]=tiolah.tab[j].nama) then
						begin
							sum:=sum+tiolah.tab[j].jml;
						end;	
						j:=j+1;						
					end;
					
					i:=i+1;
					if (sum<jml) then found:=false;
				end;
				
				if (found) then
				begin
					writeln ('Penjualan sukses!');

					//mengurangi inventori
					i:=1;
					while (i<=tresep.tab[id].n) do
					begin
						//inventori mentah
						j:=1;
						found1:=false;
						sum:=jml;
						while (j<=timentah.neff) and (sum>0) do
						begin
							if (tresep.tab[id].bahan[i]=timentah.tab[j].nama) then
							begin
								found1:=true;
								if (timentah.tab[j].jml>sum) then 
								begin
									timentah.tab[j].jml:=timentah.tab[j].jml-sum;
									sum:=0;
								end
								else //sum>=jumlah bahan olahan
								begin
									sum:=sum-timentah.tab[j].jml;
									timentah.tab[j].jml:=0;
								end;
							end;
							j:=j+1;
						end;
						
						//inventori olahan
						j:=tiolah.neff;
						while (j>=1) and (sum>0) and not(found1) do
						begin
							if (tresep.tab[id].bahan[i]=tiolah.tab[j].nama) then
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
							j:=j-1;
						end;
						
						i:=i+1;
					end;
					
					//menggeser inventori bahan mentah yang kosong
					sum:=0;
					for j:=1 to timentah.neff do
					begin
						if (timentah.tab[j].jml = 0) then
						begin
							sum:=sum+1;
							for k:=j to timentah.neff-sum do
							begin
								timentah.tab[k]:=timentah.tab[k+1];
							end;
						end;
					end;
					timentah.neff:=timentah.neff-sum;
					
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
					tsimulasi.tab[idx].nResepJ := tsimulasi.tab[idx].nResepJ+jml;
					tsimulasi.tab[idx].msk := tsimulasi.tab[idx].msk+tresep.tab[id].harga*jml;
					tsimulasi.tab[idx].uang := tsimulasi.tab[idx].uang+tresep.tab[id].harga*jml;
				end
				else
				begin
					writeln ('Bahan kurang.');
				end;
			end
			else
			begin
				writeln('Nama resep tidak ditemukan.')
			end;
		end;
	end;
end.