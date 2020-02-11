def connectionString
def uccode
def lockParams

def versionText
def versionValue

pipeline{
	agent{
		label 'bdd'
	}
	environment {
		Storage = credentials('Storage_Trade_CiBot')
	}
	stages{
		stage ('Обновление тестового контура'){
			steps{
				timestamps{
					script{
						connectionString = "\"/S${env.Server1C}\\${env.Database1C}\""
						uccode = "\"123\""
						lockParams = "-lockmessage \"test\" -lockuccode ${uccode}"

						versionText = 	readFile encoding: 'UTF-8', file: 'src/cf/VERSION'
						versionValue = (versionText =~ /<VERSION>(.*)<\/VERSION>/)[0][1]
					}
					cmd("deployka session lock -ras ${env.Server1C} -rac ${env.Rac1C} -db ${env.Database1C} ${lockParams} ")
					cmd("deployka session kill -ras ${env.Server1C} -rac ${env.Rac1C} -db ${env.Database1C} ${lockParams} ")
					cmd("deployka loadrepo ${connectionString} \"${env.StoragePath}\" -storage-user ${env.Storage_Usr} -storage-pwd ${env.Storage_Psw} -uccode \"123\" -storage-ver ${versionValue}")
					cmd("deployka dbupdate ${connectionString} -allow-warnings -uccode \"123\" ")
					cmd("deployka session unlock -ras ${env.Server1C} -rac ${env.Rac1C} -db ${env.Database1C}")
				}
			}
		}
	}
}

def cmd(command) {
	if(isUnix()) {
		sh "${command}"
	} else {
		bat "chcp 65001\n${command}"
	}
}