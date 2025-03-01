cwlVersion: v1.0
steps:
  read-potential-cases-fhir:
    run: read-potential-cases-fhir.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule1
  coronary-heart-disease-not-otherwise-specified-ischaemia---primary:
    run: coronary-heart-disease-not-otherwise-specified-ischaemia---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule2
      potentialCases:
        id: potentialCases
        source: read-potential-cases-fhir/output
  coronary-heart-disease-not-otherwise-specified-review---primary:
    run: coronary-heart-disease-not-otherwise-specified-review---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule3
      potentialCases:
        id: potentialCases
        source: coronary-heart-disease-not-otherwise-specified-ischaemia---primary/output
  coronary-heart-disease-not-otherwise-specified-subacute---primary:
    run: coronary-heart-disease-not-otherwise-specified-subacute---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule4
      potentialCases:
        id: potentialCases
        source: coronary-heart-disease-not-otherwise-specified-review---primary/output
  coronary-heart-disease-not-otherwise-specified-aborted---primary:
    run: coronary-heart-disease-not-otherwise-specified-aborted---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule5
      potentialCases:
        id: potentialCases
        source: coronary-heart-disease-not-otherwise-specified-subacute---primary/output
  coronary-heart-disease-not-otherwise-specified-forms---primary:
    run: coronary-heart-disease-not-otherwise-specified-forms---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule6
      potentialCases:
        id: potentialCases
        source: coronary-heart-disease-not-otherwise-specified-aborted---primary/output
  cardiomyopathy-coronary-heart-disease-not-otherwise-specified---primary:
    run: cardiomyopathy-coronary-heart-disease-not-otherwise-specified---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule7
      potentialCases:
        id: potentialCases
        source: coronary-heart-disease-not-otherwise-specified-forms---primary/output
  coronary-heart-disease-not-otherwise-specified-artery---primary:
    run: coronary-heart-disease-not-otherwise-specified-artery---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule8
      potentialCases:
        id: potentialCases
        source: cardiomyopathy-coronary-heart-disease-not-otherwise-specified---primary/output
  coronary-heart-disease-not-otherwise-specified---primary:
    run: coronary-heart-disease-not-otherwise-specified---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule9
      potentialCases:
        id: potentialCases
        source: coronary-heart-disease-not-otherwise-specified-artery---primary/output
  silent-coronary-heart-disease-not-otherwise-specified---primary:
    run: silent-coronary-heart-disease-not-otherwise-specified---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule10
      potentialCases:
        id: potentialCases
        source: coronary-heart-disease-not-otherwise-specified---primary/output
  atherosclerotic-coronary-heart-disease-not-otherwise-specified---primary:
    run: atherosclerotic-coronary-heart-disease-not-otherwise-specified---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule11
      potentialCases:
        id: potentialCases
        source: silent-coronary-heart-disease-not-otherwise-specified---primary/output
  coronary-heart-disease-not-otherwise-specified-diagnosed---primary:
    run: coronary-heart-disease-not-otherwise-specified-diagnosed---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule12
      potentialCases:
        id: potentialCases
        source: atherosclerotic-coronary-heart-disease-not-otherwise-specified---primary/output
  coronary-heart-disease-not-otherwise-specified-history---primary:
    run: coronary-heart-disease-not-otherwise-specified-history---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule13
      potentialCases:
        id: potentialCases
        source: coronary-heart-disease-not-otherwise-specified-diagnosed---primary/output
  coronary-heart-disease-not-otherwise-specified-aneurysm---primary:
    run: coronary-heart-disease-not-otherwise-specified-aneurysm---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule14
      potentialCases:
        id: potentialCases
        source: coronary-heart-disease-not-otherwise-specified-history---primary/output
  output-cases:
    run: output-cases.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule15
      potentialCases:
        id: potentialCases
        source: coronary-heart-disease-not-otherwise-specified-aneurysm---primary/output
class: Workflow
inputs:
  inputModule1:
    id: inputModule1
    doc: Js implementation unit
    type: File
  inputModule2:
    id: inputModule2
    doc: Python implementation unit
    type: File
  inputModule3:
    id: inputModule3
    doc: Python implementation unit
    type: File
  inputModule4:
    id: inputModule4
    doc: Python implementation unit
    type: File
  inputModule5:
    id: inputModule5
    doc: Python implementation unit
    type: File
  inputModule6:
    id: inputModule6
    doc: Python implementation unit
    type: File
  inputModule7:
    id: inputModule7
    doc: Python implementation unit
    type: File
  inputModule8:
    id: inputModule8
    doc: Python implementation unit
    type: File
  inputModule9:
    id: inputModule9
    doc: Python implementation unit
    type: File
  inputModule10:
    id: inputModule10
    doc: Python implementation unit
    type: File
  inputModule11:
    id: inputModule11
    doc: Python implementation unit
    type: File
  inputModule12:
    id: inputModule12
    doc: Python implementation unit
    type: File
  inputModule13:
    id: inputModule13
    doc: Python implementation unit
    type: File
  inputModule14:
    id: inputModule14
    doc: Python implementation unit
    type: File
  inputModule15:
    id: inputModule15
    doc: Python implementation unit
    type: File
outputs:
  cases:
    id: cases
    type: File
    outputSource: output-cases/output
    outputBinding:
      glob: '*.csv'
requirements:
  SubworkflowFeatureRequirement: {}
