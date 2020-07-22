#This is for running QTLtools nominal pass in cis

BASE = '/u/project/zarlab/hjp/geuvadis_data'

CHROMOSOMES = []
for i in range(22):
    CHROMOSOMES.append(i+1)

CHROMOSOMES = sorted(CHROMOSOMES)[0]

rule all:
    input:
        expand('/u/project/zarlab/yiwen99/QTLtools_pipeline/nominal_pass/results/nominal_{chr_num}.txt',chr_num=CHROMOSOMES)


rule nominal:
    input:
        genotypes = BASE + '/annotation/genotypes_yri.vcf.gz',
        phenotypes = expand(BASE + '/qtltools/kallisto_scaled_tpm/qqnorm_{chr_num}.bed.gz',chr_num=CHROMOSOMES),
        covariates = BASE + '/qtltools/qtl_shared/covariates.txt',
        #region = expand('chr{chr_num}',chr_num=CHROMOSOMES)
    output:
        "/u/project/zarlab/yiwen99/QTLtools_pipeline/nominal_pass/results/nominal_{chr_num}.txt"
    threads:
        1
    shell: """
        QTLtools cis --vcf {input.genotypes} --bed {input.phenotypes} --cov {input.covariates} --nominal 0.01 --region chr{wildcards.chr_num} --out /u/project/zarlab/yiwen99/QTLtools_pipeline/nominal_pass/results/nominal_{wildcards.chr_num}.txt
        """
