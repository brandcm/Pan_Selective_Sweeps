#!/bin/bash
#$ -N generate_masks
#$ -M colin.brand@ucsf.edu
#$ -m ae
#$ -cwd
#$ -o ~/../../../group/capra/projects/pan_sweeps/scripts/1_generate_masks_and_simulated_data/generate_masks.out
#$ -e ~/../../../group/capra/projects/pan_sweeps/scripts/1_generate_masks_and_simulated_data/generate_masks.err
#$ -l h_rt=24:00:00
#$ -l mem_free=50G

# load modules
module load bedtools/2.28.0

# change directories
cd ../../data/masked_fastas

# define variables
chrs=('chr1' 'chr2A' 'chr2B' 'chr3' 'chr4' 'chr5' 'chr6' 'chr7' 'chr8' 'chr9' 'chr10' 'chr11' 'chr12' 'chr13' 'chr14' 'chr15' 'chr16' 'chr17' 'chr18' 'chr19' 'chr20' 'chr21' 'chr22' )
mapfile -t samples < ../metadata/sample_names.txt
pops=('ppn' 'pte' 'pts' 'ptt' 'ptv' )

# write a check length function to ensure we are mergining samples with an equal number of nucleotides
check_length() {
	input_file=$1
	correct_length=$(awk -v key="$c" '$1==key { print $2 }' ../metadata/panTro6_chr_lengths.txt)
	actual_length=$(wc -l < $input_file)
	if [[ $actual_length -ne $correct_length ]]; then
		echo "$input_file has incorrect length."
	fi
}

generate_pos_file() {
  chr_length=$(awk -v key="$c" '$1==key { print $2 }' ../metadata/panTro6_chr_lengths.txt)
  seq 1 $chr_length > "$c".tmp
}

# unmerge bed files
for s in ${samples[@]}; do for c in ${chrs[@]}; do zcat ../mosdepth/$s.pantro6.total.total.nodups_mapq30.per-base.bed.gz | awk -v chromosome="$c" '$1==chromosome {for(i=$2;i<$3;i++) print$4}' > "$s"_"$c".tmp; done & done
wait

# count lines
for s in ${samples[@]}; do for c in ${chrs[@]}; do check_length "$s"_"$c".tmp ../metadata/panTro6_chr_lengths.txt; done & done
wait

# continue if all files are correct length
if [ -s ../first_filter.out ]; then
  echo "quitting"
  exit
fi

# generate files with chr and pos
for c in ${chrs[@]}; do generate_pos_file; done
for c in ${chrs[@]}; do awk -v chromosome="$c" '{print chromosome,$1}' OFS='\t' "$c".tmp > "$c".tmp2; done

# concatenate the chr and pos files
for c in ${chrs[@]}; do cat "$c".tmp2 >> all_autosomes.tmp; done

# make a copy of the concatenated chr and pos file per population
mv all_autosomes.tmp ppn.tmp && cp ppn.tmp pte.tmp && cp ppn.tmp pts.tmp && cp ppn.tmp ptt.tmp && cp ppn.tmp ptv.tmp

# concatenate depth files
for s in ${samples[@]}; do for c in ${chrs[@]}; do cat "$s"_"$c".tmp >> "$s".tmp; done & done
wait

# merge per population with chr and pos
paste ppn.tmp Bono.tmp Catherine.tmp Chipita.tmp Desmond.tmp Dzeeta.tmp Hermien.tmp Hortense.tmp Kombote.tmp Kosana.tmp Kumbuka.tmp LB502.tmp Natalie.tmp Salonga.tmp > ppn_per_site_depth.tmp
paste pte.tmp Akwaya-Jean.tmp Banyo.tmp Basho.tmp Damian.tmp Julie_LWC21.tmp Kopongo.tmp Koto.tmp Paquita.tmp Taweh.tmp Tobi.tmp > pte_per_site_depth.tmp
paste pts.tmp Andromeda.tmp Athanga.tmp Bihati.tmp Bwamble.tmp Cindy_schwein.tmp Cleo.tmp Coco_chimp.tmp Frederike.tmp Harriet.tmp Ikuru.tmp Kidongo.tmp Maya.tmp Mgbadolite.tmp Nakuu.tmp Padda.tmp Tongo.tmp Trixie.tmp Vincent.tmp Washu.tmp > pts_per_site_depth.tmp
paste ptt.tmp Alfred.tmp Blanquita.tmp Brigitta.tmp Cindy_troglodytes.tmp Clara.tmp Doris.tmp Gamin.tmp Julie_A959.tmp Lara.tmp Luky.tmp Marlin.tmp Mirinda.tmp Negrita.tmp Noemie.tmp Tibe.tmp Ula.tmp Vaillant.tmp Yogui.tmp > ptt_per_site_depth.tmp
paste ptv.tmp Alice.tmp Annie.tmp Berta.tmp Bosco.tmp Cindy_verus.tmp Clint.tmp Jimmie.tmp Koby.tmp Linda.tmp Mike.tmp SeppToni.tmp > ptv_per_site_depth.tmp

# extract low-coverage regions in BED format for masking per population
awk '{ failed = 0; for (i = 3; i <= NF; ++i) if ($i < 10) ++failed; if (failed > 3) print $1,$2-1,$2 }' OFS='\t' ppn_per_site_depth.tmp > ppn_mask.tmp
awk '{ failed = 0; for (i = 3; i <= NF; ++i) if ($i < 10) ++failed; if (failed > 2) print $1,$2-1,$2 }' OFS='\t' pte_per_site_depth.tmp > pte_mask.tmp
awk '{ failed = 0; for (i = 3; i <= NF; ++i) if ($i < 10) ++failed; if (failed > 4) print $1,$2-1,$2 }' OFS='\t' pts_per_site_depth.tmp > pts_mask.tmp
awk '{ failed = 0; for (i = 3; i <= NF; ++i) if ($i < 10) ++failed; if (failed > 4) print $1,$2-1,$2 }' OFS='\t' ptt_per_site_depth.tmp > ptt_mask.tmp
awk '{ failed = 0; for (i = 3; i <= NF; ++i) if ($i < 10) ++failed; if (failed > 3) print $1,$2-1,$2 }' OFS='\t' ptv_per_site_depth.tmp > ptv_mask.tmp

# merge BED intervals
for p in ${pops[@]}; do bedtools merge -i "$p"_mask.tmp > merged_"$p"_mask.bed & done
wait

# generate masked FASTAs
for p in ${pops[@]}; do bedtools maskfasta -fi filtered_filtered_panTro6.fa -bed merged_"$p"_mask.bed -fo "$p"_panTro6_masked.fa & done
wait

# remove .tmp files
# ensure no other files in this directory have a .tmp extension
rm *.tmp && rm *.tmp2
