[Mesh]
  dim = 2
  file = square.e
  uniform_refine = 4
[]

[Variables]
  active = 'convected'

  [./convected]
    order = FIRST
    family = LAGRANGE
  [../]
[]

[Kernels]
  active = 'diff conv'

  [./diff]
    type = Diffusion
    variable = convected
  [../]

  [./conv]
    type = Convection
    variable = convected
    x = 2.0
    y = 0.0
  [../]
[]

[DiracKernels]
  active = 'example_point_source'

  [./example_point_source]
    type = ExampleDirac
    variable = convected
    value = 1.0
    point = '0.2 0.3'
  [../]
[]

[BCs]
  active = 'left right'

  [./left]
    type = DirichletBC
    variable = convected
    boundary = '1'
    value = 0
  [../]

  [./right]
    type = DirichletBC
    variable = convected
    boundary = '2'
    value = 1
  [../]
[]

[Executioner]
  type = Steady
  perf_log = true
[]

[Output]
  file_base = out
  interval = 1
  exodus = true
[]
   
    
