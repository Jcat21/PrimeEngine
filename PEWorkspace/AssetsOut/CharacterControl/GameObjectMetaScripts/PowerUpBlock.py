t = {}
t["mayaRep"] = "Maya/Meshes/PowerUpBlock/poweruprep.ma"

t["callerScript"] = '''
-- this script is in lua format
-- this is a meta script that fills in data that is passed to 'myScript' that in turn calls C++ function
-- some of the data can be set by default, some of the data might be required to be edited from maya
function fillMetaInfoTable(args) -- the script fromat requires existance of this function

-- user modifed data
args['myScript']="PowerUpBlock.lua"
args['myScriptPackage']="CharacterControl"

args['meshName'] = "imrod.x_imrodmesh_mesh.mesha"
args['meshPackage'] = "Default"

args['name'] = ''

end -- required
'''
