class: CommandLineTool
cwlVersion: v1.1
label: run_mr_mega
doc: A tool that given a list of files in the MR-MEGA input format, runs MR-MEGA for a quantitative trait
$namespaces:
  sbg: https://sevenbridges.com

requirements:
- class: ShellCommandRequirement
- class: DockerRequirement
  dockerPull: quay.io/mdaya/mr_mega_qt:1.0

inputs:
- id: nr_pcs
  label: nr_pcs
  doc: Number PCs for MR-MEGA
  type: int
  inputBinding:
    position: 0
    shellQuote: false
- id: mr_mega_input_files
  label: mr_mega_input_files
  doc: MR-MEGA input files
  type: File[]?
  inputBinding:
    position: 1
    shellQuote: false

outputs:
- id: mr_mega_output
  label: mr_mega_output
  doc: MR-MEGA output
  type: File
  outputBinding:
    glob: mrmega_results.txt.result
  sbg:fileTypes: .txt

baseCommand:
- bash /home/analyst/run_mr_mega.sh
id: |-
  https://api.sb.biodatacatalyst.nhlbi.nih.gov/v2/apps/midaya/mrmega/run-mr-mega/2/raw/
sbg:appVersion:
- v1.1
sbg:content_hash: acd49baf4185ff1862746316f38af556fefccc1f42a6a977b903da4818f61b7e6
sbg:contributors:
- midaya
sbg:createdBy: midaya
sbg:createdOn: 1606273972
sbg:id: midaya/mrmega/run-mr-mega/2
sbg:image_url:
sbg:latestRevision: 2
sbg:modifiedBy: midaya
sbg:modifiedOn: 1606321605
sbg:project: midaya/mrmega
sbg:projectName: MRMEGA
sbg:publisher: sbg
sbg:revision: 2
sbg:revisionNotes: Changed output file name
sbg:revisionsInfo:
- sbg:modifiedBy: midaya
  sbg:modifiedOn: 1606273972
  sbg:revision: 0
  sbg:revisionNotes:
- sbg:modifiedBy: midaya
  sbg:modifiedOn: 1606274182
  sbg:revision: 1
  sbg:revisionNotes: Initial version
- sbg:modifiedBy: midaya
  sbg:modifiedOn: 1606321605
  sbg:revision: 2
  sbg:revisionNotes: Changed output file name
sbg:sbgMaintained: false
sbg:validationErrors: []
