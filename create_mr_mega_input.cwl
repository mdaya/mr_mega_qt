class: CommandLineTool
cwlVersion: v1.1
label: create_mr_mega_input
doc: A tool that given a list of GDS files and a list of GENESIS single variant association RData files, creates a file to include in a MR-MEGA meta-analysis for a quantitative trait
$namespaces:
  sbg: https://sevenbridges.com

requirements:
- class: ShellCommandRequirement
- class: DockerRequirement
  dockerPull: dayam/mr_mega:latest

inputs:
- id: output_file_name
  label: output_file_name
  doc: Output file name
  type: string
  inputBinding:
    position: 0
    shellQuote: false
- id: genesis_results_rdata
  label: genesis_results_rdata
  doc: RData files from GENESIS single variant association output
  type: File[]
  inputBinding:
    position: 1
    shellQuote: false
  sbg:fileTypes: .RData
- id: gds_files
  label: gds_files
  doc: |-
    GDS files used in GENESIS single variant association tests, to look up variant details
  type: File[]
  inputBinding:
    position: 2
    shellQuote: false
  sbg:fileTypes: .gds

outputs:
- id: output_file
  label: output_file
  doc: Output file containing results in the MR-MEGA format
  type: File
  outputBinding:
    glob: '*.txt'
  sbg:fileTypes: .txt

baseCommand:
- bash /home/analyst/create_mr_mega_input.sh

hints:
- class: sbg:AWSInstanceType
  value: c4.large;ebs-gp2;1024
id: |-
  https://api.sb.biodatacatalyst.nhlbi.nih.gov/v2/apps/midaya/gwas-topmed-sarp-white/create-mr-mega-input/0/raw/
sbg:appVersion:
- v1.1
sbg:content_hash: acab6509dad4abc3c72791e27eebda277cb1b827f8d3e6589ecae45308140408a
sbg:contributors:
- midaya
sbg:copyOf: midaya/gwas-fhs-nontopmed-white/create-mr-mega-input/1
sbg:createdBy: midaya
sbg:createdOn: 1606305287
sbg:id: midaya/gwas-topmed-sarp-white/create-mr-mega-input/0
sbg:image_url:
sbg:latestRevision: 0
sbg:modifiedBy: midaya
sbg:modifiedOn: 1606305287
sbg:project: midaya/gwas-topmed-sarp-white
sbg:projectName: GWAS_TOPMed_SARP_white
sbg:publisher: sbg
sbg:revision: 0
sbg:revisionNotes: Copy of midaya/gwas-fhs-nontopmed-white/create-mr-mega-input/1
sbg:revisionsInfo:
- sbg:modifiedBy: midaya
  sbg:modifiedOn: 1606305287
  sbg:revision: 0
  sbg:revisionNotes: Copy of midaya/gwas-fhs-nontopmed-white/create-mr-mega-input/1
sbg:sbgMaintained: false
sbg:validationErrors: []
