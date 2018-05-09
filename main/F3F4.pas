unit F3F4;

interface
uses bentukan, F12;

	procedure StartSimulasi (var tsimulasi : tabsimulasi; var t1Mentah : tabMentah; var t1Olah : tabOlah; var t1iMentah : tabiMentah; var t1iOlah : tabiOlah; var t1resep : tabresep; var idx:integer; var JA:jumlahAksi);
	{I.S.: simulasi belum dimulai}
	{F.S.: memulai simulasi sehingga semua fitur dapat digunakan}				
	procedure StopSimulasi(var stop : boolean; tsimulasi : tabsimulasi;JA:jumlahAksi;idx:integer);
	{I.S.: simulasi sedang berjalan}
	{F.S.: menghentikan simulasi dan memperlihatkan statistik saat itu}				
implementation 

	procedure StopSimulasi(var stop : boolean; tsimulasi : tabsimulasi;JA:jumlahAksi;idx:integer);
	{ALGORITMA}
	begin
		lihatStatistik(tsimulasi,JA,idx); //lihat statistik
		stop := true; //simulasi berhenti
	end;

procedure StartSimulasi (var tsimulasi : tabsimulasi; var t1Mentah : tabMentah; var t1Olah : tabOlah; var t1iMentah : tabiMentah; var t1iOlah : tabiOlah; var t1resep : tabresep; var idx:integer; var JA:jumlahAksi);
	{KAMUS}
var
	s: string;//input pengguna saat akan memulai simulasi
	{ALGORITMA}
begin
	JA.makan:=0; 
	JA.istirahat:=0;
	readln(s); //input start x
	delete(s,1,6); //menghapus tulisan 'start ' sgar tersisa x saja
	val(s,idx);//mengubah x ke integer
	while (idx>10) or (idx<1) do //validasi input simulasi
	begin
	writeln ('Simulasi tidak tersedia');
	write('> ');readln(s);
	delete(s,1,6);
	val(s,idx);
	end;
end;

end.
