Program EngisKitchen;
{Simulasi Engi's Kitchen selama maksimum 10 hari}

{KAMUS}
uses bentukan,F1,F2,F3F4,F5,F6,F7,F8,F9,F10,F11,F12,F13,F14,F15, F16,F17;

var 
	tMentah 		: tabMentah; //array file bahan mentah
	tOlah 			: tabOlah; //array file bahan olahan
	tiMentah		: tabiMentah; //array file inventori bahan mentah
	tiOlah 			: tabiOlah; //array file inventori bahan olahan
	tresep 			: tabresep; //array file resep
	tsimulasi 		: tabsimulasi; //array file simulasi
	idx 			: integer; //nomer simulasi yang sedang dimainkan
	name			: string; //nama pemain
	opt				: string; //option (pilihan) menu
	halutama		: boolean; //mengecek apakah sudah dijalankan fitur exit
	halsimulasi		: boolean; //mengecek apakah sudah dijalankan fitur stop simlasi
	JA				: jumlahAksi; //varibel penampung jumlah aksi makan dan istirahat
	
{ALGORITMA PROGRAM UTAMA}
begin
	halutama := true;
	writeln ('Hi, Chef! Selamat datang di Engi`s Kitchen.');
	writeln ('Siapa namamu? ');
	write ('> ');
	readln (name);
	repeat
		writeln ('Nah ', name,', sekarang masukkan satu dari beberapa pilihan di bawah:');
		writeln ('1. load');
		writeln ('2. exit');
		writeln ('3. start simulasi');
		write ('> ');
		readln (opt);
		case opt of
			'load' : 
			begin
				load (tMentah, tOlah,tiMentah, tiOlah, tresep, tsimulasi);
			end;
			'exit' : 
			begin
				exit (tMentah, tOlah,tiMentah, tiOlah, tresep, tsimulasi);
				halutama:=false;
			end;
			'start simulasi' : 
			begin
				writeln ('Perjalananmu sebagai Chef dimulai sekarang.');
				writeln ('Masukkan nomer simulasi yang ingin dimainkan dengan format "start x", x adalah nomer simulasi.');
				write ('> ');
				StartSimulasi (tsimulasi, tMentah, tOlah, tiMentah,tiOlah, tresep,idx,JA);
				if (tsimulasi.tab[idx].hari=1) then writeln ('Sebagai permulaan kamu dapat melihat daftar aksi dengan perintah "help".');
				repeat
					if (tsimulasi.tab[idx].hari=11) then
					begin
						halsimulasi:=true;
						writeln ('Terima kasih ',name,' kamu telah berhasil menjadi chef selama 10 hari!');
						writeln ('Press any key to continue.');
						readln;
					end
					else
					begin
						halsimulasi:=false;
						writeln ('Masa depan Engi`s Kitchen ada di tanganmu, lakukan sesuatu, ',name,'!');
						write ('>> ');
						readln (opt);
						case opt of
							'stop simulasi' :
							begin
								StopSimulasi (halsimulasi,tsimulasi,JA,idx);
							end;
							'beli bahan':
							begin
								belibahan (tmentah, timentah, tsimulasi,tiolah,idx);
							end;
							'olah bahan':
							begin
								olahBahan (tsimulasi,tolah,tMentah,tiOlah,tiMentah,idx);
							end;
							'jual olahan':
							begin
								jualolahan (tolah, tiolah, tsimulasi,idx);
							end;
							'jual resep':
							begin
								jualresep (timentah,tiolah,tresep,tsimulasi, idx);
							end;
							'makan':
							begin
								programMakan(tsimulasi,JA, idx);
							end;
							'istirahat':
							begin
								programIstirahat(tsimulasi,JA, idx);
							end;
							'tidur':
							begin
								ProgramTidur(tsimulasi, JA, tMentah, tiMentah, tiOlah,idx);
							end;
							'lihat statistik':
							begin
								lihatStatistik(tsimulasi,JA,idx);
							end;
							'lihat inventori':
							begin
								lihatInventori(tiMentah, tiOlah);
							end;
							'lihat resep':
							begin
								lihatResep(tresep);
							end;
							'cari resep':
							begin
								cariResep(tresep);
							end;
							'tambah resep':
							begin
								tambahResep(tresep,tMentah,tOlah);
							end;
							'upgrade inventori':
							begin
								upgradeInventori(tsimulasi,idx);
							end;
							'help':
							begin
								writeln ('Daftar Aksi: ');
								writeln ('1. stop simulasi');
								writeln ('2. beli bahan');
								writeln ('3. olah bahan');
								writeln ('4. jual olahan');
								writeln ('5. jual resep');
								writeln ('6. makan');
								writeln ('7. istirahat');
								writeln ('8. tidur');
								writeln ('9. lihat statistik');
								writeln ('10. lihat inventori');
								writeln ('11. lihat resep');
								writeln ('12. cari resep');
								writeln ('13. tambah resep');
								writeln ('14. upgrade inventori');
								writeln ('15. help')
							end;
							else 
							begin
								writeln ('Aksi tidak valid.');
								writeln ('Coba ketik help untuk melihat aksi.')
							end;
						end; 
					end;
				until (halsimulasi);
			end; 
			else 
			begin
				writeln ('Oops..');
				writeln (name, ', sepertinya masukanmu tidak valid');
				writeln	('Coba cek huruf besar dan kecil')
			end;
		end;
	until not (halutama);
end.
