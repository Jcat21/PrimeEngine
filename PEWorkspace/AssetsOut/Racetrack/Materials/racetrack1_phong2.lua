function fillMaterialTable(args) -- the script format requires existence of this function
args['version']=2
args['diffuse']={1.000000, 1.000000, 1.000000, 1.000000}
args['shininess']=20.000000
args['reflectivity']={0.000000, 0.000000, 0.000000}
args['specular']={0.500000, 0.500000, 0.500000}
args['emissive']={0.000000, 0.000000, 0.000000}
args['textures']={
  {'COLOR', 'DefaultMaterial_Base_Color.dds'},
} -- end textures
--notes overrides

--notes end

end
