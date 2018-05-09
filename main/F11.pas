unit F11;
interface
	uses bentukan;
	function searchMentah (C:string;D:tabMentah):integer;
	function hitungExpire(E:tabMentah;F:tabiMentah;id:integer):integer;
	procedure cekExpire(var G:tabMentah;var H:tabiMentah;var J:tabsimulasi;x:integer);
	procedure cekExpireOl(var K:tabiOlah;var M:tabsimulasi;y:integer);
	Procedure ProgramTidur(var A:tabsimulasi;var B:jumlahAksi;var T:tabMentah;var U:tabiMentah;var V:tabiOlah;i:integer);
implementation

function searchMentah(C:string;D:tabMentah):integer; 
{Fungsi untuk mencari tanggal kadaluarsa dari sebuah bahan mentah}
var
	i,index:integer;
begin
	i:=1;
	while((i<=D.neff) and (D.tab[i].nama<>c))do {kondisi pengulangan}
	begin
		i:=i+1;
	end;
	if(D.tab[i].nama=c)then {Kondisi jika telah ditemukan}
	begin
		index:=i;
	end; {Asumsi yang harus dicari ada}
	searchMentah:=D.tab[index].exp;
end;

function hitungExpire(E:tabMentah;F:tabiMentah;id:integer):integer;
{fungsi untuk menghitung tanggal kadaluarsa dari bahan mentah}
var
	hasil:integer;
begin
	hasil:=F.tab[id].tgl.day+searchMentah(F.tab[id].nama,E);
	hitungExpire:=hasil;
end;

procedure cekExpire(var G:tabMentah;var H:tabiMentah;var j:tabsimulasi;x:integer);
{Prosedur untuk mengecek apakah bahan sudah kadaluarsa, dan jika sudah maka akan dihapus}
var
	tglexp,k,s:integer;
begin   s:=1;
	while(s<=H.neff)do
	begin
		tglexp:=hitungExpire(G,H,s);
		if((tglexp=j.tab[x].tgl.day+j.tab[x].hari-1)and(H.tab[s].tgl.month=j.tab[x].tgl.month)and(H.tab[s].tgl.year=j.tab[x].tgl.year))then
		begin
			for k:=s to H.neff-1 do
			begin
				H.tab[k]:=H.tab[k+1]; {penghapusan data pada yang kadaluarsa}
			end;
                        s:=s-1;
			H.neff:=H.neff-1;
		end;
                s:=s+1;
	end;
end;

procedure cekExpireOl(var K:tabiOlah;var M:tabsimulasi;y:integer);
{Prosedur untuk mengecek apaah bahan olahan sudah kadaluarsa, dan jika sudah makan akan dihapus}
var
	i,j:integer;
begin
        I:=1;
	while (i<=K.neff) do
	begin
		if((K.tab[i].tgl.day+3=M.tab[y].tgl.day+M.tab[y].hari-1)and(K.tab[i].tgl.month=M.tab[y].tgl.month)and(K.tab[i].tgl.year=M.tab[y].tgl.year))then
		begin
			for j:=i to K.neff-1 do
			begin
				K.tab[j]:=K.tab[j+1]; {penghapusan data pada yang kadaluarsa}
			end;
                        i:=i-1;
			K.neff:=K.neff-1;
		end;
                i:=i+1;
	end;
end;

Procedure ProgramTidur(var A:tabsimulasi;var B:jumlahAksi;var T:tabMentah;var U:tabiMentah;var V:tabiOlah;i:integer);
{Prosedur yang akan dipanggil di program utama}
begin
	if ((A.tab[i].energi<10)or(B.makan>=1)or(B.istirahat>=1))then {kondisi supaya bisa tidur, yaitu harus melakukan aksi lain terlebih dahulu}
	begin
		cekExpire(T,U,A,i);
		cekExpireOl(V,A,i);
		A.tab[i].hari:=A.tab[i].hari+1;
		B.makan:=0;
		B.istirahat:=0;
		A.tab[i].energi:=10;
		writeln('selamat pagi!');
	end else {A.tab[i].energi=10 and B.makan=0 and B.istirahat=0}
	begin
		writeln('Harus melakukan aksi lain terlebih dahulu');
	end;
end;

end.
	
	
