class: CommandLineTool
cwlVersion: v1.1
label: run_metal
doc: A tool that given a list of files in the MR-MEGA input format, runs METAL inverse-variance meta-analysis for a quantitative trait
$namespaces:
  sbg: https://sevenbridges.com

requirements:
- class: ShellCommandRequirement
- class: DockerRequirement
  dockerPull: dayam/mr_mega:latest

inputs:
- id: out_file_prefix
  label: out_file_prefix
  doc: Prefix for output METAL file
  type: string
  inputBinding:
    position: 0
    shellQuote: false
- id: mr_mega_input_files
  label: mr_mega_input_files
  doc: Input files created for MR-MEGA
  type: File[]
  inputBinding:
    position: 1
    shellQuote: false

outputs:
- id: metal_output
  label: metal_output
  doc: METAL output file
  type: File
  outputBinding:
    glob: '*.tbl'
  sbg:fileTypes: .tbl

baseCommand:
- bash /home/analyst/run_metal.sh

hints:
- class: sbg:AWSInstanceType
  value: c4.2xlarge;ebs-gp2;1024
id: |-
  https://api.sb.biodatacatalyst.nhlbi.nih.gov/v2/apps/midaya/mrmega/run-metal/1/raw/
sbg:appVersion:
- v1.1
sbg:content_hash: a987eb64280932af2bae4fce915cccbd93f365a36a80675620df05aa0058f926d
sbg:contributors:
- midaya
sbg:createdBy: midaya
sbg:createdOn: 1611334884
sbg:id: midaya/mrmega/run-metal/1
sbg:image_url:
sbg:latestRevision: 1
sbg:modifiedBy: midaya
sbg:modifiedOn: 1611335221
sbg:project: midaya/mrmega
sbg:projectName: MRMEGA
sbg:publisher: sbg
sbg:revision: 1
sbg:revisionNotes: Initial version
sbg:revisionsInfo:
- sbg:modifiedBy: midaya
  sbg:modifiedOn: 1611334884
  sbg:revision: 0
  sbg:revisionNotes:
- sbg:modifiedBy: midaya
  sbg:modifiedOn: 1611335221
  sbg:revision: 1
  sbg:revisionNotes: Initial version
sbg:sbgMaintained: false
sbg:validationErrors: []
