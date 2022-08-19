nextflow.enable.dsl=2

include { lifebitai_traits_gcta_greml_1 } from './modules/lifebitai_traits_gcta_greml_1/module.nf'
include { lifebitai_traits_gcta_greml_2 } from './modules/lifebitai_traits_gcta_greml_2/module.nf'
include { lifebitai_gwas_1 } from './modules/lifebitai_gwas_1/module.nf'

workflow {
input1 = Channel.fromPath(params.input1)
input2 = Channel.fromPath(params.input2)
input3 = Channel.fromPath(params.input3).splitCsv()
lifebitai_traits_gcta_greml_1(input1, input2)
lifebitai_gwas_1(input3, lifebitai_traits_gcta_greml_1.out.output1)
lifebitai_traits_gcta_greml_2(lifebitai_traits_gcta_greml_1.out.output1, lifebitai_traits_gcta_greml_1.out.output1)
}
