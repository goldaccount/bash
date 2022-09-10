#!/bin/zsh
#extract file to path (-o) with password (-p) and overwrite mode skip (-ao)
#7z e 1116261353.rar -o"../o/奥華子_PRISM" -pZuQdLV1dZw -aos

input=$1
output=$2
pass=$3

extract() {
	7z e $1 -o$2 -p$3 -aos
}

getpass() {
	for x in $(ls *.rar);
	do
		id=${x/.rar/};
		pass=$(grep -A1 -E 'katfile.*'$x index3 | tail -1);
		zip=${x};
		name=$(grep -B3 -E 'katfile.*'$x index3 | head -1 | \
		sed -E 's/\s+\(20.*$//' | \
		sed -E 's/.(Single|Album).\s?//' | \
		sed -E 's/HOLOLIVE IDOL PROJECT(:|\s)+//' | \
		sed -E 's/(\s+|\s-\s)/_/g' \
		)
	case $name in
		AZK*)
			xdir="../AZKi/"${name};
			;;
		La_prière*|*priere*|*Priere*)
			xdir="../nayuta/"${name};
			;;
		HACHI*)
			xdir="../HACHI/"${name};
			;;
		*Calliope*|*IRyS*|*おかゆ*|*Kobo*|*アキ*|*まつり*|*フブキ*|*ときのそら*|*常闇トワ*|*夜空メル*|*ぺこら*|鷹嶺ルイ*|*わため*|*フレア*|*九十九*|*ノエル*|*小鳥遊キアラ*|*HOLOLIVE*)
			xdir="../HLL/Songs/"${name};
			;;
		*ヨルシカ*)
			xdir="../Yorushika/"${name};
			;;

		*CHiCO*|*Honeywork*|*HoneyWork*|*HONEYWORK*)
			xdir="../Honeyworks/"${name};
			;;

		*YOASOBI*)
			xdir="../YOASOBI/"${name};
			;;
#		*)
#			xdir=../${name};
#			;;
		nayuta*)
			xdir="../nayuta/"${name};
			;;
		*理芽*|*V.W.P*|VALIS*|*可不*|*花譜*)
			xdir="../KAMITSUBAKI/"${name};
			;;
		KANARIA*)
			xdir="../Vocaloid/"${name};
			;;
		Ado*)
			xdir="../Ado/"${name};
			;;
		*)
			xdir="../o/"${name};
			;;
	esac
	output=${xdir}
#	echo $pass"\t"$xdir
	extract $x $xdir $pass
	done;
}

getpass;
