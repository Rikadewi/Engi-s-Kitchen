unit F6;

interface
	uses bentukan;
	procedure olahBahan (var tsimulasi: tabsimulasi; tolah: tabOlah; tmentah: tabMentah; var tiolah: tabiOlah; var timentah:tabiMentah;idx:integer );
	{I.S.: tsimulasi,tolah,tMentah,tiOlah,tiMentah,idx terdefinisi
		asumsi jika ada bahan dengan nama sama maka bahan dengan tanggal pembelian yang lebih lama/lebih duluan dibeli akan ditempatkan duluan urutannya pada timentah dan tiolah}
	{F.S.: melakukan aktivitas pengolahan bahan mentah menjadi bahan olahan. Pembuatan bahan olahan mengurangi inventori bahan mentah, menambah inventori bahan olahan, dan mengurangi energi Chef sebanyak 1 buah. Tidak bisa membuat bahan olahan jika bahan mentah }
	
implementation
	procedure olahBahan (var tsimulasi: tabsimulasi; tolah: tabOlah; tmentah: tabMentah; var tiolah: tabiOlah; var timentah:tabiMentah;idx:integer );
	{KAMUS}
	var
		s: string; //nama bahan
		jml: integer; //jumlah yang akan diolah
		i,j,k:integer; //elemen looping
		found,found1,found2 : boolean; //pengecek
		id: integer; //indeks bahan ditemukan di array olahan
		sum:integer; //jumlah bahan sementara
	{ALGORITMA}
	begin
		if (tsimulasi.tab[idx].energi<1) then writeln ('Energi tidak cukup.')
		else
		begin
			write ('Masukkan nama bahan olahan : ');
			readln (s);
			i:=1;
			found:=false;
			while (i<=tolah.neff) and not (found) do
			begin
				if(s=tolah.tab[i].nama) then
				begin
					found:=true;
					id:=i;
				end;
				i:=i+1;
			end;
			if found then
			begin
				//Cek Jumlah Bahan
				repeat
					write ('Masukkan jumlah bahan yang mau diolah : ');
					readln (jml);
					if (jml<=0) then writeln ('Jumlah tidak valid.')
				until (jml>0);
				j:=1;
				found1:=false; 
				while (j<=tolah.tab[id].n) and not(found1) do //mengecek jumlah tiap bahan mentah
				begin
					sum:=0;
					for k:=1 to timentah.neff do //mengecek semua untuk mengantisipasi nama bahan mentah sama tapi tanggal beli berbeda
					begin
						if (tolah.tab[id].bahan[j]=timentah.tab[k].nama) then
						begin
							sum:=sum+timentah.tab[k].jml;
						end;
					end;
					j:=j+1;
					if (sum<jml) then found1:=true;
				end;
				if found1 then writeln ('Jumlah bahan kurang.')
				else //bahan mentah mencukupi
				begin
					writeln('Pengolahan berhasil!');
					//mengurangi inventori bahan mentah
					j:=1;
					while (j<=tolah.tab[id].n) do
					begin
						k:=1;
						sum:=jml;
						while (k<=timentah.neff) and (sum>0) do
						begin
							if (tolah.tab[id].bahan[j]=timentah.tab[k].nama) then
							begin
								if (timentah.tab[k].jml>sum) then 
								begin
									timentah.tab[k].jml:=timentah.tab[k].jml-sum;
									sum:=0;
								end
								else //sum>=jumlah bahan olahan
								begin
									sum:=sum-timentah.tab[k].jml;
									timentah.tab[k].jml:=0;
								end;
							end;
							k:=k+1;
						end;
						j:=j+1;
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
					
					//menambah inventori bahan olahan
					j:=1;
					found2:=false;
					while (j<=tiolah.neff) and not(found2) do
					begin
						if (s=tiolah.tab[j].nama) then
						begin
							if (tsimulasi.tab[idx].tgl.day+tsimulasi.tab[idx].hari-1 = tiolah.tab[j].tgl.day) then 
							begin
								tiolah.tab[j].jml:=tiolah.tab[j].jml+jml;
								found2:=true;
							end;
						end;
						j:=j+1;
					end; 
					if not(found2) then
					begin
						tiolah.neff:=tiolah.neff+1;
						tiolah.tab[tiolah.neff].nama:=s;
						tiolah.tab[tiolah.neff].tgl.day:=tsimulasi.tab[idx].tgl.day+tsimulasi.tab[idx].hari-1;
						tiolah.tab[tiolah.neff].tgl.month:=tsimulasi.tab[idx].tgl.month;
						tiolah.tab[tiolah.neff].tgl.year:=tsimulasi.tab[idx].tgl.year;
						tiolah.tab[tiolah.neff].jml:=jml;
					end;
					 
					//perubahan file simulasi
					tsimulasi.tab[idx].energi:=tsimulasi.tab[idx].energi-1;  
					tsimulasi.tab[idx].nOlahanB := tsimulasi.tab[idx].nOlahanB+jml;
				end;
			end
			else // nama bahan olahan tidak ditemukan
			begin
				writeln ('Nama bahan olahan tidak ditemukan.');
			end;
		end;
	end;
end.