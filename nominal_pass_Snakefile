#This is for running QTLtools nominal pass in cis

BASE = '/u/project/zarlab/hjp/geuvadis_data'

CHROMOSOMES = list(range(1,23))
#for i in range(22):
    #CHROMOSOMES.append(i+1)

CHROMOSOMES = sorted(CHROMOSOMES)[21]

rule all:
    input:
        expand('/u/project/zarlab/yiwen99/QTLtools_pipeline/nominal_pass/results/nominal_{chr_num}.txt',chr_num=CHROMOSOMES)


rule nominal:
    input:
        genotypes = BASE + '/annotation/genotypes_yri.vcf.gz',
        phenotypes = BASE + '/qtltools/kallisto_scaled_tpm/qqnorm_{chr_num}.bed.gz',
        covariates = BASE + '/qtltools/qtl_shared/covariates.txt',
    output:
        "/u/project/zarlab/yiwen99/QTLtools_pipeline/nominal_pass/results/nominal_{chr_num}.txt"
    threads:
        1
    shell: """
        QTLtools cis --vcf {input.genotypes} --bed {input.phenotypes} --cov {input.covariates} --nominal 1 --out /u/project/zarlab/yiwen99/QTLtools_pipeline/nominal_pass/results/nominal_{wildcards.chr_num}.txt --include-sample /u/project/zarlab/hjp/geuvadis_data/annotation/yri_sample_intersection.txt
        """
