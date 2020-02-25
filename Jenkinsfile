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
					cmd("deployka loadrepo ${connectionString} -db-user \"Администратор\" \"${env.StoragePath}\" -storage-user ${env.Storage_Usr} -storage-pwd ${env.Storage_Psw} -uccode \"123\" -storage-ver ${versionValue}")
					cmd("deployka dbupdate ${connectionString} -db-user \"Администратор\" -allow-warnings -uccode \"123\" ")
					cmd("deployka session unlock -ras ${env.Server1C} -rac ${env.Rac1C} -db ${env.Database1C}")
				}
			}
		}
		stage("Проверка поведения"){
			steps{
				timestamps{
					cmd("opm install -l vanessa-automation")
					cmd("vrunner vanessa --pathvanessa ./oscript_modules/vanessa-automation/vanessa-automation.epf --vanessasettings ./tools/VBParams.json --ibconnection ${connectionString} --db-user \"Администратор\" ")
				}
			}
		}
		stage("Дымовое тестирование"){
			steps{
				timestamps{
					cmd("opm install -l add")
					cmd("vrunner xunit ./oscript_modules/add/tests/smoke --pathxunit ./oscript_modules/add/xddTestRunner.epf --reportsxunit \"ГенераторОтчетаAllureXML{build/out/smoke/allure.xml}\" --xddExitCodePath ./build/out/junitstatus.log --ibconnection ${connectionString} --db-user \"Администратор\" --xddConfig ./tools/xUnitParams.json")
				}
			}
		}
		stage("Публикация результатов"){
			steps{
				timestamps{
					allure ([
						includeProperties: false, 
						jdk: '',
						properties: [],
						reportBuildPolicy: 'ALWAYS',
						results: [
							[path: 'build/out/allure'],
							[path: 'build/out/smoke']
						]
					])
					cucumber ([
						failedFeaturesNumber: -1, 
						failedScenariosNumber: -1, 
						failedStepsNumber: -1, 
						fileIncludePattern: 'build/out/cucumber/*.json', 
						pendingStepsNumber: -1, 
						skippedStepsNumber: -1, 
						sortingMethod: 'ALPHABETICAL', 
						undefinedStepsNumber: -1
					])
					
					cmd("pickles -f features -o build/out/pickles -l ru --df dhtml --sn \"Trade\" ")

					publishHTML ([
						allowMissing: false, 
						alwaysLinkToLastBuild: false, 
						keepAll: false, 
						reportDir: 'build/out/pickles', 
						reportFiles: 'Index.html', 
						reportName: 'HTML Report', 
						reportTitles: ''
					])

					livingDocs ([
						featuresDir: 'build/out/cucumber', 
						toc: 'LEFT'
					])
				}
			}
		}
		stage("Подготовка дистрибутива"){
			steps{
				timestamps{
					cmd("packman load-storage \"${env.StoragePath}\" -use-tool1cd -storage-v ${versionValue}")
					cmd("packman make-cf")
					cmd("packman make-dist ./tools/package.edf -setup")
					cmd("packman zip-dist -name-prefix trade -out build/out")

					archiveArtifacts artifacts: 'build/out/trade*.zip', onlyIfSuccessful: true
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